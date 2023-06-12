/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int generated always as identity,
    name varchar(50) not null,
    date_of_birth date, 
    escape_attempts int,
    neutered bit,
    weight_kg float,  
    PRIMARY KEY (id)
);


    ALTER TABLE animals
    ADD COLUMN species varchar(50);


    CREATE TABLE owners (
        id int generated always as identity not null,
        full_name varchar(50),
        age int,
        PRIMARY KEY (id)
    );

    CREATE TABLE species (
        id int generated always as identity not null,
        name varchar(50),
        PRIMARY key(id)
    );

    ALTER TABLE animals
    DROP COLUMN species;

    ALTER TABLE animals 
    ADD COLUMN species_id int;

    ALTER TABLE animals
    ADD CONSTRAINT fk_species  
        FOREIGN KEY(species_id) 
        REFERENCES species(id) 
        ON DELETE CASCADE;


  ALTER TABLE animals 
    ADD COLUMN owner_id int;

    ALTER TABLE animals
    ADD CONSTRAINT fk_owners 
        FOREIGN KEY(owner_id) 
        REFERENCES owners(id) 
        ON DELETE CASCADE;

    
    CREATE TABLE vets (
        id int generated always as identity,
        name varchar(50),
        age int ,
        date_of_graduation date,
        PRIMARY KEY(id)
    );


    CREATE TABLE specializations (
        vet_id int,
        species_id int,
        CONSTRAINT fk_vets FOREIGN key(vet_id)
        REFERENCES vets(id),
        CONSTRAINT fk_species_spec FOREIGN KEY(species_id)
        REFERENCES species(id),
        PRIMARY KEY(vet_id,species_id)
    );

    CREATE TABLE visits (
        animal_id int,
        vet_id int,
        date_of_visit date,
        CONSTRAINT fk_animal_visit FOREIGN key(animal_id) 
        REFERENCES animals(id),
        CONSTRAINT fk_vets_visit FOREIGN key(vet_id)
        REFERENCES vets(id),
        PRIMARY KEY(animal_id,vet_id,date_of_visit)
    );


    ALTER TABLE owners ADD COLUMN email VARCHAR(120);

    ALTER TABLE visits DROP CONSTRAINT visits_pkey;


    -- Create index to improve performance

    CREATE INDEX ix_animal_id_visits ON visits(animal_id);

    CREATE INDEX ix_vet_id_visits ON visits(vet_id);

    CREATE INDEX ix_email_owners ON owners(email);