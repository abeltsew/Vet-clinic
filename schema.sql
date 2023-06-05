/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int generated always as identity,
    name varchar(50) not null,
    date_of_birth date, 
    escape_attempts int,
    neutered bit,
    weight_kg float,  
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

    