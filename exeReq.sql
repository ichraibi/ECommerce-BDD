
--consultation du catalogue-----------------

execute dbo.displayCatalogue 'Tous les produits'


--s�lection d'un ou plusieurs produits, en un ou plusieurs exemplaires, dans un "panier �lectronique"---------

execute dbo.addProductToBasket 3,1,2

execute dbo.ModifyBasketQuantityProduct 3,1,1


--passage en caisse avec vidage du panier et calcul du montant � r�gler---------------------

execute ValidateBasket 3 

-- gestion des coordonn�es bancaires et postales des clients--------------

execute dbo.addAdressToClient 1,'maison',6,'rue de magnol','33290','blanquefort'
execute dbo.modifyAdress 1,'maison',6,'rue de magnol','33290','blanquefort'



-- gestion et authentification des connexions sur le site------------------



-- option de pr�sentation de l'historique des commandes du client-----------



