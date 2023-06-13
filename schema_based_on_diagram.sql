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

----------------------------------------------------------------------
----------------------------------------------------------------------

CREATE TABLE treatment_medical_history (
    id INT GENERATED ALWAYS as IDENTITY,
    medical_history_id INT,
    treatment_id INT,
    CONSTRAINT fk_treatment_history_id FOREIGN KEY(treatment_id) REFERENCES treatments(id),
    CONSTRAINT fk_medical_history_id FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id),
    PRIMARY KEY (id)
);

CREATE INDEX idx_treatment_history ON treatment_medical_history (medical_history_id,treatment_id);

CREATE TABLE invoices(
    id INT GENERATED ALWAYS as IDENTITY,
    total_amount Decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id INT,
    CONSTRAINT fk_medical_history_id FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
    PRIMARY KEY (id)
);

CREATE INDEX idx_invoice_medical_history_id ON invoices(medical_history_id);

CREATE TABLE invoice_items(
     id INT GENERATED ALWAYS as IDENTITY,
     unit_price DECIMAL,
     quantity INT,
     total_price DECIMAL,
     invoice_id INT,
     treatment_id INT,
     CONSTRAINT fk_incoice_id FOREIGN KEY (invoice_id) REFERENCES invoices(id),
     CONSTRAINT fk_treatment_id FOREIGN KEY (treatment_id) REFERENCES treatments(id),
     PRIMARY KEY (id)
);

CREATE INDEX idx_invoice_item_invoice ON invoice_items(invoice_id,treatment_id);