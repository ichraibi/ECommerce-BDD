USE [ECommerce] 
GO

------TVA-------------------------------
INSERT INTO [ECommerce].[dbo].[TVA]
           ([TAUX], STATUT)
     VALUES
           (0.196,1)
GO

INSERT INTO [ECommerce].[dbo].[TVA]
           ([TAUX],STATUT)
     VALUES
           (0.050,0)
GO
--Client
INSERT INTO [ECommerce].[dbo].[CLIENT]
           ([LOGIN]
           ,[PWD]
           ,[NOM]
           ,[PRENOM]
           ,[DATE_NAISSANCE]
           ,[EMAIL])
     VALUES
           ('Alex',
           'alex33',
           'L�aut�',
           'Alexis',
           '19890601',
           'lex33@free.fr')
GO
INSERT INTO [ECommerce].[dbo].[CLIENT]
           ([LOGIN]
           ,[PWD]
           ,[NOM]
           ,[PRENOM]
           ,[DATE_NAISSANCE]
           ,[EMAIL])
     VALUES
           ('Ikram',
           'krikri',
           'Chraibi',
           'Ikram',
           '19881123',
           'ichraibi@epsi.fr')
GO
INSERT INTO [ECommerce].[dbo].[CLIENT]
           ([LOGIN]
           ,[PWD]
           ,[NOM]
           ,[PRENOM]
           ,[DATE_NAISSANCE]
           ,[EMAIL])
     VALUES
           ('bobby',
           'sponge',
           'L�ponge',
           'Bob',
           '19881122',
           'bob@leponge.fr')
GO

--Cat�gorie
INSERT INTO [ECommerce].[dbo].[CATEGORIE]
           ([IDMERE]
           ,[NOM])
     VALUES
           (NULL,
           'Composant')
GO

		INSERT INTO [ECommerce].[dbo].[CATEGORIE]
				   ([IDMERE]
				   ,[NOM])
			 VALUES
				   ((SELECT ID FROM CATEGORIE WHERE NOM = 'Composant'),
				   'Processeur')
		GO

		INSERT INTO [ECommerce].[dbo].[CATEGORIE]
				   ([IDMERE]
				   ,[NOM])
			 VALUES
				   ((SELECT ID FROM CATEGORIE WHERE NOM = 'Composant'),
				   'Carte M�re')
		GO

		INSERT INTO [ECommerce].[dbo].[CATEGORIE]
				   ([IDMERE]
				   ,[NOM])
			 VALUES
				   ((SELECT ID FROM CATEGORIE WHERE NOM = 'Composant'),
				   'Carte Graphique')
		GO

		INSERT INTO [ECommerce].[dbo].[CATEGORIE]
				   ([IDMERE]
				   ,[NOM])
			 VALUES
				   ((SELECT ID FROM CATEGORIE WHERE NOM = 'Composant'),
				   'M�moire')
		GO

		INSERT INTO [ECommerce].[dbo].[CATEGORIE]
				   ([IDMERE]
				   ,[NOM])
			 VALUES
				   ((SELECT ID FROM CATEGORIE WHERE NOM = 'Composant'),
				   'Boitier et Alimentation')
		GO


INSERT INTO [ECommerce].[dbo].[CATEGORIE]
           ([IDMERE]
           ,[NOM])
     VALUES
           (NULL,
           'P�riph�riques')
GO

		INSERT INTO [ECommerce].[dbo].[CATEGORIE]
				   ([IDMERE]
				   ,[NOM])
			 VALUES
				   ((SELECT ID FROM CATEGORIE WHERE NOM = 'P�riph�riques'),
				   'Imprimante')
		GO

		INSERT INTO [ECommerce].[dbo].[CATEGORIE]
				   ([IDMERE]
				   ,[NOM])
			 VALUES
				   ((SELECT ID FROM CATEGORIE WHERE NOM = 'P�riph�riques'),
				   'Clavier et Souris')
		GO

		INSERT INTO [ECommerce].[dbo].[CATEGORIE]
				   ([IDMERE]
				   ,[NOM])
			 VALUES
				   ((SELECT ID FROM CATEGORIE WHERE NOM = 'P�riph�riques'),
				   'Audio')
		GO

		INSERT INTO [ECommerce].[dbo].[CATEGORIE]
				   ([IDMERE]
				   ,[NOM])
			 VALUES
				   ((SELECT ID FROM CATEGORIE WHERE NOM = 'P�riph�riques'),
				   'Moniteur')
		GO

		INSERT INTO [ECommerce].[dbo].[CATEGORIE]
				   ([IDMERE]
				   ,[NOM])
			 VALUES
				   ((SELECT ID FROM CATEGORIE WHERE NOM = 'P�riph�riques'),
				   'Manette de jeu')
		GO

