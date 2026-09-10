CREATE TABLE IF NOT EXISTS item_categories(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE IF NOT EXISTS item_types(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE IF NOT EXISTS brands(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE IF NOT EXISTS stores(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE IF NOT EXISTS customers(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS models(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    brand_id INT,
    description TEXT,

    FOREIGN KEY (brand_id) REFERENCES brands(id)
);

CREATE TABLE IF NOT EXISTS items(
    id SERIAL PRIMARY KEY,
    categ_id INT,
    type_id INT,
    brand_id INT,
    model_id INT,
    store_id INT,
    price NUMERIC(10, 2) NOT NULL,
    amount INT,

    FOREIGN KEY (categ_id) REFERENCES item_categories(id),
    FOREIGN KEY (type_id) REFERENCES item_types(id),
    FOREIGN KEY (brand_id) REFERENCES brands(id),
    FOREIGN KEY (model_id) REFERENCES models(id),
    FOREIGN KEY (store_id) REFERENCES stores(id)
);

CREATE TABLE IF NOT EXISTS orders(
    id SERIAL PRIMARY KEY,
    code UUID,
    date TIMESTAMP,
    amount INT,
    paid BOOLEAN,
    customer_id INT,

    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE IF NOT EXISTS item_order(
    item_id INT REFERENCES items(id),
    orders_id INT REFERENCES orders(id)
);
