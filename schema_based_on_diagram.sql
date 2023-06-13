CREATE DATABASE CLINIC;


CREATE TABLE patients (
    id INT GENERATED ALWAYS as IDENTITY,
    name VARCHAR(255),
    date_of_birth date,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories(
    id INT GENERATED ALWAYS as IDENTITY,
    admitted_at timestamp,
    patient_id int,
    status VARCHAR(50),
    CONSTRAINT fk_patient_id FOREIGN KEY(patient_id )REFERENCES patients(id),
    PRIMARY KEY (id)
);

CREATE INDEX idx_patient_id ON patients(id);

CREATE TABLE treatments (
    id INT GENERATED ALWAYS as IDENTITY,
    type VARCHAR(255),
    name VARCHAR(255),
    PRIMARY KEY (id)
);