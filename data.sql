/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', 'Feb 3, 2020', 0, '1', 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Gabumon', 'Nov 15, 2018', 2, '1', 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Pikachu', 'Jan 7, 2021', 1, '0', 15.05);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Devimon', 'May 12, 2017', 5, '1', 11);


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', 'Feb 8, 2020', 0, '0', -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Plantmon', 'Nov 15, 2021', 2, '1', -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', 'Apr 2, 1993', 3, '0', -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', 'Jun 12, 2005', 1, '1', -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', 'Jun 7, 2005', 7, '1', 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', 'Oct 13, 1998', 3, '1', 17);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Ditto', 'May 14, 2022', 4, '1', 22);


INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34);

INSERT INTO owners (full_name, age)
VALUES ('Jennifer Orwell', 19);

INSERT INTO owners (full_name, age)
VALUES ('Bob', 45);

INSERT INTO owners (full_name, age)
VALUES ('Melody Pond', 77);

INSERT INTO owners (full_name, age)
VALUES ('Dean Winchester', 14);

INSERT INTO owners (full_name, age)
VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokemon');

INSERT INTO species (name)
VALUES ('Digimon');

UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = 1
WHERE species_id IS NULL;

UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = 2
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owner_id = 3
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owner_id = 4
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owner_id = 5
WHERE name = 'Angemon' OR name = 'Boarmon';

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, 'Apr 23, 2000');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Maisy Smith', 26, 'Jan 17, 2019');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Stephanie Mendez', 64, 'May 4, 1981');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Jack Harkness', 38, 'Jun 8, 2008');

INSERT INTO specializations (species_id, vets_id)
VALUES (1, 1);

INSERT INTO specializations (species_id, vets_id)
VALUES (2, 3);

INSERT INTO specializations (species_id, vets_id)
VALUES (1, 3);

INSERT INTO specializations (species_id, vets_id)
VALUES (2, 4);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (1, 1, 'May 24, 2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (1, 3, 'Jul 22, 2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (2, 4, 'Feb 2, 2021');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (3, 2, 'Jan 5, 2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (3, 2, 'Mar 8, 2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (3, 2, 'May 14, 2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (4, 3, 'May 4, 2021');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (5, 4, 'Feb 24, 2021');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (6, 2, 'Dec 21, 2019');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (6, 1, 'Aug 10, 2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (6, 2, 'Apr 8, 2021');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (7, 3, 'Sep 29, 2019');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (8, 4, 'Oct 3, 2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (8, 4, 'Nov 4, 2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (9, 2, 'Jan 24, 2019');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (9, 2, 'May 15, 2019');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (9, 2, 'Feb 27, 2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (9, 2, 'Aug 3, 2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (10, 3, 'May 24, 2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (10, 1, 'Jan 11, 2021');
