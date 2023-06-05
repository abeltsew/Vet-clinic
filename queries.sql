/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM  animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = '1' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name in ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = '1';
SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;

UPDATE animals
SET species = 'digimon'
WHERE name like '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species is null;

COMMIT;

BEGIN;

DELETE FROM animals WHERE 1=1;

ROLLBACK;


BEGIN; 

DELETE From animals
WHERE date_of_birth > '01-01-2022';

SAVEPOINT delete_after_jan_2022;

UPDATE animals
SET weight_kg = weight_kg * -1;

ROLLBACK TO delete_after_jan_2022;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

COMMIT;


SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered
FROM animals
GROUP BY neutered
HAVING SUM(escape_attempts) = (
    SELECT MAX(max_attempt)
    FROM (
        SELECT SUM(escape_attempts) AS max_attempt
        FROM animals
        GROUP BY neutered
    ) AS escapes
);

SELECT MIN(weight_kg) MAX(weight_kg) FROM animals;

SELECT species,AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '01-01-1990' AND '12-31-2000' 
GROUP BY species;