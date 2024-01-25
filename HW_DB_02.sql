CREATE TABLE IF NOT EXISTS MusicGenre (
	id SERIAL PRIMARY KEY,  -- автоинкремент id
	genre VARCHAR(40) NOT NULL
	);
	
CREATE TABLE IF NOT EXISTS MusicBands (
	id SERIAL PRIMARY KEY,
	bands_name VARCHAR(80) NOT NULL
	);
	
CREATE TABLE IF NOT EXISTS MusicGenre_MusicBands (
	genre_id INTEGER REFERENCES MusicGenre(id),
	bands_name_id INTEGER REFERENCES MusicBands(id),
	CONSTRAINT pk PRIMARY KEY (genre_id, bands_name_id)
	);
	
CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY,
	release_date date NOT NULL,
	album_name VARCHAR(80) NOT NULL
	);
	
CREATE TABLE IF NOT EXISTS MusicBands_Albums (
	bands_name_id INTEGER REFERENCES MusicBands(id),
	album_id INTEGER REFERENCES Albums(id),
	CONSTRAINT pk_MBA PRIMARY KEY (bands_name_id, album_id)
	);
	
CREATE TABLE IF NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES Albums(id),
	duration DECIMAL(10,2) NOT NULL,
	track_name VARCHAR(80) NOT NULL
	);
	
CREATE TABLE IF NOT EXISTS Collection_of_songs (
	id SERIAL PRIMARY KEY,
	collection_name VARCHAR(80) NOT NULL,
	release_date date NOT NULL,
	album_id INTEGER NOT NULL REFERENCES Albums(id),
	track_ids INTEGER[] NOT NULL
	);

-- схема отношений "Сотрудник"

CREATE TABLE IF NOT EXISTS Employee (
	emp_id INTEGER PRIMARY KEY,
	emp_name VARCHAR(20) NOT NULL,
	dept VARCHAR(128) NOT NULL,
	boss VARCHAR(20)
	);
	
CREATE TABLE IF NOT EXISTS Boss (
	boss_person_id INTEGER PRIMARY KEY,
	emp_id INTEGER not null REFERENCES Employee(emp_id)
	);