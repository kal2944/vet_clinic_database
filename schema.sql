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


-- Added new two tables

CREATE TABLE owners (
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(255),
  age  INT,
  PRIMARY KEY (id)
);



CREATE TABLE species (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  PRIMARY KEY (id)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals 
ADD COLUMN species_id INT;

ALTER TABLE animals
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species(id);

ALTER TABLE animals 
ADD COLUMN owner_id INT;
ALTER TABLE animals
ADD CONSTRAINT fk_owner
FOREIGN KEY(owner_id)
REFERENCES owners(id);

CREATE TABLE vets (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250),
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY (id)
);

CREATE TABLE specializations (
  species_id int,
  vets_id int,
  CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);

ALTER TABLE specializations 
ADD CONSTRAINT PK_specializations 
PRIMARY KEY (species_id ,vets_id);

