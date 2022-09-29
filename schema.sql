/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id                  INT GENERATED ALWAYS AS IDENTITY,
    name                text,
    date_of_birth       date,
    escape_attempts     int,
    neutered            bit,
    weight_kg           decimal           
);

ALTER TABLE animals ADD species text;

CREATE TABLE owners(
    id              INT GENERATED ALWAYS AS IDENTITY,
    full_name       text,
    age             int,
    PRIMARY KEY(id)
);

CREATE TABLE species(
    id           INT GENERATED ALWAYS AS IDENTITY,
    name         text,
    PRIMARY KEY(id)
);

ALTER TABLE animals ADD CONSTRAINT animals_pk PRIMARY KEY (id);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD species_id int;

ALTER TABLE animals
ADD CONSTRAINT species_id_fk
FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals ADD owner_id int;

ALTER TABLE animals
ADD CONSTRAINT owner_id_fk
FOREIGN KEY (owner_id) REFERENCES owners(id);