-- =====================================================
-- Script SQL para MovieDB
-- =====================================================

-- Criar banco de dados com encoding UTF-8
CREATE DATABASE IF NOT EXISTS MovieDB 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE MovieDB;

-- =====================================================
-- CRIAÇÃO DE TABELAS
-- =====================================================

-- Tabela de Diretores
CREATE TABLE directors (
    director_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birthdate DATE,
    nationality VARCHAR(100)
) ENGINE=InnoDB;

-- Tabela de Atores
CREATE TABLE actors (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birthdate DATE,
    nationality VARCHAR(100),
    photo LONGBLOB
) ENGINE=InnoDB;

-- Tabela de Filmes
CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year YEAR,
    genre VARCHAR(100),
    director_id INT,
    FOREIGN KEY (director_id) REFERENCES directors(director_id) 
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Tabela de Relacionamento Filme-Ator
CREATE TABLE movie_actors (
    movie_id INT,
    actor_id INT,
    role VARCHAR(255),
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- =====================================================
-- INSERÇÃO DE DIRETORES
-- =====================================================

INSERT INTO directors (name, birthdate, nationality) VALUES 
('Christopher Nolan', NULL, NULL),
('Anthony Russo', NULL, NULL),
('Pete Docter', NULL, NULL),
('David Yates', NULL, NULL),
('Ryan Coogler', NULL, NULL),
('Taika Waititi', NULL, NULL),
('Cary Joji Fukunaga', NULL, NULL),
('Todd Phillips', NULL, NULL),
('Bennett Miller', NULL, NULL),
('David Fincher', NULL, NULL),
('Ethan Coen', NULL, NULL),
('Andrew Stanton', NULL, NULL),
('Colin Trevorrow', NULL, NULL),
('Gary Ross', NULL, NULL),
('Bob Persichetti', NULL, NULL),
('Gareth Edwards', NULL, NULL),
('Quentin Tarantino', NULL, NULL),
('Robert Zemeckis', NULL, NULL),
('Lana Wachowski', NULL, NULL),
('Martin Scorsese', NULL, NULL),
('Fernando Meirelles', NULL, NULL),
('Steven Spielberg', NULL, NULL),
('Alfonso Cuarón', NULL, NULL),
('Peter Jackson', NULL, NULL),
('Olivier Nakache', NULL, NULL),
('Zack Snyder', NULL, NULL),
('Roger Allers', NULL, NULL),
('Mel Gibson', NULL, NULL),
('James Cameron', NULL, NULL),
('Frank Darabont', NULL, NULL),
('Bryan Singer', NULL, NULL),
('Damien Chazelle', NULL, NULL),
('Gus Van Sant', NULL, NULL),
('Tony Kaye', NULL, NULL),
('Jonathan Demme', NULL, NULL),
('George Miller', NULL, NULL),
('Andy Muschietti', NULL, NULL),
('Brian De Palma', NULL, NULL),
('John McTiernan', NULL, NULL),
('Sam Raimi', NULL, NULL),
('Guy Ritchie', NULL, NULL),
('Curtis Hanson', NULL, NULL),
('Hayao Miyazaki', NULL, NULL),
('Francis Ford Coppola', NULL, NULL),
('Luc Besson', NULL, NULL),
('Paul Weiland', NULL, NULL),
('Said Manafi', NULL, NULL),
('Brian Thomas Jones', NULL, NULL),
('Aziz Sejawal', NULL, NULL);

-- =====================================================
-- INSERÇÃO DE ATORES
-- =====================================================

INSERT INTO actors (name, birthdate, nationality, photo) VALUES 
('Leonardo DiCaprio', NULL, NULL, NULL),
('Joseph Gordon-Levitt', NULL, NULL, NULL),
('Elliot Page', NULL, NULL, NULL),
('Tom Hardy', NULL, NULL, NULL),
('Ken Watanabe', NULL, NULL, NULL),
('Robert Downey Jr.', NULL, NULL, NULL),
('Chris Evans', NULL, NULL, NULL),
('Mark Ruffalo', NULL, NULL, NULL),
('Chris Hemsworth', NULL, NULL, NULL),
('Scarlett Johansson', NULL, NULL, NULL),
('Edward Asner', NULL, NULL, NULL),
('Christopher Plummer', NULL, NULL, NULL),
('Jordan Nagai', NULL, NULL, NULL),
('Bob Peterson', NULL, NULL, NULL),
('Delroy Lindo', NULL, NULL, NULL),
('Ralph Fiennes', NULL, NULL, NULL),
('Michael Gambon', NULL, NULL, NULL),
('Alan Rickman', NULL, NULL, NULL),
('Daniel Radcliffe', NULL, NULL, NULL),
('Rupert Grint', NULL, NULL, NULL),
('Chadwick Boseman', NULL, NULL, NULL),
('Michael B. Jordan', NULL, NULL, NULL),
('Lupita Nyongo', NULL, NULL, NULL),
('Danai Gurira', NULL, NULL, NULL),
('Martin Freeman', NULL, NULL, NULL),
('Christian Bale', NULL, NULL, NULL),
('Gary Oldman', NULL, NULL, NULL),
('Anne Hathaway', NULL, NULL, NULL),
('Amy Poehler', NULL, NULL, NULL),
('Phyllis Smith', NULL, NULL, NULL),
('Richard Kind', NULL, NULL, NULL),
('Bill Hader', NULL, NULL, NULL),
('Lewis Black', NULL, NULL, NULL),
('Tom Hiddleston', NULL, NULL, NULL),
('Cate Blanchett', NULL, NULL, NULL),
('Idris Elba', NULL, NULL, NULL),
('Jeff Goldblum', NULL, NULL, NULL),
('Daniel Craig', NULL, NULL, NULL),
('Léa Seydoux', NULL, NULL, NULL),
('Rami Malek', NULL, NULL, NULL),
('Lashana Lynch', NULL, NULL, NULL),
('Joaquin Phoenix', NULL, NULL, NULL),
('Robert De Niro', NULL, NULL, NULL),
('Zazie Beetz', NULL, NULL, NULL),
('Frances Conroy', NULL, NULL, NULL),
('Brett Cullen', NULL, NULL, NULL),
('Ellen Burstyn', NULL, NULL, NULL),
('Matthew McConaughey', NULL, NULL, NULL),
('Mackenzie Foy', NULL, NULL, NULL),
('John Lithgow', NULL, NULL, NULL),
('Timothée Chalamet', NULL, NULL, NULL),
('Steve Carell', NULL, NULL, NULL),
('Channing Tatum', NULL, NULL, NULL),
('Sienna Miller', NULL, NULL, NULL),
('Vanessa Redgrave', NULL, NULL, NULL),
('Ben Affleck', NULL, NULL, NULL),
('Rosamund Pike', NULL, NULL, NULL),
('Neil Patrick Harris', NULL, NULL, NULL),
('Tyler Perry', NULL, NULL, NULL),
('Carrie Coon', NULL, NULL, NULL),
('Tommy Lee Jones', NULL, NULL, NULL),
('Javier Bardem', NULL, NULL, NULL),
('Josh Brolin', NULL, NULL, NULL),
('Woody Harrelson', NULL, NULL, NULL),
('Kelly Macdonald', NULL, NULL, NULL),
('Ben Burtt', NULL, NULL, NULL),
('Elissa Knight', NULL, NULL, NULL),
('Jeff Garlin', NULL, NULL, NULL),
('Fred Willard', NULL, NULL, NULL),
('MacInTalk', NULL, NULL, NULL),
('Chris Pratt', NULL, NULL, NULL),
('Bryce Dallas Howard', NULL, NULL, NULL),
('Irrfan Khan', NULL, NULL, NULL),
('Vincent DOnofrio', NULL, NULL, NULL),
('Ty Simpkins', NULL, NULL, NULL),
('Stanley Tucci', NULL, NULL, NULL),
('Wes Bentley', NULL, NULL, NULL),
('Jennifer Lawrence', NULL, NULL, NULL),
('Willow Shields', NULL, NULL, NULL),
('Liam Hemsworth', NULL, NULL, NULL),
('Shameik Moore', NULL, NULL, NULL),
('Jake Johnson', NULL, NULL, NULL),
('Hailee Steinfeld', NULL, NULL, NULL),
('Mahershala Ali', NULL, NULL, NULL),
('Brian Tyree Henry', NULL, NULL, NULL),
('Felicity Jones', NULL, NULL, NULL),
('Diego Luna', NULL, NULL, NULL),
('Alan Tudyk', NULL, NULL, NULL),
('Donnie Yen', NULL, NULL, NULL),
('Wen Jiang', NULL, NULL, NULL),
('Brad Pitt', NULL, NULL, NULL),
('Mélanie Laurent', NULL, NULL, NULL),
('Christoph Waltz', NULL, NULL, NULL),
('Eli Roth', NULL, NULL, NULL),
('Michael Fassbender', NULL, NULL, NULL),
('Tim Roth', NULL, NULL, NULL),
('Amanda Plummer', NULL, NULL, NULL),
('Laura Lovelace', NULL, NULL, NULL),
('John Travolta', NULL, NULL, NULL),
('Samuel L. Jackson', NULL, NULL, NULL),
('Tom Hanks', NULL, NULL, NULL),
('Rebecca Williams', NULL, NULL, NULL),
('Sally Field', NULL, NULL, NULL),
('Michael Conner Humphreys', NULL, NULL, NULL),
('Harold G. Herthum', NULL, NULL, NULL),
('Keanu Reeves', NULL, NULL, NULL),
('Laurence Fishburne', NULL, NULL, NULL),
('Carrie-Anne Moss', NULL, NULL, NULL),
('Hugo Weaving', NULL, NULL, NULL),
('Gloria Foster', NULL, NULL, NULL),
('Morgan Freeman', NULL, NULL, NULL),
('Andrew Kevin Walker', NULL, NULL, NULL),
('Daniel Zacapa', NULL, NULL, NULL),
('Gwyneth Paltrow', NULL, NULL, NULL),
('Ray Liotta', NULL, NULL, NULL),
('Joe Pesci', NULL, NULL, NULL),
('Lorraine Bracco', NULL, NULL, NULL),
('Paul Sorvino', NULL, NULL, NULL),
('Alexandre Rodrigues', NULL, NULL, NULL),
('Leandro Firmino', NULL, NULL, NULL),
('Phellipe Haagensen', NULL, NULL, NULL),
('Douglas Silva', NULL, NULL, NULL),
('Jonathan Haagensen', NULL, NULL, NULL),
('Sam Neill', NULL, NULL, NULL),
('Laura Dern', NULL, NULL, NULL),
('Richard Attenborough', NULL, NULL, NULL),
('Bob Peck', NULL, NULL, NULL),
('Sandra Bullock', NULL, NULL, NULL),
('George Clooney', NULL, NULL, NULL),
('Ed Harris', NULL, NULL, NULL),
('Orto Ignatiussen', NULL, NULL, NULL),
('Phaldut Sharma', NULL, NULL, NULL),
('Uma Thurman', NULL, NULL, NULL),
('Lucy Liu', NULL, NULL, NULL),
('Vivica A. Fox', NULL, NULL, NULL),
('Daryl Hannah', NULL, NULL, NULL),
('David Carradine', NULL, NULL, NULL),
('Alan Howard', NULL, NULL, NULL),
('Noel Appleby', NULL, NULL, NULL),
('Sean Astin', NULL, NULL, NULL),
('Sala Baker', NULL, NULL, NULL),
('Sean Bean', NULL, NULL, NULL),
('François Cluzet', NULL, NULL, NULL),
('Omar Sy', NULL, NULL, NULL),
('Anne Le Ny', NULL, NULL, NULL),
('Audrey Fleurot', NULL, NULL, NULL),
('Joséphine de Meaux', NULL, NULL, NULL),
('Guy Pearce', NULL, NULL, NULL),
('Joe Pantoliano', NULL, NULL, NULL),
('Mark Boone Junior', NULL, NULL, NULL),
('Russ Fega', NULL, NULL, NULL),
('Ben Kingsley', NULL, NULL, NULL),
('Max von Sydow', NULL, NULL, NULL),
('Michelle Williams', NULL, NULL, NULL),
('Henry Cavill', NULL, NULL, NULL),
('Amy Adams', NULL, NULL, NULL),
('Michael Shannon', NULL, NULL, NULL),
('Diane Lane', NULL, NULL, NULL),
('Russell Crowe', NULL, NULL, NULL),
('Rowan Atkinson', NULL, NULL, NULL),
('Matthew Broderick', NULL, NULL, NULL),
('Niketa Calame-Harris', NULL, NULL, NULL),
('Jim Cummings', NULL, NULL, NULL),
('Whoopi Goldberg', NULL, NULL, NULL),
('Edward Norton', NULL, NULL, NULL),
('Meat Loaf', NULL, NULL, NULL),
('Zach Grenier', NULL, NULL, NULL),
('Richmond Arquette', NULL, NULL, NULL),
('Tom Sizemore', NULL, NULL, NULL),
('Edward Burns', NULL, NULL, NULL),
('Barry Pepper', NULL, NULL, NULL),
('Adam Goldberg', NULL, NULL, NULL),
('James Robinson', NULL, NULL, NULL),
('Sean Lawlor', NULL, NULL, NULL),
('Sandy Nelson', NULL, NULL, NULL),
('James Cosmo', NULL, NULL, NULL),
('Sean McGinley', NULL, NULL, NULL),
('Sam Worthington', NULL, NULL, NULL),
('Zoe Saldana', NULL, NULL, NULL),
('Sigourney Weaver', NULL, NULL, NULL),
('Stephen Lang', NULL, NULL, NULL),
('Michelle Rodriguez', NULL, NULL, NULL),
('David Morse', NULL, NULL, NULL),
('Bonnie Hunt', NULL, NULL, NULL),
('Michael Clarke Duncan', NULL, NULL, NULL),
('James Cromwell', NULL, NULL, NULL),
('Stephen Baldwin', NULL, NULL, NULL),
('Gabriel Byrne', NULL, NULL, NULL),
('Benicio Del Toro', NULL, NULL, NULL),
('Kevin Pollak', NULL, NULL, NULL),
('Kevin Spacey', NULL, NULL, NULL),
('Michael Caine', NULL, NULL, NULL),
('Liam Neeson', NULL, NULL, NULL),
('Katie Holmes', NULL, NULL, NULL),
('Miles Teller', NULL, NULL, NULL),
('J.K. Simmons', NULL, NULL, NULL),
('Paul Reiser', NULL, NULL, NULL),
('Melissa Benoist', NULL, NULL, NULL),
('Austin Stowell', NULL, NULL, NULL),
('Matt Damon', NULL, NULL, NULL),
('Stellan Skarsgård', NULL, NULL, NULL),
('John Mighton', NULL, NULL, NULL),
('Rachel Majorowski', NULL, NULL, NULL),
('Edward Furlong', NULL, NULL, NULL),
('Beverly DAngelo', NULL, NULL, NULL),
('Jennifer Lien', NULL, NULL, NULL),
('Ethan Suplee', NULL, NULL, NULL),
('Jodie Foster', NULL, NULL, NULL),
('Anthony Hopkins', NULL, NULL, NULL),
('Scott Glenn', NULL, NULL, NULL),
('Ted Levine', NULL, NULL, NULL),
('Anthony Heald', NULL, NULL, NULL),
('Charlize Theron', NULL, NULL, NULL),
('Nicholas Hoult', NULL, NULL, NULL),
('Hugh Keays-Byrne', NULL, NULL, NULL),
('Josh Helman', NULL, NULL, NULL),
('Jaeden Martell', NULL, NULL, NULL),
('Jeremy Ray Taylor', NULL, NULL, NULL),
('Sophia Lillis', NULL, NULL, NULL),
('Finn Wolfhard', NULL, NULL, NULL),
('Chosen Jacobs', NULL, NULL, NULL),
('Tom Cruise', NULL, NULL, NULL),
('Jon Voight', NULL, NULL, NULL),
('Emmanuelle Béart', NULL, NULL, NULL),
('Henry Czerny', NULL, NULL, NULL),
('Jean Reno', NULL, NULL, NULL),
('Michael J. Fox', NULL, NULL, NULL),
('Christopher Lloyd', NULL, NULL, NULL),
('Lea Thompson', NULL, NULL, NULL),
('Crispin Glover', NULL, NULL, NULL),
('Tom Wilson', NULL, NULL, NULL),
('Bruce Willis', NULL, NULL, NULL),
('Bonnie Bedelia', NULL, NULL, NULL),
('Reginald VelJohnson', NULL, NULL, NULL),
('Paul Gleason', NULL, NULL, NULL),
('Devoreaux White', NULL, NULL, NULL),
('Harrison Ford', NULL, NULL, NULL),
('Karen Allen', NULL, NULL, NULL),
('Paul Freeman', NULL, NULL, NULL),
('Ronald Lacey', NULL, NULL, NULL),
('John Rhys-Davies', NULL, NULL, NULL),
('Tobey Maguire', NULL, NULL, NULL),
('Willem Dafoe', NULL, NULL, NULL),
('Kirsten Dunst', NULL, NULL, NULL),
('James Franco', NULL, NULL, NULL),
('Cliff Robertson', NULL, NULL, NULL),
('Jason Flemyng', NULL, NULL, NULL),
('Dexter Fletcher', NULL, NULL, NULL),
('Nick Moran', NULL, NULL, NULL),
('Jason Statham', NULL, NULL, NULL),
('Steven Mackintosh', NULL, NULL, NULL),
('Kim Basinger', NULL, NULL, NULL),
('Noriko Hidaka', NULL, NULL, NULL),
('Chika Sakamoto', NULL, NULL, NULL),
('Shigesato Itoi', NULL, NULL, NULL),
('Sumi Shimamoto', NULL, NULL, NULL),
('Tanie Kitabayashi', NULL, NULL, NULL),
('Tim Robbins', NULL, NULL, NULL),
('Bob Gunton', NULL, NULL, NULL),
('William Sadler', NULL, NULL, NULL),
('Clancy Brown', NULL, NULL, NULL),
('Marlon Brando', NULL, NULL, NULL),
('Al Pacino', NULL, NULL, NULL),
('James Caan', NULL, NULL, NULL),
('Richard S. Castellano', NULL, NULL, NULL),
('Robert Duvall', NULL, NULL, NULL),
('Natalie Portman', NULL, NULL, NULL),
('Danny Aiello', NULL, NULL, NULL),
('Peter Appel', NULL, NULL, NULL),
('Diane Keaton', NULL, NULL, NULL),
('John Cazale', NULL, NULL, NULL),
('David Coburn', NULL, NULL, NULL),
('LeVar Burton', NULL, NULL, NULL),
('Joey Dedio', NULL, NULL, NULL),
('Janice Kawaye', NULL, NULL, NULL),
('Scott Menville', NULL, NULL, NULL),
('Michael Maloney', NULL, NULL, NULL),
('Juliet Stevenson', NULL, NULL, NULL),
('Gregory Chisholm', NULL, NULL, NULL),
('Brian Henson', NULL, NULL, NULL),
('Sue Dacre', NULL, NULL, NULL),
('Rick Gianasi', NULL, NULL, NULL),
('John Wittenbauer', NULL, NULL, NULL),
('Roy MacArthur', NULL, NULL, NULL),
('Mollie OMara', NULL, NULL, NULL),
('William Beckwith', NULL, NULL, NULL),
('Sanjay Dutt', NULL, NULL, NULL),
('Govinda', NULL, NULL, NULL),
('Somy Ali', NULL, NULL, NULL),
('Mamta Kulkarni', NULL, NULL, NULL),
('Vikram Gokhale', NULL, NULL, NULL);

-- =====================================================
-- INSERÇÃO DE FILMES (SEM DUPLICATAS)
-- =====================================================

INSERT INTO movies (title, release_year, genre, director_id) VALUES 
('Inception', 2010, 'Action', 1),
('Avengers: Endgame', 2019, 'Action', 2),
('Up', 2009, 'Animation', 3),
('Harry Potter and the Deathly Hallows: Part 2', 2011, 'Adventure', 4),
('Black Panther', 2018, 'Action', 5),
('The Dark Knight Rises', 2012, 'Action', 1),
('Inside Out', 2015, 'Animation', 3),
('Thor: Ragnarok', 2017, 'Action', 6),
('No Time to Die', 2021, 'Action', 7),
('Joker', 2019, 'Crime', 8),
('Interstellar', 2014, 'Adventure', 1),
('Foxcatcher', 2014, 'Biography', 9),
('Gone Girl', 2014, 'Drama', 10),
('No Country for Old Men', 2007, 'Crime', 11),
('WALL-E', 2008, 'Animation', 12),
('Jurassic World', 2015, 'Action', 13),
('The Hunger Games', 2012, 'Action', 14),
('Spider-Man: Into the Spider-Verse', 2018, 'Animation', 15),
('Rogue One: A Star Wars Story', 2016, 'Action', 16),
('Inglourious Basterds', 2009, 'Adventure', 17),
('Pulp Fiction', 1994, 'Crime', 17),
('Forrest Gump', 1994, 'Drama', 18),
('The Matrix', 1999, 'Action', 19),
('Seven', 1995, 'Crime', 10),
('Goodfellas', 1990, 'Biography', 20),
('City of God', 2002, 'Crime', 21),
('Jurassic Park', 1993, 'Action', 22),
('Gravity', 2013, 'Drama', 23),
('Kill Bill: Vol. 1', 2003, 'Action', 17),
('The Lord of the Rings: The Fellowship of the Ring', 2001, 'Action', 24),
('The Intouchables', 2011, 'Comedy', 25),
('Memento', 2000, 'Mystery', 1),
('Shutter Island', 2010, 'Drama', 20),
('Man of Steel', 2013, 'Action', 26),
('The Lion King', 1994, 'Animation', 27),
('Fight Club', 1999, 'Drama', 10),
('Saving Private Ryan', 1998, 'Drama', 22),
('Braveheart', 1995, 'Biography', 28),
('Avatar', 2009, 'Action', 29),
('The Green Mile', 1999, 'Crime', 30),
('The Usual Suspects', 1995, 'Crime', 31),
('Batman Begins', 2005, 'Action', 1),
('Whiplash', 2014, 'Drama', 32),
('Good Will Hunting', 1997, 'Drama', 33),
('American History X', 1998, 'Crime', 34),
('The Silence of the Lambs', 1991, 'Crime', 35),
('Mad Max: Fury Road', 2015, 'Action', 36),
('It', 2017, 'Horror', 37),
('Mission: Impossible', 1996, 'Action', 38),
('Back to the Future', 1985, 'Adventure', 18),
('Die Hard', 1988, 'Action', 39),
('Raiders of the Lost Ark', 1981, 'Action', 22),
('Spider-Man', 2002, 'Action', 40),
('Lock, Stock and Two Smoking Barrels', 1998, 'Action', 41),
('L.A. Confidential', 1997, 'Crime', 42),
('My Neighbor Totoro', 1988, 'Animation', 43),
('The Shawshank Redemption', 1994, 'Drama', 30),
('The Godfather', 1972, 'Crime', 44),
('Léon: The Professional', 1994, 'Action', 45),
('The Godfather Part II', 1974, 'Crime', 44),
('Captain Planet and the Planeteers', 1990, 'Animation', NULL),
('Living with Dinosaurs', 1989, 'Comedy', 46),
('Aufbruch ins Leid - März 1938', 1988, 'Unknown', 47),
('Escape from Safehaven', 1988, 'Sci-Fi', 48),
('Andolan', 1995, 'Action', 49);

-- =====================================================
-- INSERÇÃO DE RELAÇÕES FILME-ATOR
-- =====================================================

-- Inception (movie_id = 1)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(1, 1, 'Cobb'),
(1, 2, 'Arthur'),
(1, 3, 'Ariadne'),
(1, 4, 'Eames'),
(1, 5, 'Saito');

-- Avengers: Endgame (movie_id = 2)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(2, 6, 'Tony Stark / Iron Man'),
(2, 7, 'Steve Rogers / Captain America'),
(2, 8, 'Bruce Banner / Hulk'),
(2, 9, 'Thor'),
(2, 10, 'Natasha Romanoff / Black Widow');

-- Up (movie_id = 3)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(3, 11, 'Carl Fredricksen'),
(3, 12, 'Charles Muntz'),
(3, 13, 'Russell'),
(3, 14, 'Dug / Alpha'),
(3, 15, 'Beta');

-- Harry Potter and the Deathly Hallows: Part 2 (movie_id = 4)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(4, 16, 'Lord Voldemort'),
(4, 17, 'Professor Albus Dumbledore'),
(4, 18, 'Professor Severus Snape'),
(4, 19, 'Harry Potter'),
(4, 20, 'Ron Weasley');

-- Black Panther (movie_id = 5)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(5, 21, 'TChalla / Black Panther'),
(5, 22, 'Erik Killmonger'),
(5, 23, 'Nakia'),
(5, 24, 'Okoye'),
(5, 25, 'Everett K. Ross');

-- The Dark Knight Rises (movie_id = 6)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(6, 26, 'Bruce Wayne / Batman'),
(6, 27, 'Commissioner Gordon'),
(6, 4, 'Bane'),
(6, 2, 'Blake'),
(6, 28, 'Selina');

-- Inside Out (movie_id = 7)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(7, 29, 'Joy'),
(7, 30, 'Sadness'),
(7, 31, 'Bing Bong'),
(7, 32, 'Fear'),
(7, 33, 'Anger');

-- Thor: Ragnarok (movie_id = 8)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(8, 9, 'Thor'),
(8, 34, 'Loki'),
(8, 35, 'Hela'),
(8, 36, 'Heimdall'),
(8, 37, 'Grandmaster');

-- No Time to Die (movie_id = 9)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(9, 38, 'James Bond'),
(9, 39, 'Madeleine'),
(9, 40, 'Lyutsifer Safin'),
(9, 41, 'Nomi'),
(9, 16, 'M');

-- Joker (movie_id = 10)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(10, 42, 'Arthur Fleck'),
(10, 43, 'Murray Franklin'),
(10, 44, 'Sophie Dumond'),
(10, 45, 'Penny Fleck'),
(10, 46, 'Thomas Wayne');

-- Interstellar (movie_id = 11)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(11, 47, 'Murph'),
(11, 48, 'Cooper'),
(11, 49, 'Murph'),
(11, 50, 'Donald'),
(11, 51, 'Tom');

-- Foxcatcher (movie_id = 12)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(12, 52, 'John du Pont'),
(12, 53, 'Mark Schultz'),
(12, 8, 'David Schultz'),
(12, 54, 'Nancy Schultz'),
(12, 55, 'Jean du Pont');

-- Gone Girl (movie_id = 13)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(13, 56, 'Nick Dunne'),
(13, 57, 'Amy Dunne'),
(13, 58, 'Desi Collings'),
(13, 59, 'Tanner Bolt'),
(13, 60, 'Margo Dunne');

-- No Country for Old Men (movie_id = 14)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(14, 61, 'Ed Tom Bell'),
(14, 62, 'Anton Chigurh'),
(14, 63, 'Llewelyn Moss'),
(14, 64, 'Carson Wells'),
(14, 65, 'Carla Jean Moss');

-- WALL-E (movie_id = 15)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(15, 66, 'WALL-E / M-O'),
(15, 67, 'EVE'),
(15, 68, 'Captain'),
(15, 69, 'Shelby Forthright - BNL CEO'),
(15, 70, 'AUTO');

-- Jurassic World (movie_id = 16)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(16, 71, 'Owen Grady'),
(16, 72, 'Claire Dearing'),
(16, 73, 'Masrani'),
(16, 74, 'Vic Hoskins'),
(16, 75, 'Gray');

-- The Hunger Games (movie_id = 17)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(17, 76, 'Caesar Flickerman'),
(17, 77, 'Seneca Crane'),
(17, 78, 'Katniss Everdeen'),
(17, 79, 'Primrose Everdeen'),
(17, 80, 'Gale Hawthorne');

-- Spider-Man: Into the Spider-Verse (movie_id = 18)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(18, 81, 'Miles Morales'),
(18, 82, 'Peter B. Parker'),
(18, 83, 'Gwen Stacy'),
(18, 84, 'Uncle Aaron'),
(18, 85, 'Jefferson Davis');

-- Rogue One: A Star Wars Story (movie_id = 19)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(19, 86, 'Jyn Erso'),
(19, 87, 'Cassian Andor'),
(19, 88, 'K-2SO'),
(19, 89, 'Chirrut Îmwe'),
(19, 90, 'Baze Malbus');

-- Inglourious Basterds (movie_id = 20)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(20, 91, 'Lt. Aldo Raine'),
(20, 92, 'Shosanna'),
(20, 93, 'Col. Hans Landa'),
(20, 94, 'Sgt. Donny Donowitz'),
(20, 95, 'Lt. Archie Hicox');

-- Pulp Fiction (movie_id = 21)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(21, 96, 'Pumpkin'),
(21, 97, 'Honey Bunny'),
(21, 98, 'Waitress'),
(21, 99, 'Vincent Vega'),
(21, 100, 'Jules Winnfield');

-- Forrest Gump (movie_id = 22)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(22, 101, 'Forrest Gump'),
(22, 102, 'Nurse at Park Bench'),
(22, 103, 'Mrs. Gump'),
(22, 104, 'Young Forrest'),
(22, 105, 'Doctor');

-- The Matrix (movie_id = 23)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(23, 106, 'Neo'),
(23, 107, 'Morpheus'),
(23, 108, 'Trinity'),
(23, 109, 'Agent Smith'),
(23, 110, 'Oracle');

-- Seven (movie_id = 24)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(24, 111, 'Somerset'),
(24, 112, 'Dead Man at 1st Crime Scene'),
(24, 113, 'Detective Taylor at First Murder'),
(24, 91, 'Mills'),
(24, 114, 'Tracy');

-- Goodfellas (movie_id = 25)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(25, 43, 'James Conway'),
(25, 115, 'Henry Hill'),
(25, 116, 'Tommy DeVito'),
(25, 117, 'Karen Hill'),
(25, 118, 'Paul Cicero');

-- City of God (movie_id = 26)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(26, 119, 'Buscapé - Rocket'),
(26, 120, 'Zé Pequeno - Lil Zé'),
(26, 121, 'Bené - Benny'),
(26, 122, 'Dadinho - Lil Dice'),
(26, 123, 'Cabeleira - Shaggy');

-- Jurassic Park (movie_id = 27)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(27, 124, 'Grant'),
(27, 125, 'Ellie'),
(27, 37, 'Malcolm'),
(27, 126, 'Hammond'),
(27, 127, 'Muldoon');

-- Gravity (movie_id = 28)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(28, 128, 'Ryan Stone'),
(28, 129, 'Matt Kowalski'),
(28, 130, 'Mission Control'),
(28, 131, 'Aningaaq'),
(28, 132, 'Shariff');

-- Kill Bill: Vol. 1 (movie_id = 29)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(29, 133, 'The Bride'),
(29, 134, 'O-Ren Ishii'),
(29, 135, 'Vernita Green'),
(29, 136, 'Elle Driver'),
(29, 137, 'Bill');

-- The Lord of the Rings: The Fellowship of the Ring (movie_id = 30)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(30, 138, 'Voice of the Ring'),
(30, 139, 'Everard Proudfoot'),
(30, 140, 'Sam'),
(30, 141, 'Sauron / Goblin / Uruk-hai'),
(30, 142, 'Boromir');

-- The Intouchables (movie_id = 31)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(31, 143, 'Philippe'),
(31, 144, 'Driss'),
(31, 145, 'Yvonne'),
(31, 146, 'Magalie'),
(31, 147, 'La DRH société de courses');

-- Memento (movie_id = 32)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(32, 148, 'Leonard'),
(32, 108, 'Natalie'),
(32, 149, 'Teddy'),
(32, 150, 'Burt'),
(32, 151, 'Waiter');

-- Shutter Island (movie_id = 33)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(33, 1, 'Teddy Daniels'),
(33, 8, 'Chuck Aule'),
(33, 152, 'Dr. Cawley'),
(33, 153, 'Dr. Naehring'),
(33, 154, 'Dolores');

-- Man of Steel (movie_id = 34)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(34, 155, 'Clark Kent / Kal-El'),
(34, 156, 'Lois Lane'),
(34, 157, 'General Zod'),
(34, 158, 'Martha Kent'),
(34, 159, 'Jor-El');

-- The Lion King (movie_id = 35)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(35, 160, 'Zazu'),
(35, 161, 'Simba'),
(35, 162, 'Young Nala'),
(35, 163, 'Ed / Scar'),
(35, 164, 'Shenzi');

-- Fight Club (movie_id = 36)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(36, 165, 'Narrator'),
(36, 91, 'Tyler Durden'),
(36, 166, 'Robert Paulsen'),
(36, 167, 'Richard Chesler'),
(36, 168, 'Intern at Hospital');

-- Saving Private Ryan (movie_id = 37)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(37, 101, 'Captain Miller'),
(37, 169, 'Sergeant Horvath'),
(37, 170, 'Private Reiben'),
(37, 171, 'Private Jackson'),
(37, 172, 'Private Mellish');

-- Braveheart (movie_id = 38)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(38, 173, 'Young William'),
(38, 174, 'Malcolm Wallace'),
(38, 175, 'John Wallace'),
(38, 176, 'Campbell'),
(38, 177, 'MacClannough');

-- Avatar (movie_id = 39)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(39, 178, 'Jake Sully'),
(39, 179, 'Neytiri'),
(39, 180, 'Dr. Grace Augustine'),
(39, 181, 'Colonel Miles Quaritch'),
(39, 182, 'Trudy Chacón');

-- The Green Mile (movie_id = 40)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(40, 101, 'Paul Edgecomb'),
(40, 183, 'Brutus Howell'),
(40, 184, 'Jan Edgecomb'),
(40, 185, 'John Coffey'),
(40, 186, 'Warden Hal Moores');

-- The Usual Suspects (movie_id = 41)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(41, 187, 'McManus'),
(41, 188, 'Keaton'),
(41, 189, 'Fenster'),
(41, 190, 'Hockney'),
(41, 191, 'Verbal');

-- Batman Begins (movie_id = 42)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(42, 26, 'Bruce Wayne / Batman'),
(42, 192, 'Alfred'),
(42, 193, 'Ducard'),
(42, 194, 'Rachel Dawes'),
(42, 27, 'Jim Gordon');

-- Whiplash (movie_id = 43)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(43, 195, 'Andrew'),
(43, 196, 'Fletcher'),
(43, 197, 'Jim Neimann'),
(43, 198, 'Nicole'),
(43, 199, 'Ryan');

-- Good Will Hunting (movie_id = 44)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(44, 200, 'Will'),
(44, 56, 'Chuckie'),
(44, 201, 'Lambeau'),
(44, 202, 'Tom'),
(44, 203, 'Krystyn');

-- American History X (movie_id = 45)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(45, 165, 'Derek'),
(45, 204, 'Danny'),
(45, 205, 'Doris'),
(45, 206, 'Davina'),
(45, 207, 'Seth');

-- The Silence of the Lambs (movie_id = 46)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(46, 208, 'Clarice Starling'),
(46, 209, 'Dr. Hannibal Lecter'),
(46, 210, 'Jack Crawford'),
(46, 211, 'Jame Gumb'),
(46, 212, 'Dr. Frederick Chilton');

-- Mad Max: Fury Road (movie_id = 47)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(47, 4, 'Max Rockatansky'),
(47, 213, 'Imperator Furiosa'),
(47, 214, 'Nux'),
(47, 215, 'Immortan Joe'),
(47, 216, 'Slit');

-- It (movie_id = 48)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(48, 217, 'Bill Denbrough'),
(48, 218, 'Ben Hanscom'),
(48, 219, 'Beverly Marsh'),
(48, 220, 'Richie Tozier'),
(48, 221, 'Mike Hanlon');

-- Mission: Impossible (movie_id = 49)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(49, 222, 'Ethan Hunt'),
(49, 223, 'Jim Phelps'),
(49, 224, 'Claire'),
(49, 225, 'Kittridge'),
(49, 226, 'Krieger');

-- Back to the Future (movie_id = 50)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(50, 227, 'Marty McFly'),
(50, 228, 'Dr. Emmett Brown'),
(50, 229, 'Lorraine Baines'),
(50, 230, 'George McFly'),
(50, 231, 'Biff Tannen');

-- Die Hard (movie_id = 51)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(51, 232, 'John McClane'),
(51, 233, 'Holly Gennaro McClane'),
(51, 234, 'Sgt. Al Powell'),
(51, 235, 'Dwayne T. Robinson'),
(51, 236, 'Argyle');

-- Raiders of the Lost Ark (movie_id = 52)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(52, 237, 'Indy'),
(52, 238, 'Marion'),
(52, 239, 'Belloq'),
(52, 240, 'Toht'),
(52, 241, 'Sallah');

-- Spider-Man (movie_id = 53)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(53, 242, 'Spider-Man / Peter Parker'),
(53, 243, 'Green Goblin / Norman Osborn'),
(53, 244, 'Mary Jane Watson'),
(53, 245, 'Harry Osborn'),
(53, 246, 'Ben Parker');

-- Lock, Stock and Two Smoking Barrels (movie_id = 54)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(54, 247, 'Tom'),
(54, 248, 'Soap'),
(54, 249, 'Eddy'),
(54, 250, 'Bacon'),
(54, 251, 'Winston');

-- L.A. Confidential (movie_id = 55)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(55, 191, 'Jack Vincennes'),
(55, 159, 'Bud White'),
(55, 148, 'Ed Exley'),
(55, 186, 'Dudley Smith'),
(55, 252, 'Lynn Bracken');

-- My Neighbor Totoro (movie_id = 56)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(56, 253, 'Satsuki'),
(56, 254, 'Mei'),
(56, 255, 'Tatsuo Kusakabe'),
(56, 256, 'Yasuko Kusakabe'),
(56, 257, 'Granny');

-- The Shawshank Redemption (movie_id = 57)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(57, 258, 'Andy Dufresne'),
(57, 111, 'Ellis Boyd Red Redding'),
(57, 259, 'Warden Norton'),
(57, 260, 'Heywood'),
(57, 261, 'Captain Hadley');

-- The Godfather (movie_id = 58)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(58, 262, 'Don Vito Corleone'),
(58, 263, 'Michael Corleone'),
(58, 264, 'Sonny Corleone'),
(58, 265, 'Clemenza'),
(58, 266, 'Tom Hagen');

-- Léon: The Professional (movie_id = 59)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(59, 226, 'Leon'),
(59, 27, 'Stansfield'),
(59, 267, 'Mathilda'),
(59, 268, 'Tony'),
(59, 269, 'Malky');

-- The Godfather Part II (movie_id = 60)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(60, 263, 'Michael'),
(60, 266, 'Tom Hagen'),
(60, 270, 'Kay'),
(60, 43, 'Vito Corleone'),
(60, 271, 'Fredo Corleone');

-- Captain Planet and the Planeteers (movie_id = 61)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(61, 272, 'Captain Planet / ...'),
(61, 273, 'Kwame / ...'),
(61, 274, 'Wheeler / ...'),
(61, 275, 'Gi / ...'),
(61, 276, 'Ma-Ti / ...');

-- Living with Dinosaurs (movie_id = 62)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(62, 277, 'Lee Marshall'),
(62, 278, 'Vicky Marshall'),
(62, 279, 'Dom Marshall'),
(62, 280, 'Dog'),
(62, 281, 'Dog');

-- Aufbruch ins Leid - März 1938 (movie_id = 63) - Sem atores

-- Escape from Safehaven (movie_id = 64)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(64, 282, 'Pierce'),
(64, 283, 'Jeff Colt'),
(64, 284, 'Preacher'),
(64, 285, 'Natalie'),
(64, 286, 'Ben Colt');

-- Andolan (movie_id = 65)
INSERT INTO movie_actors (movie_id, actor_id, role) VALUES 
(65, 287, 'Adarsh Pradhan'),
(65, 288, 'Aniket'),
(65, 289, 'Anita'),
(65, 290, 'Guddi'),
(65, 291, 'Pradhan');

-- =====================================================
-- CRIAÇÃO DE ÍNDICES PARA PERFORMANCE
-- =====================================================

CREATE INDEX idx_movie_director ON movies(director_id);
CREATE INDEX idx_movie_year ON movies(release_year);
CREATE INDEX idx_movie_genre ON movies(genre);
CREATE INDEX idx_movie_actor_movie ON movie_actors(movie_id);
CREATE INDEX idx_movie_actor_actor ON movie_actors(actor_id);

-- =====================================================
-- FIM DO SCRIPT
-- =====================================================