INSERT INTO [ECommerce].[dbo].[CATEGORIE]
           ([IDMERE]
           ,[NOM])
     VALUES
           (NULL,
           'PC de bureau')
GO

INSERT INTO [ECommerce].[dbo].[CATEGORIE]
           ([IDMERE]
           ,[NOM])
     VALUES
           (NULL,
           'PC Portable')
GO

--Produit
INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Processeur'),
           (select id from TVA where statut =1),
           'Intel Core i7 2600k',
           'Processeur intel 4 cores',
           '01232546655',
           'http://ptitponey.fr/photo.jpg',
           260.99,
           'INC72600K'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Processeur'),
            (select id from TVA where statut =1),
           'AMD FX 8150',
           'Processeur AMD 8 cores',
           '01568546655',
           'http://ptitponey.fr/photo1.jpg',
           240.99,
           'AMDFX8150'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Carte M�re'),
            (select id from TVA where statut =1),
           'ASUS p8p67 pro',
           'Carte m�re ASUS socket 1155',
           '98765546655',
           'http://ptitponey.fr/photo2.jpg',
           130.99,
           'ASP8PRO'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Carte M�re'),
            (select id from TVA where statut =1),
           'MSI Big Bang Z68',
           'Carte m�re MSI socket 1155',
           '98457546655',
           'http://ptitponey.fr/photo3.jpg',
           180.99,
           'MSIBBZ68'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Carte Graphique'),
            (select id from TVA where statut =1),
           'AMD HD 7970',
           'Carte m�re AMD Haut De Gamme',
           '98451126655',
           'http://ptitponey.fr/photo4.jpg',
           480.99,
           'AMD7970'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Carte Graphique'),
            (select id from TVA where statut =1),
           'nVidia GTX 580',
           'Carte m�re nVidia Haut De Gamme',
           '98450226655',
           'http://ptitponey.fr/photo5.jpg',
           380.99,
           'NVGTX580'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'M�moire'),
            (select id from TVA where statut =1),
           'Crucial 2*4Go',
           'M�moire Crucial 8GO',
           '98450224585',
           'http://ptitponey.fr/photo6.jpg',
           50.99,
           'CRU8GO2X4'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'M�moire'),
            (select id from TVA where statut =1),
           'Corsair Vengance 2*4Go',
           'M�moire Corsair 8GO',
           '9555022445',
           'http://ptitponey.fr/photo7.jpg',
           49.99,
           'COR8GO2X4'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Boitier et Alimentation'),
            (select id from TVA where statut =1),
           'Corsair AX750',
           'Alimentation Corsair 750W',
           '9554578045',
           'http://ptitponey.fr/photo8.jpg',
           149.99,
           'CORAX750'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Boitier et Alimentation'),
            (select id from TVA where statut =1),
           'Cooler Master HAF-X',
           'Boitier Corsair Cooler Master HAF-X',
           '9511445045',
           'http://ptitponey.fr/photo9.jpg',
           139.99,
           'CMHAFX'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Imprimante'),
            (select id from TVA where statut =1),
           'Epson Stylus SX3250',
           'Imprimante multifonctions epson',
           '95189532215',
           'http://ptitponey.fr/photo10.jpg',
           129.99,
           'EPSX3250'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]           
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Imprimante'),
            (select id from TVA where statut =1),
           'Lexmark x1180',
           'Imprimante multifonctions lexmark',
           '9518922335',
           'http://ptitponey.fr/photo11.jpg',
           69.99,
           'LEXX1180'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Clavier et Souris'),
            (select id from TVA where statut =1),
           'Logitech G15',
           'Clavier gamer logitech',
           '951891515',
           'http://ptitponey.fr/photo12.jpg',
           49.99,
           'LOG15'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Clavier et Souris'),
            (select id from TVA where statut =1),
           'Razer DeathAdder',
           'Souris gamer razer',
           '95158961515',
           'http://ptitponey.fr/photo13.jpg',
           59.99,
           'RAZDA'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Audio'),
            (select id from TVA where statut =1),
           'Logitech z5500',
           'Kit 5.1 logitech',
           '9515895500',
           'http://ptitponey.fr/photo14.jpg',
           329.99,
           'LOZ5500'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Audio'),
            (select id from TVA where statut =1),
           'Altec Lansing 2.1',
           'Kit 2.1 Altec Lansing',
           '9515821220',
           'http://ptitponey.fr/photo14.jpg',
           129.99,
           'AL21'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Moniteur'),
            (select id from TVA where statut =1),
           'LG 2342P',
           'Moniteur LG 23" 3D',
           '9517845550',
           'http://ptitponey.fr/photo15.jpg',
           329.99,
           'LG2342P'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Moniteur'),
            (select id from TVA where statut =1),
           'Samsung S24A450BW',
           'Moniteur Samsung 24"',
           '951244500',
           'http://ptitponey.fr/photo16.jpg',
           229.99,
           'SAMS24A'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
            ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Manette de jeu'),
            (select id from TVA where statut =1),
           'Microsoft Xbox 360 Filaire',
           'Manette de jeu PC/Xbox 360 Microsoft',
           '9512360990',
           'http://ptitponey.fr/photo17.jpg',
           29.99,
           'MS360F'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Manette de jeu'),
            (select id from TVA where statut =1),
           'Microsoft Xbox 360 sans fil',
           'Manette de jeu PC/Xbox 360 Microsoft',
           '9512364550',
           'http://ptitponey.fr/photo18.jpg',
           39.99,
           'MS360SF'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'PC de bureau'),
            (select id from TVA where statut =1),
           'AlienWare x51',
           'PC de bureau Gamer AlienWare',
           '9512312212',
           'http://ptitponey.fr/photo19.jpg',
           2539.99,
           'AWX51'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
           ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'PC de bureau'),
            (select id from TVA where statut =1),
           'ASUS ET2410INTS',
           'PC de bureau tout en un Asus',
           '951298566',
           'http://ptitponey.fr/photo20.jpg',
           939.99,
           'ASET2410'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
            ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'PC Portable'),
            (select id from TVA where statut =1),
           'AlienWare m11x',
           'PC portable AlienWare 11"',
           '9512112233',
           'http://ptitponey.fr/photo21.jpg',
           1039.99,
           'AWM11X'
           )
