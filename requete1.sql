alter procedure displayCatalogue( @nomCat varchar(50) ) 
as
begin
	DECLARE c_cat CURSOR FOR select produits.idcategorie, produits.nom, produits.description, produits.prix
							  from elementcatalogue inner join catalogue on elementcatalogue.idcatalogue = catalogue.id
							  inner join produits on elementcatalogue.idproduit = produits.id
							  where catalogue.nom = @nomCat
							  order by IDCATALOGUE
	declare @idCat int
	declare @nom varchar(200)
	declare @description varchar(200)
	declare @prix float
	
	open c_cat
	fetch c_cat into @idCat, @nom, @description, @prix
	while @@FETCH_STATUS = 0
	begin
		print 'produits : ' + @nom + @description
		fetch c_cat into @idCat, @nom, @description, @prix
	end
end

--execute dbo.displayCatalogue 'Rentrée Scolaire'