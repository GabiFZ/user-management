CREATE TABLE IF NOT EXISTS role(
                                   role_id BIGINT UNIQUE NOT NULL,
                                   ROLE_NAME VARCHAR(45) UNIQUE NOT NULL,

    CONSTRAINT role_pk PRIMARY KEY (role_id)
    );

INSERT INTO role(role_id, ROLE_NAME) VALUES(1, 'USER');
INSERT INTO role(role_id, ROLE_NAME) VALUES(2, 'VISITOR');
INSERT INTO role(role_id, ROLE_NAME) VALUES(3, 'ADMIN');