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
create table safeFlyEu(
				id                  int not null primary key auto_increment,
				informacija         varchar(50) not null,
				avioKompanija       int not null,
				let                 int not null,
				cijena              decimal(18,2) not null,
				vrijeme             datetime not null,
				grad                varchar(50) not null
);

	alter table korisnik 			add foreign key (osiguranje)		references osiguranje(id);
	alter table korisnik 			add foreign key (id) 				references safeFlyEu(id);
	alter table zaposlenik 			add foreign key (avioKompanija)		references safeFlyEu(id);
	alter table avioKompanija 		add foreign key (zaposlenik) 		references zaposlenik(id);
	alter table avioKompanija 		add foreign key (osiguranje)		references osiguranje(id);

