CREATE DATABASE running;
\c running;


CREATE TABLE accounts (id SERIAL PRIMARY KEY, user_name VARCHAR(50), user_email VARCHAR(150), password_digest VARCHAR(255), join_date VARCHAR(50));

-- possibly add completed trainings

CREATE TABLE trackers (id SERIAL PRIMARY KEY, week INTEGER, day INTEGER, distance INTEGER);
-- ^ connection to the user_name


-- \dt;
-- -- SELECT * FROM accounts;
