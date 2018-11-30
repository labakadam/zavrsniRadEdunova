drop database if exists zavrsniRad;
create database zavrsniRad;
use zavrsniRad;
create table avioKompanija(
				id 					int not null primary key auto_increment,
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
				mobitel 			int not null,
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