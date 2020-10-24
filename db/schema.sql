CREATE DATABASE gameshareit;

CREATE TABLE games (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(200),
    image_url TEXT,
    description TEXT
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT,
    password_digest TEXT
);

