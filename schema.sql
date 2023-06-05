/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int generated alwasy as identity,
    name varchar(50) not null,
    date_of_birth date, 
    escape_attempts int,
    neutered bit,
    weight_kg float,  
);
