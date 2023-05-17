/* Populate database with sample data. */

INSERT INTO ANIMALS (NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES ('Agumon', '2/3/2020', 0, TRUE, 10.23)
INSERT INTO ANIMALS (NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES ('Gabumon', '11/15/2018', 2, TRUE, 8.00)
INSERT INTO ANIMALS (NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES ('Pikachu', '1/7/2021', 1, FALSE, 15.04)
INSERT INTO ANIMALS (NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) VALUES ('Devimon', '5/12/2017', 5, TRUE, 11)

INSERT INTO ANIMALS (NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG)
VALUES ('Charmander', '2/8/2020', 0, false, 11), ('Plantmon', '11/15/2021', 2, true, -5.7), ('Squirtle', '4/2/1993', 3, false, -12.13),
('Angemon', '6/12/2005', 0, true, -45), ('Boarmon', '6/7/2005', 7, true, 20.4), ('Blossom', '10/13/1998', 3, true, 17), ('Ditto', '5/14/2022', 4, true, 22)

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38)
INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon')
COMMIT
  
UPDATE animals SET species_id = CASE WHEN name ILIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon') 
   ELSE (SELECT id FROM species WHERE name = 'Pokemon') END WHERE species_id IS NULL;

UPDATE animals SET owner_id = 
	CASE 
		WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
		WHEN name IN ('Gabumon', 'Pikachu')THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
		WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
		WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond') 
		ELSE (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
	END
COMMIT

-----------------------------------------------------------------------------

INSERT INTO VETS (NAME, AGE, date_of_graduation) 
VALUES ('William Tatcher', 45, '4/23/2000'), ('Maisy Smith', 26, '1/17/2019'), ('Stephanie Mendez', 64, '5/4/1981'), ('Jack Harkness', 38, '6/8/2008')

INSERT INTO specializations (species_id, vets_id) 
	SELECT s.id, v.id FROM vets v, species s JOIN animals a ON s.id = a.id WHERE s.name = 'Pokemon' AND v.name = 'William Tatcher'
INSERT INTO specializations (species_id, vets_id) 
	(SELECT s.id, v.id FROM vets v, species s JOIN animals a ON s.id = a.id WHERE s.name IN ('Digimon', 'Pokemon') AND v.name = 'Stephanie Mendez')
INSERT INTO specializations (species_id, vets_id) 
	SELECT s.id, v.id FROM vets v, species s JOIN animals a ON s.id = a.id WHERE s.name = 'Digimon' AND v.name = 'Jack Harkness'
		
INSERT INTO visits (animal_id, vets_id, date_of_visit)
 VALUES
   (1, 1, '24 May 2020'),
   (1, 3, '22 Jul 2020'),
   (2, 4, '2 Feb 2021'),
   (3, 2, '5 Jan 2020'),
   (3, 2, '8 Mar 2020'),
   (3, 2, '14 May 2020'),
   (4, 3, '4 May 2021'),
   (5, 4, '24 Feb 2021'),
   (6, 2, '21 Dec 2019'),
   (6, 1, '10 Aug 2020'),
   (6, 2, '7 April 2021'),
   (7, 3, '29 Sep 2019'),
   (8, 4, '3 Oct 2020'),
   (8, 4, '4 Nov 2020'),
   (9, 2, '24 Jan 2019'),
   (9, 2, '15 May 2019'),
   (9, 2, '27 Feb 2020'),
   (9, 2, '7 Aug 2020'),
   (10, 3, '24 May 2020'),
   (10, 1, '11 Jan 2021');


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.) three times
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.) three times
INSERT INTO owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
INSERT INTO owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
INSERT INTO owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
