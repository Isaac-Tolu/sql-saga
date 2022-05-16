DROP TYPE IF EXISTS hp CASCADE;

CREATE TYPE hp AS ENUM
    ('PS', 'CS', 'PA', 'GF', 'OP', 'HP', 'DH');

CREATE TABLE harry_potter_books (book hp,
                                 title text,
                                 release_date date,
                                 no_of_pages int);

INSERT INTO harry_potter_books
    VALUES ('HP', 'Harry Potter and the Half-Blood Prince', 'July 16, 2005', 652),
           ('PA', 'Harry Potter and the Prisoner of Azkaban', 'July 8, 1999', 433),
           ('CS', 'Harry Potter and the Chamber of Secrets', 'July 2, 1998', 341),
           ('GF', 'Harry Potter and the Goblet of Fire', 'July 8, 2000', 736),
           ('PS', $$Harry Potter and the Philosopher's Stone$$, 'June 26, 1997', 312),
           ('DH', 'Harry Potter and the Deathly Hallows', 'July 14, 2007', 759),
           ('OP', 'Harry Potter and the Order of the Phoenix', 'June 21, 2003', 872);