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

SELECT a.name, o.full_name 
FROM animals a JOIN owners o ON a.owner_id = o.id 
where o.full_name = 'Melody Pond';

SELECT a.name, s.name, a.date_of_birth 
FROM animals a JOIN species s
ON 
a.species_id = s.id
WHERE s.name =  'Pokemon';

SELECT o.full_name, a.name
FROM owners o LEFT JOIN animals a 
ON
o.id = a.owner_id;

SELECT count(*), s.name
FROM animals a JOIN species s
ON a.species_id = s.id
GROUP BY s.id;

SELECT s.name, o.full_name, a.name
FROM animals a JOIN species s
ON a.species_id = s.id
JOIN
owners o ON a.owner_id = o.id
WHERE o.full_name = 'Jennifer Orwell' 
AND 
s.name = 'Digimon';


SELECT a.name FROM animals a JOIN owners o
ON a.owner_id = o.id
Where a.escape_attempts = 0 AND o.full_name = 'Dean Winchester';

SELECT o2.full_name,ao.num FROM (SELECT count(a.*) as num, a.owner_id
FROM animals a JOIN owners o
ON a.owner_id = o.id
GROUP BY a.owner_id) as ao JOIN owners o2
ON
ao.owner_id = o2.id
WHERE ao.num =  (select max(max_animals.num)FROM (SELECT count(a.*) as num, a.owner_id
FROM animals a JOIN owners o
ON a.owner_id = o.id
GROUP BY a.owner_id) max_animals);


SELECT  animals.name
FROM visits JOIN vets ON  visits.vet_id = vets.id JOIN animals ON visits.animal_id = animals.id
WHERE vets.name = 'William Tatcher' 
    AND
visits.date_of_visit = ( SELECT max(date_of_visit)
FROM visits JOIN vets ON  visits.vet_id = vets.id
WHERE vets.name = 'William Tatcher'
);

SELECT count(*) 
FROM (SELECT DISTINCT animals.name, vets.name
FROM visits JOIN vets ON  visits.vet_id = vets.id JOIN animals ON visits.animal_id = animals.id
Where vets.name ='Stephanie Mendez') as counter;

SELECT vets.name, species.name
FROM vets 
LEFT JOIN 
specializations 
ON 
vets.id = specializations.vet_id 
LEFT JOIN 
species
ON 
species.id = specializations.species_id;

SELECT a.name
FROM animals a 
JOIN visits v 
ON a.id = v.animal_id
JOIN vets 
ON v.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez' 
AND 
v.date_of_visit BETWEEN '4-1-2020' AND '8-30-2020';

SELECT animals.name
FROM (SELECT count (*) as num_of_visit, animal_id
FROM visits
GROUP BY animal_id
ORDER BY num_of_visit DESC
LIMIT 1) top_visit JOIN animals ON top_visit.animal_id = animals.id;


SELECT animals.name, visits.date_of_visit
FROM visits 
JOIN vets 
ON visits.vet_id = vets.id
JOIN animals ON animals.id = visits.animal_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit
LIMIT 1;

SELECT animals.name as Animal, vets.name as Doctor, species.name as specializations ,visits.date_of_visit as Date_of_Visit
FROM visits 
JOIN vets 
ON visits.vet_id = vets.id
JOIN animals ON animals.id = visits.animal_id
JOIN specializations ON
vets.id = specializations.vet_id
JOIN species ON
species.id = specializations.species_id
ORDER BY visits.date_of_visit DESC
LIMIT 1;

SELECT count (*)
FROM (SELECT vets.name, species.name, vets.id
FROM vets 
LEFT JOIN 
specializations 
ON 
vets.id = specializations.vet_id 
LEFT JOIN 
species
ON 
species.id = specializations.species_id
WHERE species.name IS NULL) AS no_specializations 
JOIN
visits ON
visits.vet_id = no_specializations.id;



SELECT top_visited
FROM (SELECT COUNT(*) as most_animal, species.name as top_visited
FROM vets 
JOIN
visits ON visits.vet_id = vets.id
JOIN
animals ON animals.id = visits.animal_id
JOIN 
species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY most_animal DESC
LIMIT 1) as most_visits;





