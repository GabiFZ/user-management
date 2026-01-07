CREATE TABLE IF NOT EXISTS role(
    role_id BIGINT UNIQUE NOT NULL,
    ROLE_NAME VARCHAR(45) UNIQUE NOT NULL,

    CONSTRAINT role_pk PRIMARY KEY (role_id)
);

INSERT INTO role(role_id, ROLE_NAME) VALUES(1, 'USER');
INSERT INTO role(role_id, ROLE_NAME) VALUES(2, 'VISITOR');
INSERT INTO role(role_id, ROLE_NAME) VALUES(3, 'ADMIN');

CREATE SEQUENCE seq_app_user;

CREATE TABLE IF NOT EXISTS app_user(
    user_id BIGINT  UNIQUE NOT NULL DEFAULT nextval('seq_app_user'),
    fk_role BIGINT NOT NULL DEFAULT 1,
   -- name VARCHAR(65) NOT NULL,
    firstname VARCHAR(65),
    lastname  VARCHAR(65),
    username  VARCHAR(45) UNIQUE NOT NULL,
    password VARCHAR(100)  NOT NULL,
    email    VARCHAR(65) UNIQUE NOT NULL,
    is_enabled BOOLEAN NOT NULL DEFAULT TRUE,
    date_added TIMESTAMP NOT NULL DEFAULT NOW()::TIMESTAMP,

    CONSTRAINT app_user_pk PRIMARY KEY (user_id),
    CONSTRAINT app_user_fk_role FOREIGN KEY (fk_role) REFERENCES  role(role_id)
);

INSERT INTO app_user(firstname, lastname,  username, password, email) VALUES ('Mike', 'Johnson','MikeUser', 'pass123', 'Mike@email.com');
INSERT INTO app_user(firstname, lastname,  username, password, email) VALUES ('Alex', 'Marin','AlexUser', 'pass123', 'Alex@email.com');
INSERT INTO app_user(firstname, lastname, username, password, email) VALUES ('Andreea', 'Marin','AndreeaUser', 'pass123', 'Andreea@email.com');
INSERT INTO app_user(fk_role, firstname, lastname, username, password, email) VALUES (2,'John', 'Smith','JohnUser', 'pass123', 'John@email.com');
INSERT INTO app_user(fk_role, firstname, lastname, username, password, email) VALUES (3,'Jane', 'Smith','JaneUser', 'pass123', 'Jane@email.com');