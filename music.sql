-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists(
 id SERIAL PRIMARY KEY,
 art TEXT NOT NULL
);
CREATE TABLE albums(
 id SERIAL PRIMARY KEY,
 album TEXT NOT NULL
);
CREATE TABLE producers(
 id SERIAL PRIMARY KEY,
 producer TEXT NOT NULL
);


CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artist INTEGER REFERENCES artists ON DELETE CASCADE,
  album INTEGER REFERENCES albums ON DELETE CASCADE,
  producer INTEGER REFERENCES producers ON DELETE CASCADE
);

INSERT INTO artists(art)
VALUES
('Hanson'),
('Queen'),
('Mariah Cary');

INSERT INTO albums(album)
VALUES
('Middle of Nowhere'),
('A Night at the Opera'),
('Daydream');

INSERT INTO producers(producer)
VALUES
('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff');

INSERT INTO songs
  (title, duration_in_seconds, release_date, artist, album, producer)
VALUES
('MMMBop', 238, '04-15-1997', 1, 1, 1);
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');
