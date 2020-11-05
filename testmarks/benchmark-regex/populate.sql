-- SQL statements to populate tables with text and patterns.
--
-- Most of text strings are in the form "STARTtext([0-9]text)*END" - START marks the
-- start of text, then there are several textual parts separated with digits and END marks the end.

-------------------------------------------------------------------------------
-- a table with text lines. it contains number of delimiters used and text
-- with the specified number of delimiters.
CREATE TABLE IF NOT EXISTS texts (num_delims INTEGER, text_line TEXT);

DELETE FROM texts;

-- it was once temporary but I decided to make it
-- a part of testing. We can use these texts to construct
-- queries identical to the ones stored in texts to, well, check everything.
CREATE TABLE IF NOT EXISTS text_parts (text_part TEXT);
DELETE FROM text_parts;

INSERT INTO text_parts (text_part) VALUES ("fiyulnabmi");
INSERT INTO text_parts (text_part) VALUES ("noinceolik");
INSERT INTO text_parts (text_part) VALUES ("gesundheit");
INSERT INTO text_parts (text_part) VALUES ("bebegonebe");
INSERT INTO text_parts (text_part) VALUES ("not ten chars");
INSERT INTO text_parts (text_part) VALUES ("zurbagan");
INSERT INTO text_parts (text_part) VALUES ("русский текст");
INSERT INTO text_parts (text_part) VALUES ("if a packet hits a pocket on a socket on a port");
INSERT INTO text_parts (text_part) VALUES ("and the bus is interrupted as the very last resort");
INSERT INTO text_parts (text_part) VALUES ("and the memory addressing makes your floppy disk abort");
INSERT INTO text_parts (text_part) VALUES ("then the socket packet pocket has an error to report!");
INSERT INTO text_parts (text_part) VALUES ("мороз и солнце, день чудесный!");
INSERT INTO text_parts (text_part) VALUES ("ещё ты дремлешь, друг прелестный!");
INSERT INTO text_parts (text_part) VALUES ("вставай, красавица, проснись!");
INSERT INTO text_parts (text_part) VALUES ("Открой сомкнуты негой взоры,");
INSERT INTO text_parts (text_part) VALUES ("навстречу северной Авроры,");
INSERT INTO text_parts (text_part) VALUES ("Звездою Севера явись!");
INSERT INTO text_parts (text_part) VALUES ("Tyger! Tyger!");
INSERT INTO text_parts (text_part) VALUES ("Burning bright in the forests of the night!");
INSERT INTO text_parts (text_part) VALUES ("What immortal hand or eye,");
INSERT INTO text_parts (text_part) VALUES ("Could frame your fearful symmetry?");

-- populating our great table.
INSERT INTO texts (num_delims, text_line)
    SELECT 0, 'START' || T0.text_part || 'END'
    FROM text_parts as T0;

INSERT INTO texts (num_delims, text_line)
    SELECT 1, 'START' || T0.text_part || '1' || T1.text_part || 'END'
    FROM text_parts as T0, text_parts as T1;

INSERT INTO texts (num_delims, text_line)
    SELECT 2, 'START' || T0.text_part || '1' || T1.text_part || '2' || T2.text_part || 'END'
    FROM text_parts as T0, text_parts as T1, text_parts as T2;

INSERT INTO texts (num_delims, text_line)
    SELECT 3, 'START' || T0.text_part || '1' || T1.text_part || '2' || T2.text_part || '3' || T3.text_part || 'END'
    FROM text_parts as T0, text_parts as T1, text_parts as T2, text_parts as T3;

SELECT COUNT(*) FROM texts;

