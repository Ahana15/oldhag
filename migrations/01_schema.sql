DROP TABLE IF EXISTS users
CASCADE;
DROP TABLE IF EXISTS users_order_statuses
CASCADE;
DROP TABLE IF EXISTS orders
CASCADE;
DROP TABLE IF EXISTS restaurants
CASCADE;
DROP TABLE IF EXISTS restaurant_order_statuses
CASCADE;
DROP TABLE IF EXISTS menus
CASCADE;
DROP TABLE IF EXISTS items
CASCADE;

CREATE TABLE users
(
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  phone_number VARCHAR(255) NOT NULL,
  is_owner BOOLEAN DEFAULT FALSE
);

CREATE TABLE users_order_statuses
(
  id SERIAL PRIMARY KEY NOT NULL,
  order_id INTEGER REFERENCES orders(id) ON DELETE CASCADE,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  status VARCHAR(255) NOT NULL
);

CREATE TABLE orders
(
  id SERIAL PRIMARY KEY NOT NULL,
  created_at TIMESTAMP,
  completed_at TIMESTAMP,
  item_id INTEGER REFERENCES items(id) ON DELETE CASCADE,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  restaurant_id INTEGER REFERENCES restaurants(id) ON DELETE CASCADE
);

CREATE TABLE restaurants
(
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  cuisine VARCHAR(255) NOT NULL,
  unit_number SMALLINT,
  street VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  province VARCHAR(255) NOT NULL,
  post_code VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL
);

CREATE TABLE restaurant_order_statuses
(
  id SERIAL PRIMARY KEY NOT NULL,
  order_id INTEGER REFERENCES orders(id) ON DELETE CASCADE,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  restaurant_id INTEGER REFERENCES restaurants(id) ON DELETE CASCADE
);

CREATE TABLE menus
(
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  restaurant_id INTEGER REFERENCES restaurants(id) ON DELETE CASCADE
);

CREATE TABLE items
(
 id SERIAL PRIMARY KEY NOT NULL,
 name VARCHAR(255) NOT NULL,
 description VARCHAR(255) NOT NULL,
 thumbnail_url VARCHAR(255) NOT NULL,
 price SMALLINT NOT NULL,
 menu_id INTEGER REFERENCES menus(id) ON DELETE CASCADE,
 restaurant_id INTEGER REFERENCES restaurants(id) ON DELETE CASCADE
);
