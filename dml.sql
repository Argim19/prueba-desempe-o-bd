DROP TABLE citys CASCADE ;
DROP TABLE customers CASCADE ;
DROP TABLE inventary CASCADE ;
DROP TABLE category CASCADE ;
DROP TABLE orders CASCADE ;
DROP TABLE products CASCADE ;
DROP TABLE distribution_center CASCADE ;

CREATE TABLE citys(
    id SERIAL PRIMARY KEY,
    name VARCHAR(80) NOT NULL UNIQUE
);


CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    id_city INT NOT NULL,
    CONSTRAINT fk_customer_city
                       FOREIGN KEY (id_city)
                       REFERENCES citys(id)

);

CREATE TABLE category(
    id SERIAL PRIMARY KEY,
    name VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    id_category INT NOT NULL,
    CONSTRAINT fk_products_category
                       FOREIGN KEY (id_category)
                       REFERENCES category(id)

);

CREATE TABLE distribution_center (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    id_city INT NOT NULL,
    CONSTRAINT fk_distribution_center_city
                       FOREIGN KEY (id_city)
                       REFERENCES citys(id)

);

CREATE TABLE inventary (
    id SERIAL PRIMARY KEY,
    id_product INT NOT NULL UNIQUE ,
    stock INT NOT NULL,
    CONSTRAINT fk_inventary_products
                       FOREIGN KEY (id_product)
                       REFERENCES products(id)

);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_number VARCHAR(80) NOT NULL UNIQUE,
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
    id_customer INT NOT NULL,
    id_product INT NOT NULL,
    id_distribution_center INT NOT NULL,
    CONSTRAINT fk_orders_customers
                    FOREIGN KEY (id_customer)
                    REFERENCES customers(id),
    CONSTRAINT fk_orders_products
                    FOREIGN KEY (id_product)
                    REFERENCES products(id),
    CONSTRAINT fk_orders_distribution_center
                    FOREIGN KEY (id_distribution_center)
                    REFERENCES distribution_center(id)


);

INSERT INTO citys (name)
VALUES
('Bogota'),
('Medellin'),
('Cali'),
('Barranquilla'),
('Cartagena'),
('Bucaramanga'),
('Pereira'),
('Manizales'),
('Cucuta');

INSERT INTO customers(name,id_city)
VALUES
('Super Max',1),
('Fresh Mart',2),
('Mini Shop',3),
('Eco Store',5),
('Market One',6),
('Retail Co',7),
('Food Plus',8),
('Green Buy',1),
('Quick Food',9);

INSERT INTO category(name)
VALUES
('Fruit'),
('Dairy'),
('Meat'),
('Grain'),
('Oil'),
('Vegetable');

INSERT INTO products(name, unit_price, id_category)
VALUES
('Apple Gala',2.5,1),
('Banana',1.2,1),
('Milk 1L',3.8,2),
('Chicken Breast',6.5,3),
('Rice 1kg',2,4),
('Olive Oil',8.9,5),
('Egg x12',4.2,2),
('Tomato',1.8,6),
('Iceberg Lettuce',1.1,6),
('Spaghetti',2.3,4);

INSERT INTO distribution_center(name,id_city)
VALUES
('North Center',1),
('West Center',2),
('South Hub',3),
('Coast DC',4),
('East Hub',6),
('Coffee DC',7),
('Coffee Center',8);

INSERT INTO inventary(id_product, stock)
VALUES
(1,100),
(2,180),
(3,60),
(4,70),
(5,200),
(6,40),
(7,90),
(8,120),
(9,50),
(10,140);

INSERT INTO orders
(order_number, order_date, quantity, id_customer, id_product, id_distribution_center)
VALUES
('O1001', '2026-05-01', 10, 1, 1, 1),
('O1002', '2026-05-02', 5, 1, 1, 1),
('O1003', '2026-05-02', 20, 2, 2, 2),
('O1004', '2026-05-03', 15, 2, 2, 2),
('O1005', '2026-05-04', 12, 3, 3, 3),
('O1006', '2026-05-05', 8, 3, 3, 3),
('O1007', '2026-05-06', 25, 1, 4, 4),
('O1008', '2026-05-07', 10, 1, 4, 4),
('O1009', '2026-05-08', 30, 4, 5, 4),
('O1010', '2026-05-09', 18, 4, 5, 4),
('O1011', '2026-05-10', 6, 5, 6, 5),
('O1012', '2026-05-11', 4, 5, 6, 5),
('O1013', '2026-05-12', 14, 6, 7, 6),
('O1014', '2026-05-13', 9, 6, 7, 7),
('O1015', '2026-05-14', 22, 7, 8, 6),
('O1016', '2026-05-15', 16, 7, 8, 7),
('O1017', '2026-05-16', 11, 8, 9, 1),
('O1018', '2026-05-17', 7, 8, 9, 1),
('O1019', '2026-05-18', 19, 9, 10, 5),
('O1020', '2026-05-19', 13, 9, 10, 5);






SELECT p.name AS product,i.stock FROM inventary i INNER JOIN products p on i.id_product = p.id;
SELECT o.order_number, o.order_date, c.name AS customer, ci.name AS city, p.name AS producto, o.quantity FROM orders o inner join customers c on c.id = o.id_customer INNER JOIN citys ci on ci.id = c.id_city INNER JOIN products p on p.id = o.id_product;
SELECT ca.name AS category, SUM(o.quantity * p.unit_price) AS total FROM orders o INNER JOIN products p on p.id = o.id_product INNER JOIN category ca on ca.id = p.id_category GROUP BY ca.name;
SELECT p.name AS product, i.stock FROM inventary i INNER JOIN products p on p.id = i.id_product ORDER BY i.stock ASC;


