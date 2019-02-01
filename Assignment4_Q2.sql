
CREATE SCHEMA IF NOT EXISTS rrobertson;

USE rrobertson;


CREATE TABLE ARTIST(
  Name VARCHAR(40) NOT NULL,
  DoB int(8),
  DoD int(8),
  PRIMARY KEY(Name)
  
  );

CREATE TABLE PAINTING(
  Creator VARCHAR(25) NOT NULL,
  Style VARCHAR(25),
  Painting_id VARCHAR(45) NOT NULL,
  PRIMARY KEY(Painting_id),
  FOREIGN KEY(Creator) REFERENCES ARTIST(Name)
  );
  
CREATE TABLE SCULPTURE(
	Creator VARCHAR(25) NOT NULL,
    Style VARCHAR(25),
    Sculpture_id VARCHAR(45) NOT NULL,
    PRIMARY KEY(Sculpture_id),
    FOREIGN KEY(Creator) REFERENCES ARTIST(Name)
    );
    
    
INSERT INTO ARTIST(Name, DoB, DoD) VALUES
('Name', 12345678, 77777777),
('Picasso', 10251881, 004081973),
('Michelangelo', 03061475, 02181564),
('Monet', 11141840, 12051926),
('Van Gogh', 03301853, 05291890),
('Bob Loblaw', 01010060, 12122099),
('Foo Fighter', 12345678, 77776777),
('Toby Fox', 90969090, 09899980),
('The Beatles', 78651960, 10011970),
('Mozart', 01271756, 12051791);

INSERT INTO PAINTING(Creator, Style, Painting_id) VALUES
('Name', 'Style', 'id'),
('Michelangelo', 'Impressionist', 'id2'),
('Picasso', 'Blocky', 'id3'),
('Monet', 'Impressionist', 'id4'),
('Van Gogh', 'Impressionist', 'id5'),
('Bob Loblaw', 'Blawcky', 'id6'),
('Foo Fighter', 'Rockabybaby', 'id7'),
('Toby Fox', 'Undertale', 'id8'),
('The Beatles', 'Rock', 'id9'),
('Mozart', 'Classical', 'id10');

INSERT INTO SCULPTURE(Creator, Style, Sculpture_id) VALUES
('Name', 'Style', 'id'),
('Michelangelo', 'Big_thing', 'id2'),
('Picasso', 'Blocky', 'id3'),
('Monet', 'Classic_block', 'id4'),
('Van Gogh', 'Bold_and_Brash', 'id5'),
('Bob Loblaw', 'Blocky', 'id6'),
('Foo Fighter', 'Style', 'id7'),
('Toby Fox', 'Annoying_Dog', 'id8'),
('The Beatles', 'Rocky_boy', 'id9'),
('Mozart', 'Classical', 'id10');


DELETE FROM PAINTING
WHERE Painting_id = 'Thing';

UPDATE ARTIST
SET DoB = DoB + 1
WHERE Name = 'The one that will never be updated';


SELECT SCULPTURE.Creator, SCULPTURE.Style, SCULPTURE.Sculpture_id, PAINTING.Style, PAINTING.Painting_id FROM SCULPTURE
INNER JOIN PAINTING ON PAINTING.Creator = SCULPTURE.Creator
WHERE SCULPTURE.Creator = 'Monet';

SELECT Name FROM ARTIST;

SELECT Creator FROM PAINTING;

SELECT Creator FROM SCULPTURE;

SELECT *
FROM ARTIST
WHERE DOB > 01011600
GROUP BY Name
ORDER BY DoB;

CREATE VIEW Impressionists(Name, Painting_style, Sculpture_style) AS
SELECT A.Name, P.Style, S.Style
FROM ARTIST AS A, PAINTING AS P, SCULPTURE AS S
WHERE A.Name = P.Creator and A.Name = S.Creator;


DROP VIEW Impressionists;

/*SELECT * FROM Impressionists;
*/

DELIMITER //
CREATE TRIGGER Before_Artist_Update BEFORE UPDATE ON ARTIST FOR EACH ROW
BEGIN
IF NEW.DoB < 0 THEN
SET NEW.DoB = OLD.DoB;
END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_Artist_Update2 BEFORE UPDATE ON ARTIST FOR EACH ROW
BEGIN
IF NEW.DoD < 0 THEN
SET NEW.DoD = OLD.DoD;
END IF;
END //
DELIMITER ;



CREATE PROCEDURE findArtist(inname nvarchar(30)) 
SELECT * FROM ARTIST 
WHERE Name = inname;


Call findArtist('Toby Fox');



UPDATE ARTIST
SET DoB = -123
WHERE Name = 'Van Gogh';



SELECT * FROM ARTIST;


SELECT * FROM PAINTING WHERE Creator='Monet';





