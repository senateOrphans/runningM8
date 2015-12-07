CREATE DATABASE running;
\c running;


CREATE TABLE accounts (id SERIAL PRIMARY KEY, user_name VARCHAR(50), user_email VARCHAR(150), password_digest VARCHAR(255), join_date VARCHAR(50));

-- possibly add completed trainings

CREATE TABLE trackers (id SERIAL PRIMARY KEY, settings_id INTEGER, week INTEGER, day INTEGER, distance DECIMAL);

-- Should distance be decimal?

CREATE TABLE settings (id SERIAL PRIMARY KEY, account_id INTEGER, marathon_name VARCHAR(255), marathon_date VARCHAR(50), skill_level INTEGER);


-- \dt;
-- -- SELECT * FROM accounts;
