/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM ANIMALS WHERE name LIKE '%mon'
SELECT * FROM ANIMALS WHERE date_of_birth BETWEEN '1/1/2016' AND '12/31/2019'
SELECT * FROM ANIMALS WHERE neutered  = true AND escape_attempts < 3
SELECT date_of_birth FROM ANIMALS WHERE name = 'Agumon' or name = 'Pikachu'
SELECT name, escape_attempts FROM ANIMALS WHERE weight_kg > 10.5
SELECT * FROM ANIMALS WHERE neutered = true
SELECT * FROM ANIMALS WHERE name != 'Gabumon'
SELECT * FROM ANIMALS WHERE weight_kg BETWEEN 10.4 AND 17.3
