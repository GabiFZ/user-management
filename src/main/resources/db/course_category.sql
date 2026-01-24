-- 1. Sequence pentru course_category
CREATE SEQUENCE IF NOT EXISTS seq_course_category;

-- 2. Tabel course_category
CREATE TABLE IF NOT EXISTS course_category (
                                               course_category_id BIGINT NOT NULL DEFAULT nextval('seq_course_category'),
                                               course_category_name VARCHAR(65) UNIQUE NOT NULL,
                                               CONSTRAINT course_category_pk PRIMARY KEY (course_category_id)
);

-- 3. Date inițiale
INSERT INTO course_category (course_category_name)
VALUES ('PROGRAMMING')
ON CONFLICT DO NOTHING;

INSERT INTO course_category (course_category_name)
VALUES ('BUSINESS')
ON CONFLICT DO NOTHING;

INSERT INTO course_category (course_category_name)
VALUES ('FOREIGN LANGUAGES')
ON CONFLICT DO NOTHING;