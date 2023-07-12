/*Queries that provide answers to the questions from all projects.*/


/* Find all animals whose name ends in "mon". */
SELECT * from animals WHERE name LIKE '%mon';
/*
 id |   name   | date_of_birth | escape_attempts | neutred | weight_kg
----+----------+---------------+-----------------+---------+-----------
  1 |  Agumon  | 2020-02-03    |               0 | t       |     10.23
  2 |  Gabumon | 2018-11-15    |               2 | t       |         8
  4 |  Devimon | 2017-05-12    |               5 | t       |        11
(3 rows)
*/

/* List the name of all animals born between 2016 and 2019.*/
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
/*    name
----------
  Gabumon
  Devimon
(2 rows)
*/

/* List the name of all animals that are neutered and have less than 3 escape attempts.*/
SELECT name from animals WHERE neutred = true AND escape_attempts < 3;
/*    name
----------
  Agumon
  Gabumon
(2 rows)
*/

/* List the date of birth of all animals named either "Agumon" or "Pikachu". */
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';
/* 
 date_of_birth
---------------
 2020-02-03
 2021-01-07
(2 rows)
*/

/* List name and escape attempts of animals that weigh more than 10.5kg */
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
/* 
   name   | escape_attempts
----------+-----------------
  Pikachu |               1
  Devimon |               5
(2 rows)

*/

/* Find all animals that are neutered. */
SELECT * from animals WHERE neutred = true;
/*
 id |   name   | date_of_birth | escape_attempts | neutred | weight_kg
----+----------+---------------+-----------------+---------+-----------
  1 |  Agumon  | 2020-02-03    |               0 | t       |     10.23
  2 |  Gabumon | 2018-11-15    |               2 | t       |         8
  4 |  Devimon | 2017-05-12    |               5 | t       |        11
(3 rows)
*/

/* Find all animals not named Gabumon. */
SELECT * from animals WHERE name != 'Gabumon';
/* 
 id |  name   | date_of_birth | escape_attempts | neutred | weight_kg
----+---------+---------------+-----------------+---------+-----------
  1 | Agumon  | 2020-02-03    |               0 | t       |     10.23
  3 | Pikachu | 2021-01-07    |               1 | f       |     15.04
  4 | Devimon | 2017-05-12    |               5 | t       |        11
(3 rows)
*/

/* Find all animals with a weight between 10.4kg and 17.3kg */
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
/* 
 id |  name   | date_of_birth | escape_attempts | neutred | weight_kg
----+---------+---------------+-----------------+---------+-----------
  3 | Pikachu | 2021-01-07    |               1 | f       |     15.04
  4 | Devimon | 2017-05-12    |               5 | t       |        11
(2 rows)
*/


/* /////////////////////////////////////////////////////////////////// */

START TRANSACTION;

UPDATE animals SET species = 'unspecified';
/*
 id |    name    | date_of_birth | escape_attempts | neutred | weight_kg |   species
----+------------+---------------+-----------------+---------+-----------+-------------
  1 | Agumon     | 2020-02-03    |               0 | t       |     10.23 | unspecified
  2 | Gabumon    | 2018-11-15    |               2 | t       |         8 | unspecified
  3 | Pikachu    | 2021-01-07    |               1 | f       |     15.04 | unspecified
  4 | Devimon    | 2017-05-12    |               5 | t       |        11 | unspecified
  5 | Charmander | 2020-02-08    |               0 | f       |       -11 | unspecified
  6 | Plantmon   | 2021-11-15    |               2 | t       |      -5.7 | unspecified
  7 | Squirtle   | 1993-04-02    |               3 | f       |    -12.13 | unspecified
  8 | Angemon    | 2005-06-12    |               1 | t       |       -45 | unspecified
  9 | Boarmon    | 2005-06-07    |               7 | t       |      20.4 | unspecified
 10 | Blossom    | 1998-10-13    |               3 | t       |        17 | unspecified
 11 | Ditto      | 2022-05-14    |               4 | t       |        22 | unspecified
(11 rows)
*/

