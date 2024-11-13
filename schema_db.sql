CREATE TABLE libraries (
    library_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) UNIQUE NOT NULL,
    address TEXT NOT NULL
);

COPY
	libraries
FROM
	'D:\Coding\Pacmann\Data Engineer\3. SQL\Mentoring\mentoring-week8\library.csv'
DELIMITER ','
CSV
HEADER;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
	gender VARCHAR(255) NOT NULL,
	age INT NOT NULL,
	username VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    address TEXT NOT NULL
);

COPY
	user
FROM
	'D:\Coding\Pacmann\Data Engineer\3. SQL\Mentoring\mentoring-week8\user.csv'
DELIMITER ','
CSV
HEADER;

CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    genre VARCHAR(255) NOT NULL
);

COPY
	genre
FROM
	'D:\Coding\Pacmann\Data Engineer\3. SQL\Mentoring\mentoring-week8\genre.csv'
DELIMITER ','
CSV
HEADER;

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
	average_rating FLOAT, 
    isbn VARCHAR(255) UNIQUE NOT NULL,
	ratings_count int,
	publisher VARCHAR(255)
);

COPY
	books
FROM
	'D:\Coding\Pacmann\Data Engineer\3. SQL\Mentoring\mentoring-week8\books.csv'
DELIMITER ','
CSV
HEADER;

CREATE TABLE book_genre (
    book_genre_id SERIAL PRIMARY KEY,
    genre_id INT REFERENCES genres(genre_id) ON DELETE CASCADE,
    book_id INT REFERENCES books(book_id) ON DELETE CASCADE
);

COPY
	book_genre
FROM
	'D:\Coding\Pacmann\Data Engineer\3. SQL\Mentoring\mentoring-week8\genre_book.csv'
DELIMITER ','
CSV
HEADER;

CREATE TABLE library_books (
    library_book_id SERIAL PRIMARY KEY,
    library_id INT REFERENCES libraries(library_id) ON DELETE CASCADE,
    book_id INT REFERENCES books(book_id) ON DELETE CASCADE,
    qty NUMERIC NOT NULL
);

COPY
	library_books
FROM
	'D:\Coding\Pacmann\Data Engineer\3. SQL\Mentoring\mentoring-week8\library_book.csv'
DELIMITER ','
CSV
HEADER;

CREATE TABLE loans (
    loan_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    library_book_id INT REFERENCES library_books(library_book_id) ON DELETE CASCADE,
    loan_date TIMESTAMP NOT NULL,
    due_date TIMESTAMP NOT NULL,
    return_date TIMESTAMP
);

COPY
	loans
FROM
	'D:\Coding\Pacmann\Data Engineer\3. SQL\Mentoring\mentoring-week8\loan.csv'
DELIMITER ','
CSV
HEADER;

CREATE TABLE holds (
    hold_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    library_book_id INT REFERENCES library_books(library_book_id) ON DELETE CASCADE,
    hold_date TIMESTAMP NOT NULL,
    expiry_date TIMESTAMP NOT NULL,
    status VARCHAR(255) NOT NULL
);

COPY
	holds
FROM
	'D:\Coding\Pacmann\Data Engineer\3. SQL\Mentoring\mentoring-week8\hold.csv'
DELIMITER ','
CSV
HEADER;

CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

COPY
	authors
FROM
	'D:\Coding\Pacmann\Data Engineer\3. SQL\Mentoring\mentoring-week8\author.csv'
DELIMITER ','
CSV
HEADER;

CREATE TABLE books_author (
    book_author_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books(book_id) ON DELETE CASCADE,
    author_id INT REFERENCES authors(author_id) ON DELETE CASCADE
);

COPY
	books_author
FROM
	'D:\Coding\Pacmann\Data Engineer\3. SQL\Mentoring\mentoring-week8\book_author.csv'
DELIMITER ','
CSV
HEADER;