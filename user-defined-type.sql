-- Source: https://www.youtube.com/watch?v=ECZ4GNw_pA0&list=PL1XF9qjV8kH12PTd1WfsKeUQU6e83ldfc&index=16
-- I have not watched StarWars (not proud of that), so I decided to replicate the same example with Harry Potter.
-- Yes, I'm a proud Harry Potter freak

DROP TYPE IF EXISTS hp CASCADE;
CREATE TYPE hp AS ENUM
    ('PS', 'CS', 'PA', 'GF', 'OP', 'HP', 'DH');    -- Only the 7 original HP books

CREATE TABLE harry_potter_books (book hp,
                                 title text,
                                 release_date date,
                                 no_of_pages int);

INSERT INTO harry_potter_books
    VALUES ('HP', 'Harry Potter and the Half-Blood Prince', 'July 16, 2005', 652),
           ('PA', 'Harry Potter and the Prisoner of Azkaban', 'July 8, 1999', 433),
           ('CS', 'Harry Potter and the Chamber of Secrets', 'July 2, 1998', 341),
           ('GF', 'Harry Potter and the Goblet of Fire', 'July 8, 2000', 736),
           ('PS', 'Harry Potter and the Philosophers Stone', 'June 26, 1997', 312),
           ('DH', 'Harry Potter and the Deathly Hallows', 'July 14, 2007', 759),
           ('OP', 'Harry Potter and the Order of the Phoenix', 'June 21, 2003', 872);

-- Try to add a popular HP fan-fiction to the table
INSERT INTO harry_potter_books(book, title, release_date, no_of_pages)
    VALUES ('MR', 'Harry Potter and the Methods of Rationality', 'February 28, 2010', 1926);
-- ERROR:  invalid input value for enum hp: "MR"
-- Only original HP books are accepted in this type

TABLE harry_potter_books;
--     book |                   title                   | release_date | no_of_pages
--    ------+-------------------------------------------+--------------+-------------
--     HP   | Harry Potter and the Half-Blood Prince    | 2005-07-16   |         652
--     PA   | Harry Potter and the Prisoner of Azkaban  | 1999-07-08   |         433
--     CS   | Harry Potter and the Chamber of Secrets   | 1998-07-02   |         341
--     GF   | Harry Potter and the Goblet of Fire       | 2000-07-08   |         736
--     PS   | Harry Potter and the Philosophers Stone   | 1997-06-26   |         312
--     DH   | Harry Potter and the Deathly Hallows      | 2007-07-14   |         759
--     OP   | Harry Potter and the Order of the Phoenix | 2003-06-21   |         872

-- Ordering using the enumerated type
-- It follows the order in which the type was created
SELECT hpb.*
FROM harry_potter_books hpb
ORDER BY hpb.book;
--     book |                   title                   | release_date | no_of_pages
--    ------+-------------------------------------------+--------------+-------------
--     PS   | Harry Potter and the Philosophers Stone   | 1997-06-26   |         312
--     CS   | Harry Potter and the Chamber of Secrets   | 1998-07-02   |         341
--     PA   | Harry Potter and the Prisoner of Azkaban  | 1999-07-08   |         433
--     GF   | Harry Potter and the Goblet of Fire       | 2000-07-08   |         736
--     OP   | Harry Potter and the Order of the Phoenix | 2003-06-21   |         872
--     HP   | Harry Potter and the Half-Blood Prince    | 2005-07-16   |         652
--     DH   | Harry Potter and the Deathly Hallows      | 2007-07-14   |         759

-- Ordering using the page count
SELECT hpb.*
FROM harry_potter_books hpb
ORDER BY hpb.no_of_pages DESC;
--     book |                   title                   | release_date | no_of_pages
--    ------+-------------------------------------------+--------------+-------------
--     OP   | Harry Potter and the Order of the Phoenix | 2003-06-21   |         872
--     DH   | Harry Potter and the Deathly Hallows      | 2007-07-14   |         759
--     GF   | Harry Potter and the Goblet of Fire       | 2000-07-08   |         736
--     HP   | Harry Potter and the Half-Blood Prince    | 2005-07-16   |         652
--     PA   | Harry Potter and the Prisoner of Azkaban  | 1999-07-08   |         433
--     CS   | Harry Potter and the Chamber of Secrets   | 1998-07-02   |         341
--     PS   | Harry Potter and the Philosophers Stone   | 1997-06-26   |         312