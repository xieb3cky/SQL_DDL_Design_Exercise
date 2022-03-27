
-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space;

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  planet TEXT NOT NULL
);

CREATE TABLE orbits_arounds(
id SERIAL PRIMARY KEY,
orbit_around TEXT NOT NULL
);

CREATE TABLE galaxys(
  id SERIAL PRIMARY KEY,
  galaxy TEXT NOT NULL
);

CREATE TABLE moons(
  id SERIAL PRIMARY KEY,
  moon TEXT NOT NULL
);


CREATE TABLE outer_space(
  id SERIAL PRIMARY KEY,
  planet INTEGER REFERENCES planets ON DELETE CASCADE,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES orbits_arounds ON DELETE CASCADE,
  galaxy INTEGER REFERENCES galaxys ON DELETE CASCADE,
  moon INTEGER REFERENCES moons ON DELETE CASCADE
);

INSERT INTO planets(planet)
VALUES
('Earth'),
('Mars'),
('Mars'),
('Neptune'),
('Proxima Centauri b'),
('Gliese 876 b');

INSERT INTO orbits_arounds(orbit_around)
VALUES
('The Sun'),
('Proxima Centauri'),
('Gliese 876');

INSERT INTO galaxys(galaxy)
VALUES
('Milky Way');

INSERT INTO moons(moon)
VALUES
('The Moon'),
('Deimos');

INSERT INTO outer_space(planet, orbital_period_in_years, orbits_around, galaxy, moon)
VALUES(1,1.00, 1, 1, 1),(2,1.88, 1, 1, 2);


-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Mars', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');