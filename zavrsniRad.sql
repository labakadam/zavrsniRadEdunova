drop database if exists zavrsniRad;
create database zavrsniRad;
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
				brojMobitela 		int not null,
				brojUgovora 		int,
				oib 				char(11)
);
create table korisnik(
				id 					int not null primary key auto_increment,
				ime 				varchar(50) not null,
				prezime 			varchar(50) not null,
				oib 				char(11) not null,
				email 				varchar(50) not null,
				brojMobitela 		int,
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
	values	(1,1,'Marko','Marković','markomarkovic@gmail.com',0911852128,1,'12598745632'),
            (2,2,'Marko','Marković','markomarkovic@gmail.com',0911852128,1,'12598745632'),
			(3,3,'Marko','Marković','markomarkovic@gmail.com',0911852128,1,'12598745632');	

#Avio-kompanija
insert into avioKompanija(id,naziv,let,avion,zaposlenik,oib,iban,osiguranje)
	values	(1,'Wizz-air','Osijek-Basel','Airbus A320-200',1,'23154685236','HR451245880002547855874',2),
	        (2,'Easy-jet','Osijek-Stuttgart','Airbus A320-200',1,'547859658956','HR2544587441222554877',2),
			(3,'German-wings','Osijek-Split','Airbus A320-200',1,'125444145214','HR22225478569854512547',2);

#Korisnik
insert into korisnik(id,ime,prezime,oib,email,brojMobitela,osiguranje) 
	values	(1,'Kristijan','Rebić','254896523694','kristijanrebic@gmail.com',0994320700,1),
	        (2,'Pero','Molnar','14587458544','peromolnar@gmail.com',0919799605,1),
			(3,'Josip','Kunić','54854965895','josipkunic@gmail.com',0911852119,1),
			(4,'Antun','Babić','14555544114','antunbabic@gmail.com',0981852120,1),
			(5,'Svetislav','Morenić','54785698552','svetislavmorenic@gmail.com',0974125632,1);

#Korisnik-Avio-kompanija
insert into korisnik_avioKompanija(korisnik,avioKompanija,oznakaSjedala,hrana,pice,prtljaga) 
	values	(1,1,'F22',0,0,0),
			(2,2,'A20',0,0,0),
			(3,1,'B13',0,0,1),
			(4,3,'A11',0,0,0),
			(5,2,'B15',0,0,1);
