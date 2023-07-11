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