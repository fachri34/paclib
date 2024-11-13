SELECT 
 title, 
 qty, 
 COUNT(loan_id) AS loan_count
FROM 
 books
JOIN 
 library_books USING(book_id)
JOIN 
 loans USING(library_book_id)
GROUP BY title, qty
ORDER BY loan_count DESC
LIMIT 10;

SELECT 
 title, 
 COUNT(loan_id) AS loan_count, 
 COUNT(DISTINCT library_id) AS library_count
FROM 
 books
JOIN 
 library_books USING(book_id)
LEFT JOIN 
 loans USING(library_book_id)
GROUP BY title
HAVING COUNT(loan_id) = 0 AND COUNT(DISTINCT library_id) > 1
ORDER BY library_count DESC;

SELECT 
 name AS library_name, 
 COUNT(DISTINCT user_id) AS active_users, 
 SUM(qty) AS total_books
FROM 
 libraries
JOIN 
 library_books USING(library_id)
JOIN 
 loans USING(library_book_id)
GROUP BY name
ORDER BY active_users DESC;


SELECT 
    a.author_name, 
    COUNT(l.loan_id) AS loan_count
FROM 
    authors a
JOIN 
    books_author ba ON a.author_id = ba.author_id
JOIN 
    books b ON ba.book_id = b.book_id
JOIN 
    library_books lb ON b.book_id = lb.book_id
JOIN 
    loans l ON lb.library_book_id = l.library_book_id
GROUP BY 
    a.author_name
ORDER BY 
    loan_count DESC;

SELECT 
    g.genre AS genre_name, 
    COUNT(h.hold_id) AS hold_count
FROM 
    genres g
JOIN 
    book_genre bg ON g.genre_id = bg.genre_id
JOIN 
    library_books lb ON bg.book_id = lb.book_id
JOIN 
    holds h ON lb.library_book_id = h.library_book_id
GROUP BY 
    g.genre
ORDER BY 
    hold_count DESC;

