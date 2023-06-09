CREATE DATABASE IF NOT EXIST Clinic;

CREATE TABLE IF NOT EXISTS patients (
	ID INT GENERATED ALWAYS AS IDENTITY,
	NAME VARCHAR(50),
	DATE_OF_BIRTH DATE,
	PRIMARY KEY(ID)
)

CREATE TABLE IF NOT EXISTS medical_histories (
	ID INT GENERATED ALWAYS AS IDENTITY,
	admitted_at timestamp,
	status VARCHAR(150),
	patient_id INT REFERENCES patients(id),
	PRIMARY KEY(ID)
)

CREATE INDEX ON medical_histories (patient_id);

CREATE TABLE IF NOT EXISTS treatments (
	ID INT GENERATED ALWAYS AS IDENTITY,
	type VARCHAR(20),
	name VARCHAR(50),
	PRIMARY KEY(ID)
)

CREATE TABLE IF NOT EXISTS medical_treatments (
	ID INT GENERATED ALWAYS AS IDENTITY,
	medical_history_id INT REFERENCES medical_histories(id),
	treatment_id INT REFERENCES treatments(id),
	PRIMARY KEY(ID)
)

CREATE INDEX ON medical_histories_has_treatments (medical_history_id);

CREATE INDEX ON medical_histories_has_treatments (treatment_id);

CREATE TABLE IF NOT EXISTS invoices (
	ID INT GENERATED ALWAYS AS IDENTITY,
	total_amount DECIMAL,
	generated_at timestamp,
	payed_at timestamp,
	medical_history_id INT REFERENCES medical_histories(id),
	PRIMARY KEY(ID)
)

CREATE INDEX ON invoices (medical_history_id);

CREATE TABLE IF NOT EXISTS invoice_items (
	ID INT GENERATED ALWAYS AS IDENTITY,
	unity_price DECIMAL,
	quantity INT,
	total_price DECIMAL,
	invoice_id INT REFERENCES invoices(id),
	treatment_id INT REFERENCES treatments(id),
	PRIMARY KEY(ID)
)

CREATE INDEX ON invoice_items (invoice_id);

CREATE INDEX ON invoice_items (treatment_id);