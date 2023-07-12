/*Queries that provide answers to the questions from all projects.*/


/* Find all animals whose name ends in "mon". */
SELECT * from animals WHERE name LIKE '%mon';


/* List the name of all animals born between 2016 and 2019.*/
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';


/* List the name of all animals that are neutered and have less than 3 escape attempts.*/
SELECT name from animals WHERE neutred = true AND escape_attempts < 3;


/* List the date of birth of all animals named either "Agumon" or "Pikachu". */
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';

/* List name and escape attempts of animals that weigh more than 10.5kg */
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;

/* Find all animals that are neutered. */
SELECT * from animals WHERE neutred = true;

/* Find all animals not named Gabumon. */
SELECT * from animals WHERE name != 'Gabumon';

/* Find all animals with a weight between 10.4kg and 17.3kg */
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


/* /////////////////////////////////////////////////////////////////// */

START TRANSACTION;

UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;

ROLLBACK;
SELECT * FROM animals;

START TRANSACTION;

-- Update the species column to "digimon" for animals whose names end in "mon"
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
SELECT * FROM animals;

-- Update the species column to "pokemon" for animals whose species is not set
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;


COMMIT;
SELECT * FROM animals;
-- Start the transaction
START TRANSACTION;

-- Delete all records from the animals table
DELETE FROM animals;
SELECT * FROM animals;
-- Roll back the transaction to undo the delete
ROLLBACK;
SELECT * FROM animals;
-- Start the transaction
START TRANSACTION;

-- Delete all animals born after Jan 1st, 2022
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals;
-- Create a savepoint for the transaction
SAVEPOINT weight_update;

-- Update all animals' weight to be their weight multiplied by -1
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
-- Rollback to the savepoint
ROLLBACK TO weight_update;
SELECT * FROM animals;
-- Update all animals' weights that are negative to be their weight multiplied by -1
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animals;
-- Commit the transaction
COMMIT;
SELECT * FROM animals;


-- How many animals are there?
SELECT COUNT(*) FROM animals;
-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutred, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
GROUP BY neutred
ORDER BY avg_escape_attempts DESC;


-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


-
