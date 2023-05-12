/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM ANIMALS WHERE name LIKE '%mon'
SELECT * FROM ANIMALS WHERE date_of_birth BETWEEN '1/1/2016' AND '12/31/2019'
SELECT * FROM ANIMALS WHERE neutered  = true AND escape_attempts < 3
SELECT date_of_birth FROM ANIMALS WHERE name = 'Agumon' or name = 'Pikachu'
SELECT name, escape_attempts FROM ANIMALS WHERE weight_kg > 10.5
SELECT * FROM ANIMALS WHERE neutered = true
SELECT * FROM ANIMALS WHERE name != 'Gabumon'
SELECT * FROM ANIMALS WHERE weight_kg BETWEEN 10.4 AND 17.3

------------------------------------------------------------------
BEGIN;
UPDATE ANIMALS SET species = 'unspecified';
ROLLBACK;

UPDATE ANIMALS SET species = 'digimon' WHERE name LIKE '%mon'
UPDATE ANIMALS SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

BEGIN TRANSACTION;
DELETE FROM animals
SELECT * from animals
ROLLBACK
SELECT * from animals

BEGIN TRANSACTION;
DELETE FROM animals where date_of_birth > '1/1/2022'
SAVEPOINT sp1
UPDATE ANIMALS SET weight_kg =  weight_kg * -1
SELECT * from animals
ROLLBACK
SELECT * from animals

UPDATE ANIMALS SET weight_kg =  weight_kg * -1 where weight_kg < 0
COMMIT
SELECT * from animals

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals where escape_attempts  = 0; 
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, sum(escape_attempts) FROM animals group by neutered; 
SELECT species, min(weight_kg), max(weight_kg) FROM animals group by species; 
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1/1/1990' AND '12/31/2000' group by species ; 

--------------------------------------------------------

SELECT name, date_of_birth, weight_kg FROM animals a INNER JOIN owners o
	on a.owner_id = o.id where o.full_name = 'Melody Pond'
	
SELECT a.name, a.date_of_birth, a.weight_kg FROM animals a INNER JOIN species s
	on a.species_id = s.id where s.name = 'Pokemon'	

SELECT o.full_name, a.name FROM owners o LEFT JOIN animals a 
	on o.id = a.owner_id;	

SELECT s.name, count(a.species_id) FROM animals a JOIN species s 
	on a.species_id = s.id group by species_id	

SELECT a.name FROM animals a
	JOIN owners o ON a.owner_id = o.id
	JOIN species s ON a.species_id = s.id
	WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';

SELECT a.name FROM animals a
	JOIN owners o ON a.owner_id = o.id
	WHERE  o.full_name = 'Dean Winchester' AND a.escape_attempts = o;
	
SELECT o.full_name, count(a.owner_id) FROM animals a JOIN owners o 
	on a.owner_id = o.id group by owner_id	
	
