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


--s�lection d'un ou plusieurs produits, en un ou plusieurs exemplaires, dans un "panier �lectronique"---------







--passage en caisse avec vidage du panier et calcul du montant � r�gler---------------------








-- gestion des coordonn�es bancaires et postales des clients--------------





-- gestion et authentification des connexions sur le site------------------







-- option de pr�sentation de l'historique des commandes du client-----------



