CREATE TABLE medical_histories (
    id              int GENERATED ALWAYS AS IDENTITY,
    admitted_at     timestamp,
    patient_id      int,
    status          varchar(n),
    PRIMARY KEY(id),
    FOREIGN KEY(patient_id) REFERENCES patients(id)
);

CREATE TABLE treatments (
    id              int GENERATED ALWAYS AS IDENTITY,
    type            varchar(n),
    name            varchar(n),
    PRIMARY KEY(id)
);

CREATE TABLE invoice_items (
    id                    int GENERATED ALWAYS AS IDENTITY,
    unit_price            decimal,
    quantity              int,
    total_price           decimal,
    invoice_id            int,
    treatment_id          int,
    PRIMARY KEY(id),
    FOREIGN KEY(invoice_id) REFERENCES invoices(id),
    FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);

CREATE TABLE invoices (
    id                    int,
    total_amount          decimal,
    generated_at          timestamp,
    payed_at              timestamp,
    medical_history_id    int,
    PRIMARY KEY(id),
    FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE patients (
    id                  int,
    name                varchar(n),
    date_of_birth       date,
    PRIMARY KEY(id)
);

CREATE TABLE medical_histories-treatments-jointable (
    medical_history_id       int,
    treatment_id             int,
    FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);
