/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM ANIMALS WHERE name LIKE '%mon'
SELECT * FROM ANIMALS WHERE date_of_birth BETWEEN '1/1/2016' AND '12/31/2019'
SELECT * FROM ANIMALS WHERE neutered  = true AND escape_attempts < 3
SELECT date_of_birth FROM ANIMALS WHERE name = 'Agumon' or name = 'Pikachu'
SELECT name, escape_attempts FROM ANIMALS WHERE weight_kg > 10.5
SELECT * FROM ANIMALS WHERE neutered = true
SELECT * FROM ANIMALS WHERE name != 'Gabumon'
SELECT * FROM ANIMALS WHERE weight_kg BETWEEN 10.4 AND 17.3

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
