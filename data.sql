/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg) VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg) VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8.00);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg) VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg) VALUES (4, 'Devimon', '2017-05-12', 5, true, 11.00);




INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg)
VALUES (5, 'Charmander', '2020-02-08', 0, false, -11.0);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg)
VALUES (6, 'Plantmon', '2021-11-15', 2, true, -5.7);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg)
VALUES (7, 'Squirtle', '1993-04-02', 3, false, -12.13);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg)
VALUES (8, 'Angemon', '2005-06-12', 1, true, -45.0);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg)
VALUES (9, 'Boarmon', '2005-06-07', 7, true, 20.4);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg)
VALUES (10, 'Blossom', '1998-10-13', 3, true, 17.0);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutred, weight_kg)
VALUES (11, 'Ditto', '2022-05-14', 4, true, 22.0);


INSERT INTO owners(id, full_name, age) VALUES(1, 'Sam Smith', 34);
INSERT INTO owners(id, full_name, age) VALUES(2, 'Jennifer Orwel', 19);
INSERT INTO owners(id, full_name, age) VALUES(3, 'Bob', 45);
INSERT INTO owners(id, full_name, age) VALUES(4, 'Melody Pond', 77);
INSERT INTO owners(id, full_name, age) VALUES(5, 'Dean Winchester', 14);
INSERT INTO owners(id, full_name, age) VALUES(6, 'Jodie Whittaker', 38);

INSERT INTO species(name, id) VALUES('pokemon', 1);
INSERT INTO species(name, id) VALUES('digimon', 2);

UPDATE animals  SET species_id = 2 WHERE name LIKE '%mon%';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

UPDATE animals SET owners_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owners_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owners_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owners_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owners_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';


INSERT INTO vets(name, age, date_of_graduation)
VALUES('William Tatcher', 45, '2020-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations(vets_id, species_id)
VALUES(1, 1),(3, 1),(3, 2), (4, 2);

INSERT INTO visits(vets_id, animals_id, visit_date)
VALUES(1, 1, '2020-05-24'),
      (3, 1, '2020-07-22'),
      (4, 2, '2021-02-02'),
      (2, 5, '2020-01-05'),
      (2, 5, '2020-03-08'),
      (2, 5, '2020-05-14'),
      (3, 3, '2021-05-04'),
      (4, 9, '2021-02-24'),
      (2, 7, '2019-12-21'),
      (1, 7, '2020-08-10'),
      (2, 7, '2021-04-07'),
      (3, 10, '2019-09-29'),
      (4, 8, '2020-10-03'),
      (4, 8, '2020-11-04'),
      (2, 4, '2019-01-24'),
      (2, 4, '2019-05-15'),
      (2, 4, '2020-02-27'),
      (2, 4, '2020-08-03'),
      (3, 6, '2020-05-24'),
      (1, 6, '2021-01-11');


INSERT INTO visits (animals_id, vets_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

-- excution time: 343 ms so we re insert the data