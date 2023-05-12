/* Database schema to keep the structure of entire database. */

CREATE TABLE ANIMALS (ID SERIAL PRIMARY KEY, NAME VARCHAR(30), DATE_OF_BIRTH DATE, ESCAPE_ATTEMPTS INTEGER, NEUTERED BOOLEAN, WEIGHT_KG Decimal)
ALTER TABLE ANIMALS ADD species varchar(255)

CREATE TABLE owners (ID SERIAL PRIMARY KEY, full_name VARCHAR(50), age INTEGER)
CREATE TABLE species (ID SERIAL PRIMARY KEY, name VARCHAR(50))

ALTER TABLE animals DROP species
COMMIT

ALTER TABLE animals ADD species_id INTEGER
ALTER TABLE animals ADD CONSTRAINT fks FOREIGN KEY(species_id) REFERENCES species(ID)
COMMIT

ALTER TABLE animals ADD owner_id INTEGER
ALTER TABLE animals ADD CONSTRAINT fko FOREIGN KEY(owner_id) REFERENCES owners(ID)
COMMIT

CREATE TABLE vets (ID SERIAL PRIMARY KEY, name VARCHAR(50), age INTEGER, date_of_graduation DATE	)

CREATE TABLE specializations (
	species_id INTEGER,
	vets_id INTEGER,
	FOREIGN KEY (species_id) REFERENCES species(ID),
	FOREIGN KEY (vets_id) REFERENCES vets(ID)
	)

CREATE TABLE visits (
	animal_id INTEGER,
	vets_id INTEGER,
	date_of_vist Date,
	FOREIGN KEY (animal_id) REFERENCES animals (ID),
	FOREIGN KEY (vets_id) REFERENCES vets(ID)
	)