GO

INSERT INTO [ECommerce].[dbo].[PRODUITS]
            ([IDCATEGORIE]
           ,[IDTVA]
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'PC Portable'),
            (select id from TVA where statut =1),
           'ASUS G53SX',
           'PC portable ASUS 15"',
           '9515588883',
           'http://ptitponey.fr/photo22.jpg',
           1139.99,
           'ASG53SX'
           )
GO



------------CATALOGUE ----------
INSERT INTO [ECommerce].[dbo].[CATALOGUE]
           ([NOM]
           ,[DESCRIPTION])
     VALUES
           ('Catalogue de Noel'
           ,'Pour Noel faites vous plaisir !! Offrez du reve !')
GO

INSERT INTO [ECommerce].[dbo].[CATALOGUE]
           ([NOM]
           ,[DESCRIPTION])
     VALUES
           ('Rentr�e Scolaire'
           ,'Soyez pr�t et �quip� pour cette nouvelle ann�e scolaire')
GO

INSERT INTO [ECommerce].[dbo].[CATALOGUE]
           ([NOM]
           ,[DESCRIPTION])
     VALUES
           ('Tous les produits'
           ,'Catalogue de tous les produit')
GO
---- ADRESSE---------------------
INSERT INTO [ECommerce].[dbo].[ADRESSE]
           ([IDCLIENT]
           ,[NOM]
           ,[NUM]
           ,[RUE]
           ,[CP]
           ,[VILLE])
     VALUES
           ((select id from client where NOM ='L�aut�')
           ,'Adresse Personnelle'
           ,71
           ,'Pelouse de douet'
           ,'33000'
           ,'Bordeaux')
