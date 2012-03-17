--consultation du catalogue-----------------

create procedure displayCatalogue( @nomCat varchar(50) ) 
as
begin
	DECLARE c_cat CURSOR FOR select produits.idcategorie, categorie.nom , produits.nom, produits.description, produits.idtva, produits.prix
							  from elementcatalogue inner join catalogue on elementcatalogue.idcatalogue = catalogue.id
							  inner join produits on elementcatalogue.idproduit = produits.id
							  inner join categorie on categorie.id = produits.idcategorie
							  where catalogue.nom = @nomCat
							  order by IDCATALOGUE
	declare @idCat int
	declare @nomCategorie varchar(200)
	declare @nom varchar(200)
	declare @description varchar(200)
	declare @idTva int
	declare @prix float
	declare @currentCatId int = -1
	
	open c_cat
	fetch c_cat into @idCat, @nomCategorie, @nom, @description, @idTva, @prix
	
	print @nomCat + ' :'
	
	while @@FETCH_STATUS = 0
	begin
		if(@currentCatId != @idCat)
		begin
			set @currentCatId = @idCat
			print char(10) + @nomCategorie + ' :'
		end
		declare @tauxTVA float = (select taux from TVA where id = @idTva)
		set @prix *= ( 1 + @tauxTVA)
		print '   - ' + @nom + ' ' + @description + ' ' + convert(varchar(10),@prix) + '�'
		fetch c_cat into @idCat, @nomCategorie, @nom, @description, @idTva, @prix
	end
	close c_cat
	deallocate c_cat
end

--affichage des categories et sous categories
create procedure displayCategories( @idCatMere int, @niveau int) 
as
begin
	declare @nextLevel int = @niveau + 1
	if (@idCatMere is NULL)
	begin
		DECLARE c_cat CURSOR local FOR select id, nom from categorie where idmere is NULL
	end
	else
	begin 
		DECLARE c_cat CURSOR local FOR select id, nom from categorie where idmere = @idCatMere
	end

	declare @idCat int
	declare @nomCategorie varchar(200)

	open c_cat
	fetch c_cat into @idCat, @nomCategorie

	while @@FETCH_STATUS = 0
	begin
		declare @decalage varchar (20) = ''
		declare @i int = 0
		while @i < @niveau
		begin
			set @decalage += '  '
			set @i += 1
		end
		print @decalage + @nomCategorie
		execute dbo.displayCategories @idCat, @nextLevel
		fetch c_cat into @idCat, @nomCategorie
	end
	close c_cat
	deallocate c_cat
end

--s�lection d'un produits, en un ou plusieurs exemplaires, dans un "panier �lectronique"---------

create procedure addProductToBasket(@idClient int, @idProduit int, @quantite int)
as
begin
	declare @idTVA int = (select idtva from produits where id = @idproduit)
	declare @tauxTVA float = (select taux from tva where id = @idTVA)
	declare @prix float = (select prix from PRODUITS where ID = @idProduit) * @quantite * (1 + @tauxTVA)
	declare @idBasket int = (select id from PANIER where idclient = @idClient) 
	if (@idBasket is NULL)
	begin
		INSERT INTO [ECommerce].[dbo].[PANIER] ([IDCLIENT])
		VALUES (@idClient)
		set @idBasket = (select @@IDENTITY as ID)
	end
	
	declare @idElemPanier int =  (select id from ELEMENTPANIER where IDPANIER = @idBasket and IDPRODUIT = @idProduit)
	if (@idElemPanier is NULL)
	begin
		INSERT INTO [ECommerce].[dbo].[ELEMENTPANIER] ([IDPANIER],[IDPRODUIT],[QUANTITE] ,[PRIX])
		VALUES (@idBasket , @idProduit, @quantite, @prix )
		set @idElemPanier = (select @@IDENTITY as ID)
	end
	else
	begin
		update ELEMENTPANIER set QUANTITE = (select QUANTITE from ELEMENTPANIER where ID = @idElemPanier) + @quantite,
								 PRIX = (select PRIX from ELEMENTPANIER where ID = @idElemPanier) + @prix
							where ID = @idElemPanier
	end
	
	declare @prixPanier float = (select PRIX from PANIER where ID = @idBasket)
	if(@prixPanier is null)
	begin
		set @prixPanier = 0.0;
	end
	set @prixPanier += @prix
	update PANIER set PRIX = @prixPanier
					where ID = @idBasket
