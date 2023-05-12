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
	
SELECT o.full_name, count(a.owner_id) FROM animals a JOIN owners o on a.owner_id = o.id group by owner_id	

-----------------------------------------------------------------------------------
SELECT a.name as Animal_Name, vi.date_of_visit from animals a 
	JOIN visits vi On a.id = vi.animal_id JOIN vets ve On ve.id = vi.vets_id
	WHERE ve.name = 'William Tatcher' ORDER BY vi.date_of_visit DESC Limit 1;

SELECT COUNT(DISTINCT animal_id) AS Num_of_Animals FROM visits 
	JOIN vets ON visits.vets_id = vets.id JOIN animals ON visits.animal_id = animals.id
	WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name as Vets_Name, species.name AS Specialty FROM vets
	LEFT JOIN specializations sp ON vets.id = sp.vets_id
	LEFT JOIN species ON sp.species_id = species.id	ORDER BY vets.name;

SELECT a.name, a.date_of_birth, a.neutered, a.weight_kg FROM visits
	JOIN vets ON visits.vets_id = vets.id JOIN animals a ON visits.animal_id = a.id
	WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';
	
SELECT a.name as Animal_Name, num_visits FROM animals a
	 JOIN (SELECT animal_id, COUNT(*) as num_visits FROM visits
	   GROUP BY animal_id ORDER BY num_visits DESC LIMIT 1) 
	   AS visits_count ON a.id = visits_count.animal_id;

SELECT a.name AS Animal_Name, vs.date_of_visit FROM visits vi
	JOIN animals a ON vi.animal_id = a.id JOIN vets On vets.id = vi.vets_id
	WHERE vets.name = 'Maisy Smith' ORDER BY vs.date_of_visit ASC LIMIT 1;

SELECT a.name AS Animal_Name, a.date_of_birth, a.escape_attempts, a.neutered, a.weight_kg, 
	ve.name AS Vet_Name, ve.age as Vet_Age, ve.date_of_graduation, vi.date_of_visit FROM animals a 
	JOIN visits vi ON vi.animal_id = a.id JOIN vets ve On ve.id = vi.vets_id ORDER BY vi.date_of_visit DESC LIMIT 1 ;
	
 SELECT count(*) from visits vi 
 	JOIN vets ON vi.vets_id = vets.id JOIN animals a ON vi.animal_id = a.id
	FULL JOIN specializations ss ON ss.vets_id = vets.id AND a.species_id = ss.species_id
	WHERE ss.species_id IS NULL

 SELECT sp.name AS Speciality, count(*) from visits vi 
 	JOIN vets ON vi.vets_id = vets.id JOIN animals a ON vi.animal_id = a.id
	LEFT JOIN specializations ss ON ss.vets_id = vets.id AND a.species_id = ss.species_id
	JOIN species sp ON sp.id = a.species_id
	WHERE ss.species_id IS NULL AND vets.name = 'Maisy Smith' 
	GROUP BY sp.name ORDER BY count DESC LIMIT 1
