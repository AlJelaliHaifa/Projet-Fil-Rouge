/*  Vue correspondant à la jointure Produits(products) - Fournisseurs(suppliers) */
/* Pour la clareté de la vue, seul les informations essentiel sont affichées*/
/*un right join est utilisé, pour faire connaitre les fournisseurs du magasin ne fournissant pas encore de produit*/

DROP VIEW IF EXISTS  v_pro_sup  ;

CREATE VIEW  v_pro_sup 
AS
SELECT  pro_ref as 'Référence Produit',  pro_label  as 'Libelle produit',  pro_price  as 'Prix produit', pro_stock  as 'Stock produit',
         sup_name  as 'Nom du fournisseur',  sup_city  as 'Ville du fournisseur',  sup_status  as 'Status du fournisseur' ,  sup_represent  as 'Représentant du fournisseur' 
FROM  products right join  suppliers  on  pro_sup_id  =  sup_id 
order by  sup_name ;


/*Affichage des vues de la base village_green */
/*
SELECT * 
FROM information_schema.views
WHERE table_schema = 'village_green'; 
*/