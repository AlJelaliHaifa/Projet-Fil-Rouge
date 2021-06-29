DROP DATABASE IF EXISTS village_green;
CREATE DATABASE  village_green;
USE village_green;

CREATE TABLE countries (
  cou_id VARCHAR(2) NOT NULL AUTO_INCREMENT,
  cou_name VARCHAR(45) NOT NULL,
     PRIMARY KEY(cou_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE suppliers(
   sup_id INT(10) NOT NULL AUTO_INCREMENT,
   sup_name VARCHAR(50),
   sup_adress VARCHAR(150),
   sup_city VARCHAR(50),
   sup_pc VARCHAR(10),
   sup_email VARCHAR(50),
   sup_phone INT(10),
   sup_cou_id INT(10) NOT NULL,
   sup_type VARCHAR(50),
   sup_status VARCHAR(50),
   sup_represent VARCHAR(50),

   PRIMARY KEY(sup_id),
   CONSTRAINT suppliers_fk_1 FOREIGN KEY(sup_cou_id) REFERENCES countries(cou_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE categories(
   cat_id INT(10) NOT NULL AUTO_INCREMENT,
   cat_name VARCHAR(50) NOT NULL,
   cat_parent_id INT(10) DEFAULT NULL,
   PRIMARY KEY(cat_id),
   CONSTRAINT categories_ibfk_1 FOREIGN KEY (cat_parent_id) REFERENCES categories (cat_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE departments(
   dep_id INT(10) NOT NULL AUTO_INCREMENT,
   dep_name VARCHAR(50),
   PRIMARY KEY(dep_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE posts(
   pos_id INT(10) NOT NULL AUTO_INCREMENT,
   pos_label VARCHAR(50),
   PRIMARY KEY(pos_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE products(
   pro_id INT(10) NOT NULL AUTO_INCREMENT,
   pro_cat_id INT(10) NOT NULL,
   pro_price DECIMAL(5,2), 
   pro_ref VARCHAR(50),
   pro_stock INT(5),
   pro_short_desc VARCHAR(200) ,
   pro_long_desc VARCHAR(20000),
   pro_label VARCHAR(50),
   pro_sup_id INT(10) NOT NULL,
   pro_emp_id INT (10) NOT NULL,
   pro_add DATE NOT NULL,
   pro_update DATE DEFAULT NULL,
   pro_picture VARCHAR(50),
   PRIMARY KEY(pro_id),
   CONSTRAINT products_categories_fk_1 FOREIGN KEY(pro_cat_id) REFERENCES categories(cat_id),
   CONSTRAINT products_suppliers_fk_1 FOREIGN KEY(pro_sup_id) REFERENCES suppliers(sup_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE employees(
   emp_id INT(10)  NOT NULL AUTO_INCREMENT,
   emp_sup_id INT(10),
   emp_pos_id INT(10) NOT NULL,
   emp_cou_id INT(10) NOT NULL,
   emp_dep_id INT(10) NOT NULL,
   emp_lastname VARCHAR(50) NOT NULL,
   emp_firstname VARCHAR(50) NOT NULL,
   emp_adress VARCHAR(150) NOT NULL,
   emp_pc VARCHAR(5) NOT NULL,
   emp_city VARCHAR(50) NOT NULL,
   emp_email VARCHAR(255) NOT NULL,
   emp_phone VARCHAR(10) NOT NULL,
   emp_salary DECIMAL(8,2),
   emp_d_entree DATE NOT NULL,
   emp_sex VARCHAR(1) NOT NULL,
   emp_numb_children INT(10) NOT NULL,
   PRIMARY KEY(emp_id),
   CONSTRAINT employees_employees_fk_1 FOREIGN KEY(emp_sup_id) REFERENCES employees(emp_id),
   CONSTRAINT employees_departments_fk_1 FOREIGN KEY(emp_dep_id) REFERENCES departments(dep_id),
   CONSTRAINT employees_posts_fk_1 FOREIGN KEY(emp_pos_id) REFERENCES posts(pos_id),
   CONSTRAINT employees_countries_fk_1 FOREIGN KEY(emp_cou_id) REFERENCES countries(cou_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE customers(
   cus_id  INT(10) NOT NULL AUTO_INCREMENT,
   cus_lastname VARCHAR(50),
   cus_firstname VARCHAR(50),
   cus_address VARCHAR(150),
   cus_pc INT,
   cus_city VARCHAR(50),
   cus_cou_id  INT(10) NOT NULL,
   cus_phone INT(10),
   cus_email VARCHAR(60) NOT NULL,
   cus_bill_address VARCHAR(150),
   cus_bill_pc INT(5),
   cus_bill_city VARCHAR(50),
   cus_delivery_address VARCHAR(150),
   cus_delivery_pc INT(5),
   cus_delivery_city VARCHAR(50),
   cus_type VARCHAR(50),
   cus_emp_id INT(10) NOT NULL,
   cus_coef INT(10) NOT NULL,
   PRIMARY KEY(cus_id),
    CONSTRAINT customers_employees_fk1 FOREIGN KEY(cus_emp_id) REFERENCES employees(emp_id),
   CONSTRAINT customers_countries_fk1 FOREIGN KEY(cus_cou_id) REFERENCES countries(cou_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE orders(
   ord_id  INT(10) NOT NULL AUTO_INCREMENT,
   ord_date DATETIME,
   ord_date_payment DATETIME,
   ord_date_ship DATETIME,
   ord_date_delivery DATETIME,
   ord_bill_address VARCHAR(150),
   ord_bill_pc INT(5),
   ord_bill_city VARCHAR(50),
   ord_delivery_adress VARCHAR(150),
   ord_delivery_pc INT(5),
   ord_delivery_city VARCHAR(50),
   ord_status VARCHAR(50),
   ord_cus_id INT NOT NULL,
   PRIMARY KEY(ord_id),
   CONSTRAINT orders_fk_1 FOREIGN KEY(ord_cus_id) REFERENCES customers(cus_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE order_details(
   ode_id  INT(10) NOT NULL AUTO_INCREMENT,
   ode_unit_price DECIMAL(10,2),
   ode_qantity INT(5),
   ode_discount INT(5) DEFAULT NULL,
   ode_pro_id INT(10) NOT NULL,
   ode_ord_id INT(10) NOT NULL,
   PRIMARY KEY(ode_id),
   CONSTRAINT order_details_fk_1 FOREIGN KEY(ode_pro_id) REFERENCES products(pro_id),
   CONSTRAINT order_details_fk_2 FOREIGN KEY(ode_ord_id) REFERENCES orders(ord_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS delivery(
   del_id INT(10) NOT NULL AUTO_INCREMENT,
   del_ode_id INT(10) NOT NULL,
   del_quantity INT(10) UNSIGNED NOT NULL,
   del_send_date DATE NOT NULL,
   del_date DATE DEFAULT NULL,
   del_adress VARCHAR(150) NOT NULL, 
   PRIMARY KEY(del_id),
   FOREIGN KEY(del_ode_id) REFERENCES order_details(ode_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;