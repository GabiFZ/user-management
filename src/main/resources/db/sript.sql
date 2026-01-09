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
    fk_address BIGINT             NULL UNIQUE,
    firstname VARCHAR(65),
    lastname  VARCHAR(65),
    username  VARCHAR(45) UNIQUE NOT NULL,
    password VARCHAR(100)  NOT NULL,
    email    VARCHAR(65) UNIQUE NOT NULL,
    is_enabled BOOLEAN NOT NULL DEFAULT TRUE,
    date_added TIMESTAMP NOT NULL DEFAULT NOW()::TIMESTAMP,

    CONSTRAINT app_user_pk PRIMARY KEY (user_id),
    CONSTRAINT app_user_fk_role FOREIGN KEY (fk_role) REFERENCES  role(role_id),
    CONSTRAINT app_user_fk_address FOREIGN KEY (fk_address) REFERENCES address (id)
);

INSERT INTO app_user (fk_role, fk_address, firstname, lastname, username, password, email, is_enabled, date_added)
VALUES (3, 1, 'Alice', 'Smith', 'alicesmith', 'password789', 'alice.smith@example.com', FALSE, NOW());

INSERT INTO app_user (fk_role, fk_address, firstname, lastname, username, password, email, is_enabled, date_added)
VALUES (1, 2, 'Bob', 'Johnson', 'bobjohnson', 'passwordabc', 'bob.johnson@example.com', TRUE, NOW());

INSERT INTO app_user (fk_role, fk_address, firstname, lastname, username, password, email, is_enabled, date_added)
VALUES (2, NULL, 'Sarah', 'Lee', 'sarahlee', 'passworddef', 'sarah.lee@example.com', TRUE, NOW());

INSERT INTO app_user (fk_role, fk_address, firstname, lastname, username, password, email, is_enabled, date_added)
VALUES (3, 3, 'Mike', 'Brown', 'mikebrown', 'passwordxyz', 'mike.brown@example.com', TRUE, NOW());

INSERT INTO app_user (fk_role, fk_address, firstname, lastname, username, password, email, is_enabled, date_added)
VALUES (2, 4, 'Emily', 'Wong', 'emilywong', 'password123', 'emily.wong@example.com', FALSE, NOW());

INSERT INTO app_user (fk_role, fk_address, firstname, lastname, username, password, email, is_enabled, date_added)
VALUES (1, NULL, 'David', 'Kim', 'davidkim', 'password456', 'david.kim@example.com', TRUE, NOW());

INSERT INTO app_user (fk_role, fk_address, firstname, lastname, username, password, email, is_enabled, date_added)
VALUES (3, NULL, 'Julia', 'Chen', 'juliachen', 'password789', 'julia.chen@example.com', TRUE, NOW());

INSERT INTO app_user (fk_role, fk_address, firstname, lastname, username, password, email, is_enabled, date_added)
VALUES (1, 5, 'Ryan', 'Garcia', 'ryangarcia', 'passwordabc', 'ryan.garcia@example.com', FALSE, NOW());

INSERT INTO app_user (fk_role, fk_address, firstname, lastname, username, password, email, is_enabled, date_added)
VALUES (3, null, 'Gabi', 'Ion', 'Gabi2005', '$2a$10$ls59iekZoEyszbC3XRqoB.vyvsM8oV2n.YJxb5g8bVthF4C5Xkhw2', 'gabi.ion@outlook.com', TRUE, NOW());