ROLLBACK;
SELECT * FROM animals;
/* 
 id |    name    | date_of_birth | escape_attempts | neutred | weight_kg |   species
----+------------+---------------+-----------------+---------+-----------+--------------
  1 | Agumon     | 2020-02-03    |               0 | t       |     10.23 |
  2 | Gabumon    | 2018-11-15    |               2 | t       |      8.00 |
  3 | Pikachu    | 2021-01-07    |               1 | f       |     15.04 |
  4 | Devimon    | 2017-05-12    |               5 | t       |     11.00 |
  5 | Charmander | 2020-02-08    |               0 | f       |    -11.00 | 
  6 | Plantmon   | 2021-11-15    |               2 | t       |     -5.70 | 
  7 | Squirtle   | 1993-04-02    |               3 | f       |    -12.13 | 
  8 | Angemon    | 2005-06-12    |               1 | t       |    -45.00 | 
  9 | Boarmon    | 2005-06-07    |               7 | t       |     20.40 | 
 10 | Blossom    | 1998-10-13    |               3 | t       |     17.00 | 
 11 | Ditto      | 2022-05-14    |               4 | t       |     22.00 | 
(11 rows)
*/

START TRANSACTION;

-- Update the species column to "digimon" for animals whose names end in "mon"
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
/*
 id |    name    | date_of_birth | escape_attempts | neutred | weight_kg | species
----+------------+---------------+-----------------+---------+-----------+---------
  3 | Pikachu    | 2021-01-07    |               1 | f       |     15.04 |
  5 | Charmander | 2020-02-08    |               0 | f       |    -11.00 |
  7 | Squirtle   | 1993-04-02    |               3 | f       |    -12.13 |
 10 | Blossom    | 1998-10-13    |               3 | t       |     17.00 |
 11 | Ditto      | 2022-05-14    |               4 | t       |     22.00 |
  1 | Agumon     | 2020-02-03    |               0 | t       |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t       |      8.00 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t       |     11.00 | digimon
  6 | Plantmon   | 2021-11-15    |               2 | t       |     -5.70 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t       |    -45.00 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t       |     20.40 | digimon
(11 rows)
*/

-- Update the species column to "pokemon" for animals whose species is not set
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

/*
 id |    name    | date_of_birth | escape_attempts | neutred | weight_kg | species
----+------------+---------------+-----------------+---------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t       |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t       |      8.00 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t       |     11.00 | digimon
  6 | Plantmon   | 2021-11-15    |               2 | t       |     -5.70 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t       |    -45.00 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t       |     20.40 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f       |     15.04 | pokemon
  5 | Charmander | 2020-02-08    |               0 | f       |    -11.00 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f       |    -12.13 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t       |     17.00 | pokemon
 11 | Ditto      | 2022-05-14    |               4 | t       |     22.00 | pokemon
(11 rows)
*/

COMMIT;
/*
 id |    name    | date_of_birth | escape_attempts | neutred | weight_kg | species
----+------------+---------------+-----------------+---------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t       |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t       |      8.00 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t       |     11.00 | digimon
  6 | Plantmon   | 2021-11-15    |               2 | t       |     -5.70 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t       |    -45.00 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t       |     20.40 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f       |     15.04 | pokemon
  5 | Charmander | 2020-02-08    |               0 | f       |    -11.00 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f       |    -12.13 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t       |     17.00 | pokemon
 11 | Ditto      | 2022-05-14    |               4 | t       |     22.00 | pokemon
(11 rows)
*/

-- Start the transaction
START TRANSACTION;

-- Delete all records from the animals table
DELETE FROM animals;
/*
 id | name | date_of_birth | escape_attempts | neutred | weight_kg | species
----+------+---------------+-----------------+---------+-----------+---------
(0 rows)
*/  

-- Roll back the transaction to undo the delete
ROLLBACK;

-- Start the transaction
START TRANSACTION;

