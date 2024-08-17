camper: /project$ psql --username=freecodecamp --dbname=postgres
Border style is 2.
Pager usage is off.
psql (12.17 (Ubuntu 12.17-1.pgdg22.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

postgres=> 
postgres=> CREATE DATABASE universe;
CREATE DATABASE
postgres=> \c universe
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "universe" as user "freecodecamp".
universe=> CREATE TABLE galaxy (
universe(>   galaxy_id SERIAL PRIMARY KEY,
universe(>   name VARCHAR(100) UNIQUE NOT NULL,
universe(>   type VARCHAR(50) NOT NULL,
universe(>   age_in_millions_of_years NUMERIC NOT NULL,
universe(>   distance_from_earth INT NOT NULL,
universe(>   has_life BOOLEAN NOT NULL,
universe(>   description TEXT
universe(> );CREATE TABLE star (
  name VARCHAR(100) UNIQUE NOT NULL,
  galaxy_id ICREATE TABLE
universe(>   star_id SERIAL PRIMARY KEY,
universe(>   name VARCHAR(100) UNIQUE NOT NULL,
universe(>   galaxy_id INT REFERENCES galaxy(galaxy_id),
universe(>   type VARCHAR(50),
universe(>   mass NUMERIC,
universe(>   is_spherical BOOLEAN NOT NULL
universe(> );
CREATE TABLE
universe=> CREATE TABLE planet (
universe(>   planet_id SERIAL PRIMARY KEY,
universe(>   name VARCHAR(100) UNIQUE NOT NULL,
universe(>   star_id INT REFERENCES star(star_id),
universe(>   type VARCHAR(50),
universe(>   mass NUMERIC NOT NULL,
universe(>   has_life BOOLEAN NOT NULL
universe(> );
CREATE TABLE
universe=> CREATE TABLE moon (
universe(>   moon_id SERIAL PRIMARY KEY,
universe(>   name VARCHAR(100) UNIQUE NOT NULL,
universe(>   planet_id INT REFERENCES planet(planet_id),
universe(>   diameter INT NOT NULL,
universe(>   distance_from_planet INT NOT NULL
universe(> );
CREATE TABLE
universe=> CREATE TABLE satellite (
universe(>   satellite_id SERIAL PRIMARY KEY,
universe(>   name VARCHAR(100) UNIQUE NOT NULL,
universe(>   planet_id INT REFERENCES planet(planet_id),
universe(>   type VARCHAR(50) NOT NULL,
universe(>   active BOOLEAN NOT NULL
universe(> );
CREATE TABLE
universe=> INSERT INTO galaxy (name, type, age_in_millions_of_years, distance_from_earth, has_life, description) 
universe-> VALUES 
universe-> ('Milky Way', 'Spiral', 13600, 0, TRUE, 'The Milky Way is our home galaxy, containing billions of stars including our Sun.'),
universe-> ('Andromeda', 'Spiral', 10000, 2537000, FALSE, 'The Andromeda Galaxy is on a collision course with the Milky Way.'),
universe-> ('Triangulum', 'Spiral', 10000, 3000000, FALSE, 'The Triangulum Galaxy is a member of our Local Group.'),
universe-> ('Whirlpool', 'Spiral', 5000, 23000000, FALSE, 'The Whirlpool Galaxy is famous for its beautiful spiral arms.'),
universe-> ('Sombrero', 'Elliptical', 12000, 29000000, FALSE, 'The Sombrero Galaxy is known for its bright nucleus and large central bulge.'),
universe-> ('Cartwheel', 'Lenticular', 1500, 500000, FALSE, 'The Cartwheel Galaxy is a ring-shaped galaxy.');
INSERT 0 6
universe=> INSERT INTO star (name, galaxy_id, type, mass, is_spherical)
universe-> VALUES
universe-> ('Sun', 1, 'G-Type', 1.989, TRUE),
universe-> ('Alpha Centauri', 2, 'G-Type', 2.1, TRUE),
universe-> ('Betelgeuse', 1, 'Red Supergiant', 20, TRUE),
universe-> ('Proxima Centauri', 1, 'Red Dwarf', 0.12, TRUE),
universe-> ('Sirius', 2, 'A-Type', 2.02, TRUE),
universe-> ('Vega', 3, 'A-Type', 2.1, TRUE);
INSERT 0 6
universe=> INSERT INTO planet (name, star_id, type, mass, has_life)
universe-> VALUES
universe-> ('Mercury', 1, 'Terrestrial', 0.33, FALSE),
universe-> ('Venus', 1, 'Terrestrial', 4.87, FALSE),
universe-> ('Earth', 1, 'Terrestrial', 5.97, TRUE),
universe-> ('Mars', 1, 'Terrestrial', 0.64, FALSE),
universe-> ('Jupiter', 1, 'Gas Giant', 1898, FALSE),
universe-> ('Saturn', 1, 'Gas Giant', 568, FALSE),
universe-> ('Uranus', 1, 'Ice Giant', 86.8, FALSE),
universe-> ('Neptune', 1, 'Ice Giant', 102, FALSE),
universe-> ('Proxima b', 4, 'Terrestrial', 1.27, FALSE),
universe-> ('Kepler-452b', 5, 'Super-Earth', 5, FALSE),
universe-> ('TRAPPIST-1d', 6, 'Terrestrial', 0.39, FALSE),
universe-> ('Gliese 581g', 6, 'Super-Earth', 3.1, FALSE);
INSERT 0 12
universe=> INSERT INTO moon (name, planet_id, diameter, distance_from_planet)
universe-> VALUES
universe-> ('Moon', 3, 3474, 384400),
universe-> ('Phobos', 4, 22.4, 9377),
universe-> ('Deimos', 4, 12.4, 23459),
universe-> ('Europa', 5, 3121, 671000),
universe-> ('Ganymede', 5, 5268, 1070000),
universe-> ('Callisto', 5, 4820, 1883000),
universe-> ('Io', 5, 3643, 421800),
universe-> ('Titan', 6, 5150, 1222000),
universe-> ('Enceladus', 6, 504, 237948),
universe-> ('Mimas', 6, 396, 185539),
universe-> ('Triton', 8, 2707, 354800),
universe-> ('Nereid', 8, 340, 5513819),
universe-> ('Charon', 8, 1212, 19570),
universe-> ('Oberon', 7, 1523, 583520),
universe-> ('Titania', 7, 1578, 436300),
universe-> ('Rhea', 6, 1528, 527108),
universe-> ('Tethys', 6, 1062, 294619),
universe-> ('Dione', 6, 1123, 377415),
universe-> ('Iapetus', 6, 1469, 3560820),
universe-> ('Miranda', 7, 471, 129390);
INSERT 0 20
universe=> INSERT INTO satellite (name, planet_id, type, active)
universe-> VALUES
universe-> ('Hubble Space Telescope', 3, 'Telescope', TRUE),
universe-> ('ISS', 3, 'Space Station', TRUE),
universe-> ('Voyager 1', 5, 'Probe', FALSE);
INSERT 0 3