CREATE DATABASE running;
\c running;


CREATE TABLE accounts (id SERIAL PRIMARY KEY, user_name VARCHAR(50), user_email VARCHAR(150), password_digest VARCHAR(255), join_date VARCHAR(50));

-- possibly add completed trainings

CREATE TABLE trackers (id SERIAL PRIMARY KEY, settings_id INTEGER, week INTEGER, distance_mon DECIMAL, distance_tues DECIMAL, distance_wed DECIMAL, distance_thurs DECIMAL, distance_fri DECIMAL, distance_sat DECIMAL, distance_sun DECIMAL);

-- Should distance be decimal?

CREATE TABLE settings (id SERIAL PRIMARY KEY, account_id INTEGER, marathon_name VARCHAR(255), marathon_date VARCHAR(50), skill_level VARCHAR(50));

-- CREATE TABLE novice (id SERIAL PRIMARY KEY, monday VARCHAR(10), tuesday VARCHAR(10), wednesday VARCHAR(10), thursday VARCHAR(10), friday VARCHAR(10), saturday VARCHAR(10), sunday VARCHAR(10));


-- \dt;
-- -- SELECT * FROM accounts;
