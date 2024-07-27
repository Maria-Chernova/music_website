CREATE TABLE IF NOT EXISTS Artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Albums (
    id SERIAL PRIMARY KEY,
    album_title VARCHAR(60) NOT NULL,
    year_of_release VARCHAR(4) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Tracks (
    id SERIAL PRIMARY KEY,
    track_name VARCHAR(60) NOT NULL,
    duration VARCHAR(8) NOT NULL,
    album_id INTEGER REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Compilations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    year_of_release VARCHAR(4) NOT NULL
);

CREATE TABLE IF NOT EXISTS Tracks_in_the_compilation (
    track_id INTEGER REFERENCES Tracks(id),
    compilation_id INTEGER REFERENCES Compilations(id),
    CONSTRAINT pk_tracks_compilation PRIMARY KEY (track_id, compilation_id)
);

CREATE TABLE IF NOT EXISTS Artists_albums (
    artist_id INTEGER REFERENCES Artists(id),
    album_id INTEGER REFERENCES Albums(id),
    CONSTRAINT pk_artists_albums PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS Artists_genres (
	artist_id INTEGER REFERENCES Artists(id),
	genre_id INTEGER REFERENCES Genres(id),
	CONSTRAINT pk_artists_genres PRIMARY KEY (artist_id, genre_id)
);