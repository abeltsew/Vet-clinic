/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Agumon','2-3-2020', 10.23,'1',0);
INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Gabumon','11-1-2018', 8,'1',2);
INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Pikachu','1-7-2021', 15.04,'0',1);
INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Devimon','5-12-2017', 11,'1',5);


INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Charmander', '2-8-2020',-11,'0',0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Plantmon', '11-15-2021',-5.7,'1',2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Squirtle', '4-2-1993',-12.13,'0',3);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Angemon', '6-12-2005',-45,'1',1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Boarmon', '6-7-2005',20.4,'1',7);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Blossom', '10-13-1998',17,'1',3);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Ditto', '5-14-2022',22,'1',4);


INSERT INTO owners (full_name, age) 
VALUES 
('Sam Smith',34),
('Jennifer Orwell',19),
('Bob', 45 ),
('Melody Pond', 77 ),
('Dean Winchester', 14 ),
('Jodie Whittaker', 38 );

INSERT INTO species (name) 
VALUES ('Pokemon'), ('Digimon');

UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = 1
WHERE species_id IS NULL;

UPDATE animals
SET owner_id = (select id from owners where full_name = 'Sam Smith' LIMIT 1)
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (select id from owners where full_name = 'Jennifer Orwell' LIMIT 1)
WHERE name in ('Gabumon','Pikachu');

UPDATE animals
SET owner_id = (select id from owners where full_name = 'Bob' LIMIT 1)
WHERE name in('Devimon','Plantmon');

UPDATE animals
SET owner_id = (select id from owners where full_name = 'Melody Pond' LIMIT 1)
WHERE name in ('Charmander','Squirtle', 'Blossom' );

UPDATE animals
SET owner_id = (select id from owners where full_name = 'Dean Winchester' LIMIT 1)
WHERE name in( 'Boarmon','Angemon' );


INSERT INTO vets (name, age, date_of_graduation) VALUES
    ('William Tatcher',45,'4-23-2000'),
    ('Maisy Smith',26,'1-17-2019'),
    ('Stephanie Mendez',64,'5-4-1981'),
    ('Jack Harkness', 38, '6-8-2008');

INSERT INTO specializations VALUES (1,1),(3,1),(3,2),(4,2);


INSERT INTO visits (animal_id,vet_id, date_of_visit)
VALUES 
    (1,1,'5-24-2020'),
    (1,3,'7-22-2020'),
    (2,4,'2-2-2021'),
    (3,2,'1-5-2020'),
    (3,2,'3-8-2020'),
    (3,2,'5-14-2020'),
    (4,3,'5-4-2021'),
    (5,4,'2-24-2021'),
    (6,2,'12-21-2019'),
    (6,2,'4-7-2021'),
    (7,3,'9-29-2019'),
    (8,4,'10-3-2020'),
    (8,4,'11-4-2020'),
    (9,2,'1-24-2019'),
    (9,2,'5-15-2019'),
    (9,2,'2-27-2020'),
    (9,2,'8-3-2020'),
    (10,3,'5-24-2020'),
    (10,1,'1-11-2021');