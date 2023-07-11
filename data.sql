/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg) VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg) VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8.00);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg) VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg) VALUES (4, 'Devimon', '2017-05-12', 5, true, 11.00);

/* vet_clinic=# \dt animals
          List of relations
 Schema |  Name   | Type  |  Owner
--------+---------+-------+----------
 public | animals | table | postgres
(1 row)


vet_clinic=# select * from animals;
 id |   name   | date_of_birth | escape_attempts | neutred | weight_kg
----+----------+---------------+-----------------+---------+-----------
  1 |  Agumon  | 2020-02-03    |               0 | t       |     10.23
  2 |  Gabumon | 2018-11-15    |               2 | t       |         8
  3 |  Pikachu | 2021-01-07    |               1 | f       |     15.04
  4 |  Devimon | 2017-05-12    |               5 | t       |        11
(4 rows)

*/
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg, species)
VALUES (5, 'Charmander', '2020-02-08', 0, false, -11.0, 'Fire Lizard');

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg, species)
VALUES (6, 'Plantmon', '2021-11-15', 2, true, -5.7, 'Plant');

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg, species)
VALUES (7, 'Squirtle', '1993-04-02', 3, false, -12.13, 'Water Turtle');

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg, species)
VALUES (8, 'Angemon', '2005-06-12', 1, true, -45.0, 'Angel');

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg, species)
VALUES (9, 'Boarmon', '2005-06-07', 7, true, 20.4, 'Boar');

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg, species)
VALUES (10, 'Blossom', '1998-10-13', 3, true, 17.0, 'Flower');

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg, species)
VALUES (11, 'Ditto', '2022-05-14', 4, true, 22.0, 'Transforming');

/* 
 id |    name    | date_of_birth | escape_attempts | neutred | weight_kg |   species
----+------------+---------------+-----------------+---------+-----------+--------------
  1 | Agumon     | 2020-02-03    |               0 | t       |     10.23 |
  2 | Gabumon    | 2018-11-15    |               2 | t       |         8 |
  3 | Pikachu    | 2021-01-07    |               1 | f       |     15.04 |
  4 | Devimon    | 2017-05-12    |               5 | t       |        11 |
  5 | Charmander | 2020-02-08    |               0 | f       |       -11 | Fire Lizard
  6 | Plantmon   | 2021-11-15    |               2 | t       |      -5.7 | Plant
  7 | Squirtle   | 1993-04-02    |               3 | f       |    -12.13 | Water Turtle
  8 | Angemon    | 2005-06-12    |               1 | t       |       -45 | Angel
  9 | Boarmon    | 2005-06-07    |               7 | t       |      20.4 | Boar
 10 | Blossom    | 1998-10-13    |               3 | t       |        17 | Flower
 11 | Ditto      | 2022-05-14    |               4 | t       |        22 | Transforming
(11 rows)
    
    */  