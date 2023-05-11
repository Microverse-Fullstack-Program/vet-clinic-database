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
