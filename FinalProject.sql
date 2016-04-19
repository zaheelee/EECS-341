--Build the tables
CREATE TABLE Team(name VARCHAR(24) NOT NULL,
					city VARCHAR(24),
					universe VARCHAR(24),
			PRIMARY KEY(name));

CREATE TABLE Power(name VARCHAR(24) NOT NULL,
					origin VARCHAR(24),
			PRIMARY KEY(name));

CREATE TABLE Superhero(name VARCHAR(24) NOT NULL,
						secret_identity VARCHAR(24),
						universe VARCHAR(24),
						city VARCHAR(24),
						sidekick VARCHAR(24),
						team_name VARCHAR(24),
						origin_year INTEGER,
						weakness VARCHAR(24),
						isAlive BOOLEAN,
						isEvil BOOLEAN,
				PRIMARY KEY(name),
				FOREIGN KEY(sidekick) REFERENCES Superhero(name),
				FOREIGN KEY(team_name) REFERENCES Team(name));
				
CREATE TABLE HasPower(power_name VARCHAR(24) NOT NULL,
						name VARCHAR(24) NOT NULL,
				FOREIGN KEY(name) REFERENCES Superhero(name),
				FOREIGN KEY(power_name) REFERENCES Power(name));
				
CREATE TABLE Archenemies(hero_name VARCHAR(24),
							villain_name VARCHAR(24) NOT NULL,
					FOREIGN KEY(hero_name) REFERENCES Superhero(name),
					FOREIGN KEY(villain_name) REFERENCES Superhero(name));
				
--Populate the tables
INSERT INTO Team
	VALUES('Justice League', NULL, 'DC');

INSERT INTO Team
	VALUES('Avengers', NULL, 'Marvel');
	
INSERT INTO Team
	VALUES('Teen Titans', 'New York City', 'DC');
	
INSERT INTO Team
	Values('Young Avengers', 'New York City', 'Marvel');
	
INSERT INTO Team
	Values('Fantastic Four', 'New York City', 'Marvel');
	
INSERT INTO Team
	Values('Suicide Squad', NULL, 'DC');

SELECT *
FROM Team;


INSERT INTO Superhero
	VALUES('Superman', 'Clark Kent', 'DC', 'Metropolis', NULL, 'Justice League', 1938, 'Kryptonite', TRUE, FALSE);
	
INSERT INTO Superhero
	VALUES('Robin', 'Dick Grayson', 'DC', 'Gotham City', NULL, 'Teen Titans', 1940, 'Everything', TRUE, FALSE);
	
INSERT INTO Superhero
	VALUES('Batman', 'Bruce Wayne', 'DC', 'Gotham City', 'Robin', 'Justice League', 1938, 'Everything', TRUE, FALSE);
	
INSERT INTO Superhero
	VALUES('Iron Man', 'Tony Stark', 'Marvel', NULL, NULL, 'Avengers', 1963, 'Dead Batteries', TRUE, FALSE);
	
INSERT INTO Superhero
	VALUES('Harley Quinn', 'Harleen Quinzel', 'DC', 'Gotham City', NULL, 'Suicide Squad', 1993, 'Everything', TRUE, TRUE);
	
INSERT INTO Superhero
	VALUES('Joker', 'Unknown', 'DC', 'Gotham City', 'Harley Quinn', NULL, 1940, 'Everything', TRUE, TRUE);
	
INSERT INTO Superhero
	VALUES('Wiccan', 'Billy Kaplan', 'Marvel', 'New York City', NULL, 'Young Avengers', 2005, 'Overuse of Magic', TRUE, FALSE);
	
INSERT INTO Superhero
	VALUES('Hulkling', 'Teddy Altman', 'Marvel', 'New York City', NULL, 'Young Avengers', 2005, 'Fire', TRUE, FALSE);

INSERT INTO Superhero
	VALUES('Doomsday', NULL, 'DC', 'Metropolis', NULL, NULL, 1992, 'Kryptonite', FALSE, TRUE);
	
INSERT INTO Superhero
	VALUES('Lex Luthor', 'Lex Luthor', 'DC', 'Metropolis', NULL, NULL, 1940, 'Everything', TRUE, TRUE);
	
INSERT INTO Superhero
	VALUES('Poison Ivy', 'Dr. Pamela Isley', 'DC', 'Gotham City', NULL, NULL, 1966, 'Fire', TRUE, TRUE);
	
SELECT *
FROM Superhero;


INSERT INTO Power
	VALUES('Money', 'Rich Parents');
	
INSERT INTO Power
	VALUES('Flight', 'Genetics');
	
INSERT INTO Power
	VALUES('Heat Vision', 'Genetics');
	
INSERT INTO Power
	VALUES('Insanity', 'Vat of Acid');
	
INSERT INTO Power
	VALUES('Super Strength', 'Genetics');
	
INSERT INTO Power
	VALUES('Magic', 'Genetics');
	
SELECT *
FROM Power;


INSERT INTO HasPower
	VALUES('Money', 'Batman');
	
INSERT INTO HasPower
	VALUES('Flight', 'Superman');
	
INSERT INTO HasPower
	VALUES('Heat Vision', 'Superman');
	
INSERT INTO HasPower
	VALUES('Money', 'Iron Man');
	
INSERT INTO HasPower
	VALUES('Insanity', 'Joker');
	
INSERT INTO HasPower
	VALUES('Insanity', 'Harley Quinn');
	
INSERT INTO HasPower
	VALUES('Super Strength', 'Superman');
	
INSERT INTO HasPower
	VALUES('Super Strength', 'Doomsday');
	
INSERT INTO HasPower
	VALUES('Super Strength', 'Hulkling');
	
INSERT INTO HasPower
	VALUES('Magic', 'Wiccan');
	
SELECT *
FROM HasPower;
	
	
INSERT INTO Archenemies
	VALUES('Batman', 'Joker');
	
INSERT INTO Archenemies
	VALUES('Batman', 'Harley Quinn');
	
INSERT INTO Archenemies
	VALUES('Batman', 'Poison Ivy');
	
INSERT INTO Archenemies
	VALUES('Robin', 'Joker');
	
INSERT INTO Archenemies
	VALUES('Robin', 'Harley Quinn');
	
INSERT INTO Archenemies
	VALUES('Robin', 'Poison Ivy');
	
INSERT INTO Archenemies
	VALUES('Superman', 'Doomsday');
	
INSERT INTO Archenemies
	VALUES('Superman', 'Lex Luthor');
	
SELECT *
FROM Archenemies;

--Queries

--Find the names of all of the Superheroes
SELECT name
FROM Superhero
WHERE isEvil = FALSE;

--Find the names of all of the Super Villains
SELECT name
FROM Superhero
WHERE isEvil = TRUE;
