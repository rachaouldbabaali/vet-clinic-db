/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int NOT NULL PRIMARY KEY,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutred boolean,
    weight_kg DECIMAL(10,2)
);

ALTER TABLE animals ADD species varchar(255);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(250),
    age INT
);

CREATE TABLE species (
    Id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owners_id INT REFERENCES owners(id);

CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    age INT,
    date_of_graduation DATE,
    primary key (id)
);

CREATE TABLE specializations(
    vets_id INT REFERENCES vets(id),
    species_id INT REFERENCES species(id)
);

CREATE TABLE visits(
    vets_id INT REFERENCES vets(id),
    animals_id INT REFERENCES animals(id),
    visit_date DATE
);


ALTER TABLE owners ADD COLUMN email VARCHAR(120);
INSERT INTO visits (animals_id, vets_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

-- excution time: 343 ms so we re insert the data
INSERT INTO visits (animals_id, vets_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
