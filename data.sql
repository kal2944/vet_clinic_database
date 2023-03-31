/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Agumon', '2020-02-03', 10.23, 'true', 0);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Gabumon', '2018-11-15', 8, 'true', 2);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Pikachu', '2021-01-7', 15.04, 'false', 1);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Devimon', '2017-05-12', 11, 'true', 5); 


INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Charmander', '2020-02-08', -11, 'false', 0); 

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Plantmon', '2021-11-15', -5.7, 'true', 2); 

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Squirtle', '1993-04-02', -12.13, 'false', 3); 

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Angemon', '2005-06-12', -45, 'true', 1); 

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Boarmon', '2005-06-07', 20.4, 'true', 7);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Blossom', '1998-10-13', 17, 'true', 3);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Ditto', '2022-05-14', 22, 'true', 4);

-- Inserting data for two columns

INSERT INTO owners (full_name, age) 
VALUES ('Sam Smith',34 ), ('Jennifer Orwel',19 ), ('Bob',45 ), ('Melody Pond', 77),('Dean Winchester', 14), ('Jodie Whittaker', 38);

INSERT INTO species (name) 
VALUES ('Pokemon'),('Digimon');

UPDATE animals SET species_id = (SELECT id from species WHERE name = 'Digimon') WHERE name like '%mon'; 

UPDATE animals SET species_id = (SELECT id from species WHERE name = 'Pokemon') WHERE name not LIKE '%mon'; 

UPDATE animals set owner_id = 1 WHERE name = 'Agumon';

UPDATE animals set owner_id = 2 WHERE name = 'Gabumon' or name = 'Pikachu';

UPDATE animals set owner_id = 3 WHERE name = 'Devimon' or name = 'Plantmon';

UPDATE animals set owner_id = 4 WHERE name = 'Charmander' or name = 'Squirtle' or name = 'Blossom';

UPDATE animals set owner_id = 5 WHERE name = 'Angemon' or name = 'Boarmon';

UPDATE owners SET full_name = 'Jennifer Orwell' WHERE id = 2;


INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),('Stephanie Mendez', 64, '1981-05-04'),('Jack Harkness', 38, '2008-08-08');