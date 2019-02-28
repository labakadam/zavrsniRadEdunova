drop database if exists zavrsniRad;
create database zavrsniRad character set utf8 collate utf8_general_ci;
# mysql -uedunova -pedunova --default_character_set=utf8 < c:\users\labak\documents\adam\zavrsniradedunova\zavrsnirad.sql
use zavrsniRad;
create table avioKompanija(
				id 					int not null primary key auto_increment,
				naziv               varchar(50) not null,
				let 				varchar(50) not null,
				avion 				varchar(50) not null,
				zaposlenik			int not null,
				oib 				char(11) not null,
				iban 				char(21) not null,
				osiguranje          int not null
);
create table zaposlenik(
				id 					int not null primary key auto_increment,
				avioKompanija       int not null,
				ime 				varchar(50) not null,
				prezime 			varchar(50) not null,
				email 				varchar(50) not null,
				brojMobitela 		varchar(20),
				brojUgovora 		varchar(5),
				oib 				char(11)
);
create table korisnik(
				id 					int not null primary key auto_increment,
				ime 				varchar(50) not null,
				prezime 			varchar(50) not null,
				oib 				char(11) not null,
				email 				varchar(50) not null,
				brojMobitela 		varchar(20),
				osiguranje          int not null
);
create table osiguranje(
				id 					int not null primary key auto_increment,
				naziv		 		varchar(50) not null,
				vrsta 				varchar(50) not null,
				iban				char(21) not null,
				oib 				char(11)
);
create table korisnik_avioKompanija(
				korisnik 			int not null,
				avioKompanija	 	int not null,
				oznakaSjedala       varchar(50) not null,
				hrana               boolean,
				pice                boolean,
				prtljaga            boolean
);

	alter table korisnik 							add foreign key (osiguranje)		references osiguranje(id);
	alter table korisnik_avioKompanija 			    add foreign key (korisnik)		    references korisnik(id);
	alter table korisnik_avioKompanija       		add foreign key (avioKompanija) 	references avioKompanija(id);
	alter table avioKompanija 						add foreign key (osiguranje) 		references osiguranje(id);
	alter table avioKompanija 						add foreign key (zaposlenik)   	    references zaposlenik(id);


#Osiguranje
insert into osiguranje(id,naziv,vrsta,iban,oib) 
	values	(1,'Life osiguranje','Putničko osiguranje','HR2100255500001445856','858888633257'),
			(2,'Life osiguranje','Zrakoplovno osiguranje','HR2100255500001445856','858888633257');

#Zaposlenik
insert into zaposlenik(id,avioKompanija,ime,prezime,email,brojMobitela,brojUgovora,oib) 
	values	(1,1,'Marko','Marković','markomarkovic@gmail.com','0911852128','12506','12598745632'),
            (2,2,'Marko','Marković','markomarkovic@gmail.com','0911852128','00256','12598745632'),
			(3,3,'Marko','Marković','markomarkovic@gmail.com','0911852128','01452','12598745632');	

#Avio-kompanija
insert into avioKompanija(id,naziv,let,avion,zaposlenik,oib,iban,osiguranje)
	values	(1,'Wizz-air','Osijek-Basel','Airbus A320-200',1,'23154685236','HR451245880002547855874',2),
	        (2,'Easy-jet','Osijek-Stuttgart','Airbus A320-200',1,'547859658956','HR2544587441222554877',2),
			(3,'German-wings','Osijek-Split','Airbus A320-200',1,'125444145214','HR22225478569854512547',2);

