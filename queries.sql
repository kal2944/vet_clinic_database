/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth  BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE neutered = 'true' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = 'true';
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN; -- start the transaction
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL OR species = '';
SELECT * from animals;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * from animals;

DELETE FROM animals WHERE date_of_birth > '2022-01-01'; SAVEPOINT first_delete;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO first_delete;
UPDATE animals SET weight_kg = weight_kg * -1  WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg),MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

--  queries to answer the questions by using join

SELECT owner_id, full_name AS "OWNER NAME" , animals.name AS "ANIMALS NAME"
FROM animals INNER JOIN owners ON  animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

SELECT species.name AS "Animal Species", animals.name AS "ANIMALS NAME"
FROM animals JOIN species  ON animals.species_id = species.id WHERE species.id = 1;

SELECT  full_name AS "OWNER NAME" , animals.name AS "ANIMALS NAME"
FROM owners LEFT JOIN  animals ON  owners.id =  animals.owner_id ;

SELECT species.name AS "SPECIES NAME",  COUNT(animals.name) AS "SPECIES COUNT" 
FROM species JOIN animals on species.id = animals.species_id GROUP By species.name;

SELECT full_name AS "OWNER NAME" , animals.name AS "ANIMALS NAME",species.name AS "Animal Species"
FROM animals INNER JOIN owners ON  animals.owner_id = owners.id INNER JOIN species ON  animals.species_id = species.id WHERE owners.id = 2 and species.name = 'Digimon';

SELECT full_name AS "OWNER NAME" , animals.name AS "ANIMALS NAME",species.name AS "Animal Species"
FROM animals INNER JOIN owners ON  animals.owner_id = owners.id INNER JOIN species ON  animals.species_id = species.id WHERE owners.id = 5 and animals.escape_attempts = 0;  

