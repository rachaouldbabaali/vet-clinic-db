CREATE DATABASE clinic;

CREATE TABLE patients(
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE
    );

CREATE TABLE medical_histories(
    id SERIAL NOT NULL PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT REFERENCES patients(id),
    status VARCHAR(100),
    );

CREATE TABLE treatments(
    id SERIAL NOT NULL PRIMARY KEY,
    type VARCHAR(100),name VARCHAR(100)
    );

CREATE TABLE medical_histories_treatments (
    medical_histories_id INT REFERENCES medical_histories(id),
    treatments INT REFERENCES treatments(id));

CREATE TABLE invoices ( 
    id SERIAL NOT NULL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT NOT NULL,
    UNIQUE(medical_history_id),
    FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
    );
    
CREATE TABLE invoice_items (
    id SERIAL NOT NULL PRIMARY KEY,unit_price DECIMAL,
    quantity INT,total_price DECIMAL,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id)
    );

-- Add foreign key indexes
CREATE INDEX fk_medical_histories_patients_idx ON medical_histories (patient_id);
CREATE INDEX fk_invoices_medical_histories_idx ON invoices (medical_history_id);
CREATE INDEX fk_invoice_items_invoices_idx ON invoice_items (invoice_id);
CREATE INDEX fk_invoice_items_treatments_idx ON invoice_items (treatment_id);
