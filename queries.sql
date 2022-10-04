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


SELECT owner_id, name, full_name
FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE full_name = 'Melody Pond';

SELECT species_id, animals.name, species.name
FROM animals
JOIN species
ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT owners.id, owners.full_name, animals.name
FROM owners
LEFT JOIN animals
ON owners.id = animals.owner_id;

SELECT species.name, COUNT(animals.id)
FROM species
JOIN animals
ON species.id = animals.species_id
GROUP BY species.name;

SELECT owners.full_name, animals.name, species.name
FROM owners
JOIN animals
ON owners.id = animals.owner_id
JOIN species
ON species.id = animals.species_id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT animals.name, owners.full_name, animals.escape_attempts
FROM animals
JOIN owners
ON owners.id = animals.owner_id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts < 1;

SELECT owners.full_name, COUNT(animals.id)
FROM owners
JOIN animals
ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY COUNT(animals.id) DESC;


SELECT vets.name, animals.name, visits.date_of_visit
FROM vets
JOIN visits
ON vets.id = visits.vets_id
JOIN animals
ON animals.id = visits.animals_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC;

SELECT vets.name, COUNT(visits.animals_id)
FROM vets
JOIN visits
ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY vets.name;

SELECT vets.name, species.name, specializations.species_id
FROM vets
FULL JOIN specializations
ON vets.id = specializations.vets_id
FULL JOIN species
ON species.id = specializations.species_id;

SELECT animals.name, vets.name, visits.date_of_visit
FROM animals
JOIN visits
ON animals.id = visits.animals_id
JOIN vets
ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN 'Apr 1, 2020' AND 'Aug 30, 2020';

SELECT animals.name, COUNT(visits.animals_id)
FROM animals
JOIN visits
ON animals.id = visits.animals_id
GROUP BY animals.name
ORDER BY COUNT(visits.animals_id) DESC;

SELECT animals.name, vets.name, visits.date_of_visit
FROM animals
JOIN visits
ON animals.id = visits.animals_id
JOIN vets
ON vets.id = visits.vets_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit;

SELECT date_of_visit FROM visits
ORDER BY date_of_visit DESC;
SELECT animals.name, animals.date_of_birth, animals.escape_attempts, animals.weight_kg, species.name, vets.name, visits.date_of_visit
FROM animals
JOIN visits
ON animals.id = visits.animals_id
JOIN species
ON animals.species_id = species.id
JOIN vets
WHERE date_of_visit = 'May 4, 2021';

SELECT COUNT(visits.animals_id)
FROM visits
JOIN animals
ON animals.id = visits.animals_id
JOIN vets
ON vets.id = visits.vets_id
WHERE animals.species_id NOT IN (
    SELECT specializations.species_id
    FROM specializations
    WHERE specializations.vets_id = vets.id
);

SELECT vets.name, species.name, COUNT(visits.vets_id)
FROM vets
JOIN visits
ON visits.vets_id = vets.id
JOIN animals
ON visits.animals_id = animals.id
JOIN species
ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY vets.name, species.name
ORDER BY COUNT(visits.vets_id) DESC;


SELECT COUNT(*) FROM visits where animal_id = 4;

SELECT * FROM visits where vet_id = 2;

SELECT * FROM owners where email = 'owner_18327@mail.com';