end

--modification de la quantit� d'un produits dans un "panier �lectronique"---------
create procedure ModifyBasketQuantityProduct(@idPanier int, @idProduit int, @quantite int)
as
begin
	declare @idTVA int = (select idtva from produits where id = @idproduit)
	declare @tauxTVA float = (select taux from tva where id = @idTVA)
	declare @prix float = (select prix from PRODUITS where ID = @idProduit) * @quantite * (1 + @tauxTVA)
	declare @idElemPanier int =  (select id from ELEMENTPANIER where IDPANIER = @idPanier and IDPRODUIT = @idProduit)
	declare @oldQuantite int = (select quantite from ELEMENTPANIER where ID = @idElemPanier)
	if( @quantite = 0)
	begin
		delete from ELEMENTPANIER where ID = @idElemPanier
	end
	else
	begin
		update ELEMENTPANIER set QUANTITE = @quantite,
								 PRIX = @prix
							where ID = @idElemPanier
	end
	
	declare @prixPanier float = (select PRIX from PANIER where ID = @idPanier)
	set @prixPanier += ((select prix from PRODUITS where ID = @idProduit)*(1+@tauxTVA) * (@quantite - @oldQuantite))
	update PANIER set PRIX = @prixPanier
					where ID = @idPanier
end

--passage en caisse avec vidage du panier et calcul du montant � r�gler---------------------
alter procedure ValidateBasket( @idClient varchar(50) ) 
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
	declare @TotalCommandeHT float =0
	declare @TotalCommandeTTC float =0
	declare @TotalHT float
	declare @TotalTVA float
	declare @TotalTTC float
	declare @idTVA float
	declare @tauxTVA float

	INSERT INTO [ECommerce].[dbo].[COMMANDE](IDCLIENT,DATE_CDE)
	VALUES (@idClient,GETDATE())
	
	set @idCommande = (select @@IDENTITY as id)
	
	
	
	DECLARE c_elemtpanier CURSOR FOR 
								select elementpanier.idproduit, produits.ref, produits.Nom, produits.idtva,produits.prix, elementpanier.quantite 
								from elementpanier , panier, produits
								where panier.id = elementpanier.idpanier 
								and panier.idclient = @idClient
								and produits.id = elementpanier.idproduit
													

	open c_elemtpanier
	fetch c_elemtpanier into @idProduit, @RefProduit, @NomProduit, @idTVA,@PrixProduit, @Quantite
	
	while @@FETCH_STATUS = 0
	begin
		if(@currentIdPanier != @idProduit)
		begin
			set @tauxTVA =(select taux from TVA where id = @idTVA) --0.196
			set @currentIdPanier = @idProduit
			set @TotalHT  = @PrixProduit * @Quantite
			set @TotalTTC  = @totalHT * (1 + @tauxTVA)
			set @TotalCommandeHT += @totalHT
			set @TotalCommandeTTC += @totalTTC
			
			Insert into ECommerce.dbo.LIGNE_CDE (IDCOMMANDE, IDPRODUIT,IDTVA,QUANTITE, PRIX_U, TOTALHT, TOTALTVA, TOTALTTC)
			VALUES(@idCommande,@idProduit,@idTVA,@Quantite,@PrixProduit,@totalHT, @totalTTC - @totalHT, @totalTTC)
		end	
				
		fetch c_elemtpanier into @idProduit, @RefProduit, @NomProduit, @idTVA,@PrixProduit, @Quantite
	end
	close c_elemtpanier
	deallocate c_elemtpanier
	
	UPDATE [ECommerce].[dbo].[COMMANDE]
	 SET [TOTALHT] = @TotalCommandeHT
		  ,[TOTALTVA] = @TotalCommandeTTC - @TotalCommandeHT
		  ,[TOTALTTC] = @TotalCommandeTTC
	 WHERE [ID] = @idCommande
	 
	Delete from elementpanier where idpanier=(select id from panier where idclient=@idClient)
	update panier set prix =0 where idclient=@idclient
	
	execute dbo.displayCommande @idCommande