#Korisnik
insert into korisnik(id,ime,prezime,oib,email,brojMobitela,osiguranje) 
	values	(1,'Kristijan','Rebić','254896523694','kristijanrebic@gmail.com','0994320700',1),
	        (2,'Pero','Molnar','14587458544','peromolnar@gmail.com','0919799605',1),
			(3,'Josip','Kunić','54854965895','josipkunic@gmail.com','0911852119',1),
			(4,'Antun','Babić','14555544114','antunbabic@gmail.com','0981852120',1),
			(5,'Svetislav','Morenić','54785698552','svetislavmorenic@gmail.com','0974125632',1),
			(6,'Branimir','Filipović','52454245469','branislavfilipovic@gmail.com','0955265263',1),
			(7,'Kristijan','Mikić','12457898653','kristijanmikic@gmail.com','0994320700',1),
	        (8,'Perica','Mlinar','12326545986','pericamlinar@gmail.com','0919799605',1),
			(9,'Josip','Rakitić','21587965423','josiprakitic@gmail.com','0911852119',1),
			(10,'Đuro','Babić','55522300047','durobabic@gmail.com','0981852120',1),
			(11,'Svetislav','Paljenić','45871522300','svetislavpaljenic@gmail.com','0974125632',1),
			(12,'Branimir','Živković','00143639652','branimirzivkovic@gmail.com','0955265263',1),
			(13,'Kiki','Mamić','254896454545','kikimamic@gmail.com','0994355700',1),
	        (14,'Mimi','Mlinarević','45457458544','mimimlinarevic@gmail.com','0919000605',1),
			(15,'Jasmin','Bažant','78004965895','jasminbazant@gmail.com','0911801019',1),
			(16,'Robert','Bobić','14500044114','robertbobic@gmail.com','0981002120',1),
			(17,'Tomo','Sudar','54785000552','tomosudar@gmail.com','0974123256',1),
			(18,'Marija','Jozipović','00054245469','marijajozipovic@gmail.com','0953585263',1),
			(19,'Krešimir','Karimović','10007898653','kresimirkarimovic@gmail.com','0994322580',1),
	        (20,'Monika','Metod','12345445986','monikametod@gmail.com','0919799225',1),
			(21,'Josipa','Andričić','20037965423','josipaandricic@gmail.com','0911258119',1),
			(22,'Ivana','Huljić','555258300047','ivanahuljic@gmail.com','0981852850',1),
			(23,'Branimira','Blaženkovic','44599652300','branimirablazenskovic@gmail.com','0975895632',1),
			(24,'Vjekoslava','Radeković','00145789025','vjekoslavaradekovic@gmail.com','0955585263',1),
			(25,'Kristijan','Wolf','254890023694','kristijanwolf@gmail.com','0994320444',1),
	        (26,'Đuka','Rajić','14587458500','dukarajic@gmail.com','0919752452',1),
			(27,'Josipa','Kuna','54854515895','josipakuna@gmail.com','0910002119',1),
			(28,'Roberta','Malić','14445544114','robertamalic@gmail.com','0981800000',1),
			(29,'Mislav','Kerić','54789998552','mislavkeric@gmail.com','0974122632',1),
			(30,'Pero','Perić','52454249969','peroperic@gmail.com','0955828263',1),
			(31,'Miki','Župić','12458898653','mikizupic@gmail.com','0994385666',1),
	        (32,'Blaženko','Fis','12388845986','blazenkofis@gmail.com','0916666305',1),
			(33,'Sabrina','Fegoč','21587858423','sabrinafegoc@gmail.com','0911853339',1),
			(34,'Marina','Kastuš','55222300047','marinakastus@gmail.com','0981235620',1),
			(35,'Tea','Županić','45800522300','teazupanic@gmail.com','0974123632',1),
			(36,'Neda','Malenković','00112163652','nedamalenkovic@gmail.com','0955260063',1),
			(37,'Andrea','Osaka','254896425645','andreaosaka@gmail.com','0994325250',1),
	        (38,'Marijana','Pinara','45412458544','marijanapinara@gmail.com','0914875605',1),
			(39,'Đurđica','Rebić','78004912895','durdicarebic@gmail.com','0911825222',1),
			(40,'Suzana','Kapić','14500046514','suzanakapic@gmail.com','0981772120',1),
			(41,'Josipa','Placić','54785480552','josipaplacic@gmail.com','0974889956',1),
			(42,'Ivan','Jug','00054245489','ivanjug@gmail.com','0953577883',1),
			(43,'Ivo','Melić','10007858653','ivomelic@gmail.com','0994356980',1),
	        (44,'Marko','Mićan','12377445986','markomican@gmail.com','0919565225',1),
			(45,'Josipa','Brandis','20127965423','josipabrandis@gmail.com','0917878119',1),
			(46,'Ivana','Sanader','565958300047','ivanasadader@gmail.com','0981889850',1),
			(47,'Branimira','Plenković','44545852300','branimaraplenkovic@gmail.com','0975323632',1),
			(48,'Vjekoslava','Paljetak','00185989025','vjekoslavapaljetak@gmail.com','0955000263',1);

#Korisnik-Avio-kompanija
insert into korisnik_avioKompanija(korisnik,avioKompanija,oznakaSjedala,hrana,pice,prtljaga) 
	values	(1,1,'F22',0,0,0),
			(2,2,'A20',0,0,0),
			(3,1,'B13',0,0,1),
			(4,3,'A11',0,0,0),
			(5,2,'B15',0,0,1);
