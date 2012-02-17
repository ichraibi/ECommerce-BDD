--Client
INSERT INTO [ECommerce].[dbo].[CLIENT]
           ([NOM]
           ,[PRENOM]
           ,[DATE_NAISSANCE]
           ,[EMAIL])
     VALUES
           ('L�aut�',
           'Alexis',
           '19890601',
           'lex33@free.fr')
GO
INSERT INTO [ECommerce].[dbo].[CLIENT]
           ([NOM]
           ,[PRENOM]
           ,[DATE_NAISSANCE]
           ,[EMAIL])
     VALUES
           ('Chraibi',
           'Ikram',
           '19881123',
           'ichraibi@epsi.fr')
GO
INSERT INTO [ECommerce].[dbo].[CLIENT]
           ([NOM]
           ,[PRENOM]
           ,[DATE_NAISSANCE]
           ,[EMAIL])
     VALUES
           ('L�ponge',
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Processeur'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Processeur'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Carte M�re'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Carte M�re'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Carte Graphique'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Carte Graphique'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'M�moire'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'M�moire'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Boitier et Alimentation'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Boitier et Alimentation'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Imprimante'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Imprimante'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Clavier et Souris'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Clavier et Souris'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Audio'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Audio'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Moniteur'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Moniteur'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Manette de jeu'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'Manette de jeu'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'PC de bureau'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'PC de bureau'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'PC Portable'),
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
           ,[NOM]
           ,[DESCRIPTION]
           ,[CODE_BARRE]
           ,[LIEN_PHOTO]
           ,[PRIX]
           ,[REF])
     VALUES
           ((SELECT ID FROM CATEGORIE WHERE NOM = 'PC Portable'),
           'ASUS G53SX',
           'PC portable ASUS 15"',
           '9515588883',
           'http://ptitponey.fr/photo22.jpg',
           1139.99,
           'ASG53SX'
           )
GO

------TVA
INSERT INTO [ECommerce].[dbo].[TVA]
           ([TAUX],[DATE_VAL])
     VALUES
           (0.196 ,'19990101')
GO

INSERT INTO [ECommerce].[dbo].[TVA]
           ([TAUX],[DATE_VAL])
     VALUES
           (0.005 ,'19990202')
GO

------------CATALOGUE ----------
INSERT INTO [ECommerce].[dbo].[CATALOGUE]
           ([NOM]
           ,[DESCRIPTION])
     VALUES
           ('Catalogue de Noel'
           ,'Pour Noel faites vous plaisir !! promotion hors normes')
GO

INSERT INTO [ECommerce].[dbo].[CATALOGUE]
           ([NOM]
           ,[DESCRIPTION])
     VALUES
           ('Rentr�e Scolaire'
           ,'Soyez pr�t et �quip� pour cette nouvelle ann�e scolaire')
GO
