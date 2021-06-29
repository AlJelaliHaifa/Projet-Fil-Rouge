/*VISITEUR*/

/*Création du rôle Visiteur*/
drop role if exists 'guest'@'%';
CREATE ROLE 'guest'@'%';

/*Attibution du privilége de lecture sur le catalogue au rôle visiteur */

GRANT select
ON village_green.products 
TO 'guest'@'%';


/*Création de 5 visiteurs*/

drop user if exists 'guest1'@'%';
drop user if exists 'guest2'@'%';
drop user if exists 'guest3'@'%';
drop user if exists 'guest4'@'%';
drop user if exists 'guest5'@'%';
CREATE USER if not exists 'guest1'@'%'IDENTIFIED BY '0123';
CREATE USER if not exists 'guest2'@'%'IDENTIFIED BY '1234';
CREATE USER if not exists 'guest3'@'%'IDENTIFIED BY '4321';
CREATE USER if not exists 'guest4'@'%'IDENTIFIED BY '3210';
CREATE USER if not exists 'guest5'@'%'IDENTIFIED BY '0000';


/*Affectation du rôle visiteur aux 5  visiteurs*/

GRANT 'guest'@'%'
TO 'guest1'@'%', 'guest2'@'%','guest3'@'%','guest4'@'%','guest5'@'%';  

/*Assignation du rôle visiteur pour test, via la commande SET DEFAULT ROLE */

SET DEFAULT ROLE 'guest'@'%' TO 'guest1'@'%';
SET DEFAULT ROLE 'guest'@'%' TO 'guest2'@'%';
SET DEFAULT ROLE 'guest'@'%' TO 'guest3'@'%';
SET DEFAULT ROLE 'guest'@'%' TO 'guest4'@'%';
SET DEFAULT ROLE 'guest'@'%' TO 'guest5'@'%';



/*CLIENT*/

/*Création du rôle client*/
drop role if exists 'customers'@'%';
CREATE ROLE 'customers'@'%';

/*Attibution du privilége de lecture sur la base au rôle client */

GRANT select
ON village_green.*
TO 'customers'@'%';

/*Attibution du privilége d'insertion et modification sur les tables client et commande au rôle client */

GRANT insert, update
ON village_green.orders
TO 'customers'@'%';

GRANT insert, update
ON village_green.customers
TO 'customers'@'%';


/*Création de 5 client*/

drop user if exists 'cus1'@'%';
drop user if exists 'cus2'@'%';
drop user if exists 'cus3'@'%';
drop user if exists 'cus4'@'%';
drop user if exists 'cus5'@'%';
CREATE USER if not exists 'cus1'@'%' IDENTIFIED BY '0123';
CREATE USER if not exists 'cus2'@'%' IDENTIFIED BY '1234';
CREATE USER if not exists 'cus3'@'%' IDENTIFIED BY '4321';
CREATE USER if not exists 'cus4'@'%' IDENTIFIED BY '3210';
CREATE USER if not exists 'cus5'@'%' IDENTIFIED BY '0000';


/*Affectation du rôle client aux 5 clients*/

GRANT 'customers'@'%'
TO 'cus1'@'%', 'cus2'@'%','cus3'@'%','cus4'@'%','cus5'@'%';  

/*Assignation du rôle client pour test, via la commande SET DEFAULT ROLE */

SET DEFAULT ROLE 'customers'@'%' TO 'cus1'@'%';
SET DEFAULT ROLE 'customers'@'%' TO 'cus2'@'%';
SET DEFAULT ROLE 'customers'@'%' TO 'cus3'@'%';
SET DEFAULT ROLE 'customers'@'%' TO 'cus4'@'%';
SET DEFAULT ROLE 'customers'@'%' TO 'cus5'@'%';


/*GESTION*/

/*Création du rôle gestion*/
drop role if exists 'management'@'%';
CREATE ROLE 'management'@'%';

/*Attibution du privilége de lecture, ecriture sur la base au rôle gestion */

GRANT select, insert, update
ON village_green.*
TO 'management'@'%';


/*Création de 5 gestionnaires*/

drop user if exists 'manage1'@'%';
drop user if exists 'manage2'@'%';
drop user if exists 'manage3'@'%';
drop user if exists 'manage4'@'%';
drop user if exists 'manage5'@'%';
CREATE USER if not exists 'manage1'@'%' IDENTIFIED BY '1234';
CREATE USER if not exists 'manage2'@'%' IDENTIFIED BY '0123';
CREATE USER if not exists 'manage3'@'%' IDENTIFIED BY '4321';
CREATE USER if not exists 'manage4'@'%' IDENTIFIED BY '3210';
CREATE USER if not exists 'manage5'@'%' IDENTIFIED BY '0000';


/*Affectation du rôle gestion aux 5 gestionnaires*/

GRANT 'management'@'%'
TO 'manage1'@'%', 'manage2'@'%','manage3'@'%','manage4'@'%','manage5'@'%';  

/*Assignation du rôle gestion pour test, via la commande SET DEFAULT ROLE */

SET DEFAULT ROLE 'management'@'%' TO 'manage1'@'%';
SET DEFAULT ROLE 'management'@'%' TO 'manage2'@'%';
SET DEFAULT ROLE 'management'@'%' TO 'manage3'@'%';
SET DEFAULT ROLE 'management'@'%' TO 'manage4'@'%';
SET DEFAULT ROLE 'management'@'%' TO 'manage5'@'%';


/*ADMINISTRATION*/

/*Création du rôle administration*/
drop role if exists 'administrator'@'%';
CREATE ROLE 'administrator'@'%';

/*Attibution du privilége de lecture, ecriture, suppression et création suppression de table sur la base au rôle administrateur */

GRANT ALL
ON village_green.*
TO 'administrator'@'%';




/*Création de 5 administrateur */

drop user if exists 'admin1'@'%';
drop user if exists 'admin2'@'%';
drop user if exists 'admin3'@'%';
drop user if exists 'admin4'@'%';
drop user if exists 'admin5'@'%';
CREATE USER if not exists 'admin1'@'%' IDENTIFIED BY '1234';
CREATE USER if not exists 'admin2'@'%' IDENTIFIED BY '0123';
CREATE USER if not exists 'admin3'@'%' IDENTIFIED BY '4321';
CREATE USER if not exists 'admin4'@'%' IDENTIFIED BY '3210';
CREATE USER if not exists 'admin5'@'%' IDENTIFIED BY '0000';


/*Affectation du rôle administrateur aux 5 administrateurs*/

GRANT 'administrator'@'%'
TO 'admin1'@'%', 'admin2'@'%','admin3'@'%','admin4'@'%','admin5'@'%';  

/*Assignation du rôle administration pour test, via la commande SET DEFAULT ROLE */

SET DEFAULT ROLE 'administrator'@'%' TO 'admin1'@'%';
SET DEFAULT ROLE 'administrator'@'%' TO 'admin2'@'%';
SET DEFAULT ROLE 'administrator'@'%' TO 'admin3'@'%';
SET DEFAULT ROLE 'administrator'@'%' TO 'admin4'@'%';
SET DEFAULT ROLE 'administrator'@'%' TO 'admin5'@'%';