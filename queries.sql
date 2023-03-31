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

SELECT full_name AS "OWNER NAME",  COUNT(animals.name) AS "ANIMAL COUNT" 
FROM owners JOIN animals on owners.id = animals.owner_id GROUP By full_name ORDER BY COUNT(animals.name) DESC LIMIT 1;

SELECT animals.id, animals.name AS Last_Seen, visit_date
FROM animals JOIN visits ON animals.id = visits.animal_id WHERE vets_id = (SELECT id FROM vets WHERE name = 'William Tatcher' LIMIT 1) ORDER BY visit_date DESC LIMIT 1;


SELECT vets.name AS "VET NAME", COUNT(animals.name) AS "animals count"
FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON visits.vets_id = vets.id WHERE vets_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1)GROUP BY vets.name;

 SELECT vets.id, vets.name AS "Vet name", species.name AS "Specialization"
FROM vets LEFT JOIN specializations ON specializations.vet_id = vets.id LEFT JOIN species on specializations.species_id = species.id;

 SELECT vets.name AS "VET NAME" , animals.name AS "Animal Seen", visit_date
FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON visits.vets_id = vets.id WHERE vets_id IN (SELECT id from vets WHERE name = 'Stephanie Mendez') AND visit_date BETWEEN '2020-04-01' and '2020-08-30';


SELECT animals.name , COUNT (*) as "Visit count"
from animals JOIN visits ON animals.id = visits.animal_id GROUP BY  animals.name ORDER BY COUNT (*) DESC LIMIT 1;

 SELECT animals.name AS "FIRST ANIMAL SEEN", visit_date
FROM animals JOIN visits ON animals.id = visits.animal_id WHERE vets_id IN (SELECT id from vets WHERE name = 'Maisy Smith') ORDER BY visit_date ASC LIMIT 1;


 SELECT animals.name AS "RECENT ANIMAL SEEN", vets.name AS "VET NAME", visit_date AS "Visit Date"
FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON visits.vets_id = vets.id ORDER BY visit_date DESC LIMIT 1;

 SELECT COUNT(*) AS "number of visits" 
FROM vets INNER JOIN visits ON vets.id = visits.vets_id LEFT JOIN specializations ON vets.id = specializations.vet_id LEFT JOIN species ON specializations.species_id = species.id WHERE species IS NULL;


 SELECT species.name AS "Species Name"
 FROM visits JOIN animals ON visits.animal_id = animals.id JOIN vets ON visits.vets_id = vets.id JOIN species ON animals.species_id = species.id WHERE vets.id = 3 GROUP BY species.name ORDER BY count(animals.name) DESC LIMIT 1;


