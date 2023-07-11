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