-- Delete all animals born after Jan 1st, 2022
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
/*
 id |    name    | date_of_birth | escape_attempts | neutred | weight_kg | species
----+------------+---------------+-----------------+---------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t       |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t       |      8.00 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t       |     11.00 | digimon
  6 | Plantmon   | 2021-11-15    |               2 | t       |     -5.70 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t       |    -45.00 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t       |     20.40 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f       |     15.04 | pokemon
  5 | Charmander | 2020-02-08    |               0 | f       |    -11.00 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f       |    -12.13 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t       |     17.00 | pokemon
(10 rows)
*/

-- Create a savepoint for the transaction
SAVEPOINT weight_update;

-- Update all animals' weight to be their weight multiplied by -1
UPDATE animals SET weight_kg = weight_kg * -1;
/*
 id |    name    | date_of_birth | escape_attempts | neutred | weight_kg | species
----+------------+---------------+-----------------+---------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t       |    -10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t       |     -8.00 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t       |    -11.00 | digimon
  6 | Plantmon   | 2021-11-15    |               2 | t       |      5.70 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t       |     45.00 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t       |    -20.40 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f       |    -15.04 | pokemon
  5 | Charmander | 2020-02-08    |               0 | f       |     11.00 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f       |     12.13 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t       |    -17.00 | pokemon
(10 rows)
*/

-- Rollback to the savepoint
ROLLBACK TO weight_update;
/*
 id |    name    | date_of_birth | escape_attempts | neutred | weight_kg | species
----+------------+---------------+-----------------+---------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t       |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t       |      8.00 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t       |     11.00 | digimon
  6 | Plantmon   | 2021-11-15    |               2 | t       |     -5.70 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t       |    -45.00 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t       |     20.40 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f       |     15.04 | pokemon
  5 | Charmander | 2020-02-08    |               0 | f       |    -11.00 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f       |    -12.13 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t       |     17.00 | pokemon
(10 rows)
*/

-- Update all animals' weights that are negative to be their weight multiplied by -1
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
/*
 id |    name    | date_of_birth | escape_attempts | neutred | weight_kg | species
----+------------+---------------+-----------------+---------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t       |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t       |      8.00 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t       |     11.00 | digimon
  6 | Plantmon   | 2021-11-15    |               2 | t       |      5.70 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t       |     45.00 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t       |     20.40 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f       |     15.04 | pokemon
  5 | Charmander | 2020-02-08    |               0 | f       |     11.00 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f       |     12.13 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t       |     17.00 | pokemon
(10 rows)
*/

-- Commit the transaction
COMMIT;
/* 
 id |    name    | date_of_birth | escape_attempts | neutred | weight_kg | species
----+------------+---------------+-----------------+---------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t       |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t       |      8.00 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t       |     11.00 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t       |     20.40 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f       |     15.04 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t       |     17.00 | pokemon
  6 | Plantmon   | 2021-11-15    |               2 | t       |      5.70 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t       |     45.00 | digimon
  5 | Charmander | 2020-02-08    |               0 | f       |     11.00 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f       |     12.13 | pokemon
(10 rows)
*/

-- How many animals are there?
SELECT COUNT(*) FROM animals;
/* 
 count
-------
    10
(1 row)
*/
-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
/* 
 count
-------
     2
(1 row)
*/

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;
/* 
         avg
---------------------
 15.5500000000000000
(1 row)
*/

-- Who escapes the most, neutered or not neutered animals?
SELECT neutred, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
GROUP BY neutred
ORDER BY avg_escape_attempts DESC;
/*
 neutred | avg_escape_attempts
---------+---------------------
 t       |  2.8571428571428571
 f       |  1.3333333333333333
(2 rows)
*/


-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
/*
 species |  min  |  max
---------+-------+-------
 pokemon | 11.00 | 17.00
 digimon |  5.70 | 45.00
(2 rows)
*/

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;
/* 
species |        avg
---------+--------------------
 pokemon | 3.0000000000000000
(1 row)
*/

-
