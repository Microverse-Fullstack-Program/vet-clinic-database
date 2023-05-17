/*Queries that provide answers to the questions from all projects.*/

1.1) Find all animals whose name ends in "mon".
SELECT * FROM ANIMALS WHERE name LIKE '%mon'

1.2) List the name of all animals born between 2016 and 2019.
SELECT * FROM ANIMALS WHERE date_of_birth BETWEEN '1/1/2016' AND '12/31/2019'

1.3) List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT * FROM ANIMALS WHERE neutered  = true AND escape_attempts < 3

1.4) List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM ANIMALS WHERE name = 'Agumon' or name = 'Pikachu'

1.5) List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts FROM ANIMALS WHERE weight_kg > 10.5

1.6) Find all animals that are neutered.
SELECT * FROM ANIMALS WHERE neutered = true

1.7) Find all animals not named Gabumon.
SELECT * FROM ANIMALS WHERE name != 'Gabumon'

1.8) Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
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

2.1) How many animals are there?
SELECT COUNT(*) FROM animals;

2.2) How many animals have never tried to escape?
SELECT COUNT(*) FROM animals where escape_attempts  = 0; 

2.3) What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

2.4) Who escapes the most, neutered or not neutered animals?
SELECT neutered, sum(escape_attempts) FROM animals group by neutered; 

2.5) What is the minimum and maximum weight of each type of animal?
SELECT species, min(weight_kg), max(weight_kg) FROM animals group by species; 

2.6) What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1/1/1990' AND '12/31/2000' group by species ; 

--------------------------------------------------------
3.1) What animals belong to Melody Pond?
SELECT name, date_of_birth, weight_kg FROM animals a INNER JOIN owners o
	on a.owner_id = o.id where o.full_name = 'Melody Pond'

3.2 List of all animals that are pokemon (their type is Pokemon).
SELECT a.name, a.date_of_birth, a.weight_kg FROM animals a INNER JOIN species s
	on a.species_id = s.id where s.name = 'Pokemon'	

3.3) List all owners and their animals, remember to include those that don't own any animal.
SELECT o.full_name, a.name FROM owners o LEFT JOIN animals a on o.id = a.owner_id;	

3.4) How many animals are there per species?
SELECT s.name, count(a.species_id) FROM animals a JOIN species s 
	on a.species_id = s.id group by species_id	

3.5) List all Digimon owned by Jennifer Orwell
SELECT a.name FROM animals a
	JOIN owners o ON a.owner_id = o.id
	JOIN species s ON a.species_id = s.id
	WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';

3.6) List all animals owned by Dean Winchester that haven't tried to escape.
SELECT a.name FROM animals a
	JOIN owners o ON a.owner_id = o.id
	WHERE  o.full_name = 'Dean Winchester' AND a.escape_attempts = o;

3.7) Who owns the most animals?
SELECT o.full_name, count(a.owner_id) FROM animals a JOIN owners o on a.owner_id = o.id group by owner_id	

-----------------------------------------------------------------------------------
4.1) Who was the last animal seen by William Tatcher?
SELECT a.name as Animal_Name, vi.date_of_visit from animals a 
	JOIN visits vi On a.id = vi.animal_id JOIN vets ve On ve.id = vi.vets_id
	WHERE ve.name = 'William Tatcher' ORDER BY vi.date_of_visit DESC Limit 1;

4.2) How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCT animal_id) AS Num_of_Animals FROM visits 
	JOIN vets ON visits.vets_id = vets.id JOIN animals ON visits.animal_id = animals.id
	WHERE vets.name = 'Stephanie Mendez';

4.3) List all vets and their specialties, including vets with no specialties.
SELECT vets.name as Vets_Name, species.name AS Specialty FROM vets
	LEFT JOIN specializations sp ON vets.id = sp.vets_id
	LEFT JOIN species ON sp.species_id = species.id	ORDER BY vets.name;

4.4) List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT a.name, a.date_of_birth, a.neutered, a.weight_kg FROM visits
	JOIN vets ON visits.vets_id = vets.id JOIN animals a ON visits.animal_id = a.id
	WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

4.5) What animal has the most visits to vets?
SELECT a.name as Animal_Name, num_visits FROM animals a
	 JOIN (SELECT animal_id, COUNT(*) as num_visits FROM visits
	   GROUP BY animal_id ORDER BY num_visits DESC LIMIT 1) 
	   AS visits_count ON a.id = visits_count.animal_id;

4.6) Who was Maisy Smith's first visit?
SELECT a.name AS Animal_Name, vs.date_of_visit FROM visits vi
	JOIN animals a ON vi.animal_id = a.id JOIN vets On vets.id = vi.vets_id
	WHERE vets.name = 'Maisy Smith' ORDER BY vs.date_of_visit ASC LIMIT 1;

4.7) Details for most recent visit: animal information, vet information, and date of visit.
SELECT a.name AS Animal_Name, a.date_of_birth, a.escape_attempts, a.neutered, a.weight_kg, 
	ve.name AS Vet_Name, ve.age as Vet_Age, ve.date_of_graduation, vi.date_of_visit FROM animals a 
	JOIN visits vi ON vi.animal_id = a.id JOIN vets ve On ve.id = vi.vets_id ORDER BY vi.date_of_visit DESC LIMIT 1 ;

4.8) How many visits were with a vet that did not specialize in that animal's species?
 SELECT count(*) from visits vi 
 	JOIN vets ON vi.vets_id = vets.id JOIN animals a ON vi.animal_id = a.id
	FULL JOIN specializations ss ON ss.vets_id = vets.id AND a.species_id = ss.species_id
	WHERE ss.species_id IS NULL

4.9) What specialty should Maisy Smith consider getting? Look for the species she gets the most.
 SELECT sp.name AS Speciality, count(*) from visits vi 
 	JOIN vets ON vi.vets_id = vets.id JOIN animals a ON vi.animal_id = a.id
	LEFT JOIN specializations ss ON ss.vets_id = vets.id AND a.species_id = ss.species_id
	JOIN species sp ON sp.id = a.species_id
	WHERE ss.species_id IS NULL AND vets.name = 'Maisy Smith' 
	GROUP BY sp.name ORDER BY count DESC LIMIT 1
	
--------------------------------------------------------------------
// Database Perofmance and Audit test queries

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vets_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
