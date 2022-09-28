/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN 'Dec 31, 2016' AND 'Jan 1, 2019';
SELECT name FROM animals WHERE neutered = '1' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = '1';
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
SELECT * FROM animals;
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > 'Jan 1, 2022'
SAVEPOINT SP2;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SP2;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(id) FROM animals;

SELECT COUNT(id) FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attempts)
FROM animals
GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg)
FROM animals
GROUP BY species;


SELECT species, AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN 'Jan 1, 1990' AND 'Dec 31, 2000'
GROUP BY species;