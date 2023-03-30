/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    name varchar(100)
id               INT GENERATED ALWAYS AS IDENTITY,
name             VARCHAR(250),
data_of_birth    DATE,
escape_attempts  INT,
neutered         BOOLEAN,
weight_kg        DECIMAL,
PRIMARY KEY(id)
);

ALTER TABLE animals
ADD species varchar(255);