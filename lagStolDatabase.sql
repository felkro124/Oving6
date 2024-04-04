-- Lage database system for OBLIG 6 og ordne spørringer 

CREATE TABLE Kunde(
    kunde_id INT PRIMARY KEY,
    navn VARCHAR(100),
    adresse VARCHAR(255)
);

CREATE TABLE Ordre(
    ordre_nr INT PRIMARY KEY,
    ordre_dato DATE,
    antatt_lev_dato DATE,
    reell_lev_dato DATE,
    kunde_id INT,
    betalings_status VARCHAR(50),
    avtalt_rabatt DECIMAL(5,2),
    FOREIGN KEY (kunde_id) REFERENCES Kunde(kunde_id)
);

CREATE TABLE Bestilling(
    bestilling_id INT PRIMARY KEY,
    ordre_id INT,
    FOREIGN KEY (ordre_id) REFERENCES Ordre(ordre_nr)
);

CREATE TABLE Stol(
    stol_id INT PRIMARY KEY,
    stol_modell VARCHAR(50),
    stol_type VARCHAR(50),
    antall INT,
    bestilling_id INT,
    FOREIGN KEY (bestilling_id) REFERENCES Bestilling(bestilling_id)
);

CREATE TABLE Standardstol(
    standardstol_id INT PRIMARY KEY,
    pris DECIMAL(10,2),
    lagerbeholdning INT,
    stol_id INT,
    FOREIGN KEY (stol_id) REFERENCES Stol(stol_id)
);

CREATE TABLE Spesialstol(
    spesialstol_id INT PRIMARY KEY,
    stoffrull_nr INT,
    stoffrull_meter DECIMAL(5,2),
    stol_id INT,
    FOREIGN KEY (stol_id) REFERENCES Stol(stol_id)
);

CREATE TABLE Deltype(
    deltype_navn VARCHAR(50),
    deltype_nr INT,
    deltype_farge VARCHAR(50),
    deltype_pris DECIMAL(10,2),
    deltype_beskrivelse TEXT,
    antall INT,
    arbeidstasjons_nr INT,
    PRIMARY KEY (deltype_navn, deltype_nr)
);

CREATE TABLE Arbeidstasjon(
    arbeidstasjons_nr INT PRIMARY KEY,
    plassering VARCHAR(50),
    informasjon TEXT
);

CREATE TABLE Stoffrull(
    stoffrull_nr INT PRIMARY KEY,
    deltype_navn VARCHAR(50),
    deltype_nr INT,
    meter DECIMAL(5,2),
    FOREIGN KEY (deltype_navn, deltype_nr) REFERENCES Deltype(deltype_navn, deltype_nr)
);

CREATE TABLE Spesialstol_behov(
    spesialstol_navn VARCHAR(50),
    deltype_navn VARCHAR(50),
    deltype_nr INT,
    PRIMARY KEY (spesialstol_navn, deltype_navn, deltype_nr),
    FOREIGN KEY (deltype_navn, deltype_nr) REFERENCES Deltype(deltype_navn, deltype_nr)
);