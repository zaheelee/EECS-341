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
				PRIMARY KEY(power_name),
				FOREIGN KEY(name) REFERENCES Superhero(name),
				FOREIGN KEY(power_name) REFERENCES Power(name));
				
CREATE TABLE Archenemies(hero_name VARCHAR(24) NOT NULL,
							villain_name VARCHAR(24) NOT NULL,
					PRIMARY KEY(hero_name),
					FOREIGN KEY(hero_name) REFERENCES Superhero(name),
					FOREIGN KEY(villain_name) REFERENCES Superhero(name));
				

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

SELECT *
FROM Team;


INSERT INTO Superhero
	VALUES('Superman', 'Clark Kent', 'DC', 'Metropolis', NULL, 'Justice League', 1938, 'Kryptonite', TRUE, FALSE);
	
INSERT INTO Superhero
	VALUES('Robin', 'Dick Grayson', 'DC', 'Gotham City', NULL, 'Teen Titans', 1940, 'Everything', TRUE, FALSE);
	
INSERT INTO Superhero
	VALUES('Batman', 'Bruce Wayne', 'DC', 'Gotham City', 'Robin', 'Justice League', 1938, 'Everything', TRUE, FALSE);
	
SELECT *
FROM Superhero;