end


-- gestion des coordonn�es postales des clients--------------

	--ajout
	create procedure addAdressToClient(@idClient int, @nomAddr varchar(50), @numRue int, @rue varchar(100), @cp varchar(5), @ville varchar(50))
	as
	begin
		insert into ADRESSE (IDCLIENT,NOM,NUM,RUE,CP,VILLE)
		values(@idClient, @nomAddr, @numRue, @rue,@cp, @ville)
	end

	--modification
	create procedure modifyAdress(@idAddresse int, @nomAddr varchar(50), @numRue int, @rue varchar(100), @cp varchar(5), @ville varchar(50))
	as
	begin
		update ADRESSE set NOM = @nomAddr, NUM = @numRue, RUE = @rue, CP = @cp, VILLE = @ville
					   where ID = @idAddresse
	end

	--suppression
	create procedure deleteAdress(@idAdresse int)
	as
	begin
		delete from ADRESSE
		where ID = @idAdresse
	end

-- gestion des coordonn�es bancaires

	--ajout
	create procedure addCBToClient(@idClient int, @nomCpt varchar(50), @numCpt varchar(20), @dateExp date, @cle int)
	as
	begin
		insert into COMPTE_BANCAIRE(IDCLIENT,NOM_COMPTE,NUM_COMPTE,DATE_EXP,CLE)
		values(@idClient, @nomcpt, @numCpt, @dateExp,@cle)
	end

	--modification
	create procedure modifyCB(@idCB int, @nomCpt varchar(50), @numCpt varchar(20), @dateExp date, @cle int)
	as
	begin
		update COMPTE_BANCAIRE set NOM_COMPTE = @nomCpt, NUM_COMPTE = @numCpt, DATE_EXP = @dateExp, CLE = @cle
					   where ID = @idCB
	end

	--suppression
	create procedure deleteCB(@idCB int)
	as
	begin
		delete from COMPTE_BANCAIRE
		where ID = @idCB
	end

-- gestion et authentification des connexions sur le site------------------
create procedure checkLogin(@login varchar(50), @pwd varchar(50))
as
begin
	if not exists(select * from client where login = @login and pwd = @pwd)
	begin
		print 'Mauvais Login/Mot de passe'
	end
	else
	begin
		print 'Login OK'
	end
end

-- option de pr�sentation de l'historique des commandes du client-----------

--affichage de la liste des commande d'un client
create procedure listeCommandes(@idClient int)
as
begin
	DECLARE c_cde CURSOR FOR select COMMANDE.DATE_CDE, COMMANDE.TOTALTTC 
							 from COMMANDE 
							 where COMMANDE.IDCLIENT = @idClient 
							 --order by COMMANDE.DATE_CDE desc
	declare @dateCde date
	declare @montant float
	
	open c_cde
	fetch c_cde into @dateCde, @montant
	while @@FETCH_STATUS = 0
	begin
		print 'le ' + convert(varchar(10),@dateCde) + ' : ' + convert(varchar(10),@montant) + '�'
		fetch c_cde into @dateCde, @montant
	end
	close c_cde
	deallocate c_cde
end

--affichage du d�tial d'une commande

create procedure displayCommande(@idCommande int)
as
begin
	DECLARE c_cde CURSOR FOR select produits.nom, ligne_cde.quantite, ligne_cde.totalttc
							  from ligne_cde inner join produits on ligne_cde.idproduit = produits.id
							  where ligne_cde.idcommande = @idCommande

	declare @nom varchar(200)
	declare @quantite int
	declare @prix float
	
	open c_cde
	fetch c_cde into @nom, @quantite, @prix
	
	declare @dateCde date = (select date_cde from commande where id = @idCommande)
	declare @total float = (select TOTALTTC from commande where id = @idCommande)
	print 'Commande du ' + convert(varchar(50),@dateCde) + ' de ' + convert(varchar(10),@total) + '� :'
	
	while @@FETCH_STATUS = 0
	begin
		print '   - ' + @nom + ', quantit� : ' + convert(varchar(10),@quantite) + ', total ' + convert(varchar(10),@prix) +'�' 
		fetch c_cde into @nom, @quantite, @prix
	end
	close c_cde
	deallocate c_cde
end