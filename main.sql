CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2)
);

CREATE TABLE orders (
    id INT PRIMARY KEY,
    user_id INT,
    product_id INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE reviews (
    id INT PRIMARY KEY,
    user_id INT,
    product_id INT,
    review TEXT,
    rating INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE search_history (
    id INT PRIMARY KEY,
    user_id INT,
    search_query VARCHAR(255),
    search_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (id, username, email) VALUES (1, 'john', 'john@example.com');
INSERT INTO users (id, username, email) VALUES (2, 'jane', 'jane@example.com');
INSERT INTO users (id, username, email) VALUES (3, 'bob', 'bob@example.com');

INSERT INTO products (id, name, description, price) VALUES (1, 'Product A', 'This is product A', 10.99);
INSERT INTO products (id, name, description, price) VALUES (2, 'Product B', 'This is product B', 9.99);
INSERT INTO products (id, name, description, price) VALUES (3, 'Product C', 'This is product C', 12.99);

INSERT INTO orders (id, user_id, product_id, order_date) VALUES (1, 1, 1, '2022-01-01');
INSERT INTO orders (id, user_id, product_id, order_date) VALUES (2, 1, 2, '2022-01-15');
INSERT INTO orders (id, user_id, product_id, order_date) VALUES (3, 2, 3, '2022-02-01');

INSERT INTO reviews (id, user_id, product_id, review, rating) VALUES (1, 1, 1, 'Great product', 5);
INSERT INTO reviews (id, user_id, product_id, review, rating) VALUES (2, 1, 2, 'Good product', 4);
INSERT INTO reviews (id, user_id, product_id, review, rating) VALUES (3, 2, 3, 'Excellent product', 5);

INSERT INTO search_history (id, user_id, search_query, search_date) VALUES (1, 1, 'product A', '2022-01-01');
INSERT INTO search_history (id, user_id, search_query, search_date) VALUES (2, 1, 'product B', '2022-01-15');
INSERT INTO search_history (id, user_id, search_query, search_date) VALUES (3, 2, 'product C', '2022-02-01');

SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM reviews;
SELECT * FROM search_history;

SELECT users.username, products.name, orders.order_date 
FROM users 
JOIN orders ON users.id = orders.user_id 
JOIN products ON orders.product_id = products.id;

SELECT users.username, reviews.review, reviews.rating 
FROM users 
JOIN reviews ON users.id = reviews.user_id 
JOIN products ON reviews.product_id = products.id;

SELECT products.name, search_history.search_query, search_history.search_date 
FROM products 
JOIN search_history ON products.name = search_history.search_query;

CREATE VIEW user_orders AS 
SELECT users.username, products.name, orders.order_date 
FROM users 
JOIN orders ON users.id = orders.user_id 
JOIN products ON orders.product_id = products.id;

CREATE VIEW product_reviews AS 
SELECT products.name, reviews.review, reviews.rating 
FROM products 
JOIN reviews ON products.id = reviews.product_id 
JOIN users ON reviews.user_id = users.id;

SELECT * FROM user_orders;
SELECT * FROM product_reviews;