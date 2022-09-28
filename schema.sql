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