GO

INSERT INTO [ECommerce].[dbo].[ADRESSE]
           ([IDCLIENT]
           ,[NOM]
           ,[NUM]
           ,[RUE]
           ,[CP]
           ,[VILLE])
     VALUES
           ((select id from client where NOM ='L�aut�')
           ,'Addresse Professionnelle'
           ,12
           ,'Bordeaux Lax'
           ,'33000'
           ,'Bordeaux')
GO
INSERT INTO [ECommerce].[dbo].[ADRESSE]
           ([IDCLIENT]
           ,[NOM]
           ,[NUM]
           ,[RUE]
           ,[CP]
           ,[VILLE])
     VALUES
           ((select id from client where NOM ='Chraibi')
           ,'Ma Maison'
           ,36
           ,'M�rignac'
           ,'33000'
           ,'Bordeaux')
GO
INSERT INTO [ECommerce].[dbo].[ADRESSE]
           ([IDCLIENT]
           ,[NOM]
           ,[NUM]
           ,[RUE]
           ,[CP]
           ,[VILLE])
     VALUES
           ((select id from client where NOM ='Chraibi')
           ,'Chez mes parents'
           ,20
           ,'Rue de Nintendo'
           ,'44100'
           ,'Nantes')
GO
INSERT INTO [ECommerce].[dbo].[ADRESSE]
           ([IDCLIENT]
           ,[NOM]
           ,[NUM]
           ,[RUE]
           ,[CP]
           ,[VILLE])
     VALUES
           ((select id from client where NOM ='L�ponge')
           ,'Maison'
           ,2
           ,'Rue du Commerce'
           ,'78995'
           ,'PARIS')
GO

------COMPTE BANCAIRE-----------
INSERT INTO [ECommerce].[dbo].[COMPTE_BANCAIRE]
           ([IDCLIENT]
           ,[NOM_COMPTE]
           ,[NUM_COMPTE]
           ,[DATE_EXP]
           ,[CLE])
     VALUES
           ((select id from client where NOM ='L�aut�')
           ,'Leaute Alexis'
           ,'1234567891'
           ,'20131001'
           ,'02')
GO

INSERT INTO [ECommerce].[dbo].[COMPTE_BANCAIRE]
           ([IDCLIENT]
           ,[NOM_COMPTE]
           ,[NUM_COMPTE]
           ,[DATE_EXP]
           ,[CLE])
     VALUES
           ((select id from client where NOM ='L�aut�')
           ,'Entreprise Alexis'
           ,'0987654321'
           ,'20121201'
           ,'03')
GO
INSERT INTO [ECommerce].[dbo].[COMPTE_BANCAIRE]
           ([IDCLIENT]
           ,[NOM_COMPTE]
           ,[NUM_COMPTE]
           ,[DATE_EXP]
           ,[CLE])
     VALUES
           ((select id from client where NOM ='Chraibi')
           ,'Chraibi Kaadoud Ikram'
           ,'666666666'
           ,'20130101'
           ,'04')
GO
INSERT INTO [ECommerce].[dbo].[COMPTE_BANCAIRE]
           ([IDCLIENT]
           ,[NOM_COMPTE]
           ,[NUM_COMPTE]
           ,[DATE_EXP]
           ,[CLE])
     VALUES
           ((select id from client where NOM ='L�ponge')
           ,'L�ponge Bob'
           ,'999999999'
           ,'20120601'
           ,'05')
GO

---ELEMENT CATALOGUE----------------------------------
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (1
           ,1)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (1
           ,2)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (1
           ,3)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (1
           ,4)
GO

INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (2
           ,5)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (2
           ,6)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (2
           ,7)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (2
           ,8)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,1)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,2)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,3)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,4)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,5)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,6)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,7)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,8)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,9)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,10)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,11)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,12)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,13)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,14)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,15)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,16)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,17)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,18)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,19)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,20)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,21)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,22)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,23)
GO
INSERT INTO [ECommerce].[dbo].[ELEMENTCATALOGUE]
           ([IDCATALOGUE]
           ,[IDPRODUIT])
     VALUES
           (3
           ,24)
GO


