
create procedure ValidateBasket( @idClient varchar(50) ) 
as
begin

	declare @idCommande int
	declare @idProduit int
	declare @RefProduit varchar(200)
	declare @NomProduit varchar(200)
	declare @Quantite int
	declare @PriXElementPanier float
	declare @PrixProduit float
	declare @currentIdPanier int = -1
	declare @TotalCommande float =0
	declare @TotalHT float
	declare @TotalTVA float
	declare @TotalTTC float
	declare @idTVA float
	declare @tauxTVA float

	INSERT INTO [ECommerce].[dbo].[COMMANDE](IDCLIENT,DATE_CDE)
	VALUES (@idClient,GETDATE())
	
	set @idCommande = (select @@IDENTITY as id)
	
	
	
	DECLARE c_elemtpanier CURSOR FOR 
								select elementpanier.idproduit, produits.ref, produits.Nom,produits.prix, elementpanier.quantite, elementpanier.prix 
								from elementpanier , panier, produits
								where panier.id = elementpanier.idpanier 
								and panier.idclient = 1
								and produits.id = elementpanier.idproduit
													
	
	set @tauxTVA =(select taux from TVA where STATUT='Actif') --0.196
	set @idTVA = (select ID from TVA where STATUT='Actif')
	open c_elemtpanier
	fetch c_elemtpanier into @idProduit, @RefProduit, @NomProduit,@PrixProduit, @Quantite, @PriXElementPanier
	
	print  'Les elements du panier :'
	
	while @@FETCH_STATUS = 0
	begin
		if(@currentIdPanier != @idProduit)
		begin
		
			set @currentIdPanier = @idProduit
			set @TotalCommande += @PriXElementPanier
			print ' -> ' + @RefProduit + ' :'++ @NomProduit + ' ' + convert(varchar(20),@Quantite) + ' ' + convert(varchar(20),@PriXElementPanier) + '€'
			
			Insert into ECommerce.dbo.LIGNE_CDE (IDCOMMANDE, IDPRODUIT,IDTVA,QUANTITE, PRIX_U, TOTALHT, TOTALTVA, TOTALTTC)
			VALUES(@idCommande,@idProduit,@IdTVA,@Quantite,@PrixProduit,@PriXElementPanier, @PriXElementPanier*@tauxTVA, @PriXElementPanier+@PriXElementPanier*@tauxTVA)
		end	
				
		fetch c_elemtpanier into @idProduit, @RefProduit, @NomProduit,@PrixProduit, @Quantite, @PriXElementPanier
	end
	close c_elemtpanier
	deallocate c_elemtpanier
	
	UPDATE [ECommerce].[dbo].[COMMANDE]
	 SET [TOTALHT] = @TotalCommande
		  ,[TOTALTVA] = @TotalCommande*@tauxTVA
		  ,[TOTALTTC] = @TotalCommande+@TotalCommande*@tauxTVA
	 WHERE [ID] = @idCommande
	 
	Delete from elementpanier where idpanier=(select id from panier where idclient=@idClient)
	update panier set prix =0 where idclient=@idclient
	
	/*optionnel pour l'affichage*/
	declare @nom varchar(200)
	declare @qte int
	declare @prix float
	
	DECLARE c_cde CURSOR FOR select produits.nom, ligne_cde.quantite, ligne_cde.totalttc
							  from ligne_cde inner join produits on ligne_cde.idproduit = produits.id
							  where ligne_cde.idcommande = @idCommande
	
	open c_cde
	fetch c_cde into @nom, @quantite, @prix
		print ' Voici la commande de :'+@idclient
		while @@FETCH_STATUS = 0
		begin
			print '   - ' + @nom + ', quantité : ' + convert(varchar(10),@qte) + ', total ' + convert(varchar(10),@prix) +'€' 
			fetch c_cde into @nom, @qte, @prix
		end
	close c_cde
	deallocate c_cde
end



--execute ValidateBasket 1





















