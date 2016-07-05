#Exercise 1
SELECT e.isbn 
FROM editions AS e, publishers AS p 
WHERE e.publisher_id = p.id AND p.name = 'Random House';
#Exercis 2
SELECT e.isbn, b.title 
FROM editions AS e, publishers AS p, books AS b 
WHERE e.publisher_id = p.id AND p.name = 'Random House' AND b.id = e.book_id;
#Exercise 3
SELECT e.isbn, b.title, s.stock, s.retail 
FROM editions AS e, publishers AS p, books AS b, stock AS s
WHERE e.publisher_id = p.id AND p.name = 'Random House' AND b.id = e.book_id AND e.isbn = s.isbn;
#Exercise 4
SELECT e.isbn, b.title, s.stock, s.retail 
FROM editions AS e, publishers AS p, books AS b, stock AS s 
WHERE e.publisher_id = p.id AND p.name = 'Random House' AND b.id = e.book_id AND e.isbn = s.isbn AND s.stock > 0;
#Exercis 5
SELECT e.isbn, b.title, s.stock, s.retail, e.type, 
CASE WHEN e.type = 'h' THEN 'hardcover'
WHEN e.type = 'p' THEN 'paperback'
ELSE 'other'
END
FROM editions AS e, publishers AS p, books AS b, stock AS s 
WHERE e.publisher_id = p.id AND p.name = 'Random House' AND b.id = e.book_id AND e.isbn = s.isbn AND s.stock > 0;
#Exercise 6
SELECT DISTINCT b.title, e.publication
FROM books AS b 
LEFT JOIN editions AS e ON b.id = e.book_id;
#Exercise 7
SELECT SUM(stock) FROM stock;
#Exercise 8
SELECT AVG(retail) AS "Average Retail",
AVG(cost) AS "Average Cost",
(AVG(retail) - AVG(cost)) AS "Average Profit"
FROM stock;
#Exercise 9
SELECT editions.book_id
FROM stock 
JOIN editions ON stock.isbn = editions.isbn
ORDER BY
stock.stock
DESC
LIMIT 1
;
#Exercise 10
SELECT authors.id AS "ID", 
(authors.first_name||' '|| authors.last_name) AS "Full name", 
COUNT(books.author_id) AS "Number of Books"
FROM authors
JOIN books ON authors.id = books.author_id
GROUP BY
authors.id,
(authors.first_name||''|| authors.last_name)
#Exercise 11
SELECT authors.id AS "ID", 
(authors.first_name||' '|| authors.last_name) AS "Full name", 
COUNT(books.author_id) AS "Number of Books"
FROM authors
JOIN books ON authors.id = books.author_id
GROUP BY
authors.id,
(authors.first_name||''|| authors.last_name)
ORDER BY
COUNT(books.author_id)
DESC
