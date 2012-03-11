
/*alter procedure displayCommande(@idCommande int)
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
	print 'Commande du ' + convert(varchar(50),@dateCde) + ' de ' + convert(varchar(10),@total) + '€ :'
	
	while @@FETCH_STATUS = 0
	begin
		print '   - ' + @nom + ', quantité : ' + convert(varchar(10),@quantite) + ', total ' + convert(varchar(10),@prix) +'€' 
		fetch c_cde into @nom, @quantite, @prix
	end
	close c_cde
	deallocate c_cde
end*/


execute dbo.displayCommande 1