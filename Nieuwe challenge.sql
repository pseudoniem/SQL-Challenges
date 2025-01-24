EXEC sqlchallenge.dbo.create_challenge 'list';



DECLARE @CHALLENGE_NAME VARCHAR(200);
DECLARE @CHALLENGE_LIST TABLE (id INT, name VARCHAR(200), description VARCHAR(MAX),	web_address VARCHAR(200), blog_address VARCHAR(200), valid_from DATE, valid_to DATE);

INSERT INTO @CHALLENGE_LIST
EXEC sqlchallenge.dbo.create_challenge 'list'

SELECT @CHALLENGE_NAME = name FROM @CHALLENGE_LIST
WHERE id = 1;

EXEC sqlchallenge.dbo.create_challenge @CHALLENGE_NAME;