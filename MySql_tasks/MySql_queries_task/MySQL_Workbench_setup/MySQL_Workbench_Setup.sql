SELECT * FROM users;

SELECT * FROM faves;

SELECT *  FROM follows;

SELECT * FROM tweets;
SELECT * 
FROM users
WHERE first_name <> "K%";

SELECT *
FROM users
ORDER BY birthday desc;

SELECT first_name
FROM users
ORDER BY first_name;

SELECT *
FROM users
LIMIT 3;
select * from users ;
SELECT *
FROM users
LIMIT 3
OFFSET 2;

SELECT *
FROM users
LIMIT 2,3;

SELECT * FROM users ;

INSERT INTO `twitter`.`users` (`first_name`, `last_name`, `handle`, `birthday`, `created_at`, `updated_at`) VALUES ('Mitri', 'Khoury', 'kobebryant', '2003-4-17', '2001-02-01 00:00:01', '2001-02-01 00:00:01');
 
 
UPDATE users Set first_name = 'mitri' where id =1;
 
SET SQL_SAFE_UPDATES = 0;
select * from tweets;
DELETE FROM tweets where id = 10;
 
SELECT NOW() AS right_now ;
 
SELECT concat('Mr', ' ', first_name, ' ', last_name) FROM users;
SELECT concat_ws('Mr', first_name, last_name) FROM users;   

 
SELECT *
FROM users
LEFT JOIN tweets
ON users.id = tweets.user_id
WHERE users.id = 1;


SELECT tweets.tweet
FROM users
LEFT JOIN tweets
ON users.id = tweets.user_id
WHERE users.id = 1;

SELECT first_name, tweet
FROM users
LEFT JOIN faves
ON users.id = faves.user_id
LEFT JOIN tweets
ON faves.tweet_id = tweets.id
WHERE users.id = 2;
  -- some commands i use as trainning in mysql queries ......