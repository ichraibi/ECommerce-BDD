--consultation du catalogue-----------------

create function displayCatalogue( @nomCat varchar(50) ) 
returns void
as
begin
	print(select produits.* 
	from elementcatalogue inner join catalogue on elementcatalogue.idcatalogue = catalogue.id
						  inner join produits on elementcatalogue.idproduit = produits.id
	where catalogue.nom = @nomCat)
end


--sélection d'un ou plusieurs produits, en un ou plusieurs exemplaires, dans un "panier électronique"---------







--passage en caisse avec vidage du panier et calcul du montant à régler---------------------








-- gestion des coordonnées bancaires et postales des clients--------------





-- gestion et authentification des connexions sur le site------------------







-- option de présentation de l'historique des commandes du client-----------



