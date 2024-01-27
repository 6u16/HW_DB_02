-- все переменные и названия таблиц пишем с МАЛЕНЬКОЙ буквы блядь!!!!!!!!!

CREATE TABLE IF NOT EXISTS musicgenre (
	id SERIAL PRIMARY KEY,  -- автоинкремент id
	genre VARCHAR(40) NOT NULL
	);
	
CREATE TABLE IF NOT EXISTS musicbands (
	id SERIAL PRIMARY KEY,
	bands_name VARCHAR(80) NOT NULL
	);
	
CREATE TABLE IF NOT EXISTS musicgenre_musicbands (
	genre_id INTEGER REFERENCES musicgenre(id),
	bands_name_id INTEGER REFERENCES musicbands(id),
	CONSTRAINT pk PRIMARY KEY (genre_id, bands_name_id)
	);
	
CREATE TABLE IF NOT EXISTS albums (
	id SERIAL PRIMARY KEY,
	release_date date NOT NULL,
	album_name VARCHAR(80) NOT NULL
	);
	
CREATE TABLE IF NOT EXISTS musicbands_albums (
	bands_name_id INTEGER REFERENCES musicbands(id),
	album_id INTEGER REFERENCES albums(id),
	CONSTRAINT pk_MBA PRIMARY KEY (bands_name_id, album_id)
	);
	
CREATE TABLE IF NOT EXISTS tracks (
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES albums(id),
	duration DECIMAL(10,2) NOT NULL,
	track_name VARCHAR(80) NOT NULL
	);
	
CREATE TABLE IF NOT EXISTS collection_of_songs (
	id SERIAL PRIMARY KEY,
	collection_name VARCHAR(80) NOT NULL,
	release_date date NOT NULL,
	album_id INTEGER NOT NULL REFERENCES albums(id),
	track_ids INTEGER[] NOT NULL
	);

-- схема отношений "Сотрудник"

CREATE TABLE IF NOT EXISTS employee (
	emp_id INTEGER PRIMARY KEY,
	emp_name VARCHAR(20) NOT NULL,
	dept VARCHAR(128) NOT NULL,
	boss VARCHAR(20)
	);

	
CREATE TABLE IF NOT EXISTS boss (
	boss_person_id INTEGER PRIMARY KEY,
	emp_id INTEGER not null REFERENCES employee(emp_id)
	);

-- правка таблицы Employee
ALTER TABLE employee ALTER COLUMN boss TYPE integer; -- заметил ошибку, приводим к integer