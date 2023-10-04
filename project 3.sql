--Q1- Who is the senior most employee based on job title?
select * from employee
order by levels desc
limit 1;

--Q2-Which country has the most invoices?
select billing_country,count(billing_country) as total_invoice
from invoice
group by billing_country
order by total_invoice desc
limit 1;

--Q3-What are top 3 values of total invoice?
select total from invoice
order by total desc
limit 3




--Q4-Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money 
--Write a query that returns one city that has the highest sum of invoice totals 
  -- return both city and invoice totals
   select billing_city,sum(total) as total1
   from invoice
   group by billing_city
   order by total1 desc
   limit 1;
   
   
 --	Q5-Who is the best customer? The customer who has spent the most money will
 --     be declared as the best customer .Write a querry that returns the person who
 --       has spent the most amount of money!
   
select customer.customer_id,customer.first_name,customer.last_name,sum(invoice.total) as o_total
from customer 
JOIN INVOICE 
ON customer.customer_id=invoice.customer_id 
group by customer.customer_id
order by o_total desc
limit 1;
		
		
--Question set 2

--Ques> Write query to return the email ,first name ,last name and Genre of all rock music listners
--      Return your list ordered alphabetically by email starting with A 
SELECT DISTINCT customer.email,customer.first_name,customer.last_name
from customer
JOIN Invoice
ON customer.customer_id=invoice.customer_id
JOIN invoice_line 
ON invoice.invoice_id=invoice_line.invoice_id
JOIN track
ON invoice_line.track_id=track.track_id
JOIN Genre
ON track.genre_id=Genre.genre_id
WHERE Genre.name='Rock'
ORDER BY email asc


--Ques>Lets invite the artist who has written the most rock music in our dataset .Write a query that 
--     returns the artist name and total track count of the top 10 rock bands
select artist.name,count(genre.name) as total
from artist
JOIN album
on artist.artist_id=album.artist_id
JOIN track
on album.album_id=track.album_id
JOIN genre
on track.genre_id=genre.genre_id
where genre.name='Rock'
group by artist.name
order by total desc
limit 10;


--Ques> Return all the track names that have a song length longer than the average song length .Return the 
--Name and Milliseconds for each track .Order by the song length with the longest songs listed first

select avg(milliseconds) as a
from track
--now we know that average milliseconds is 393599.2122
--now we want to selectsongs with average milli seconds more than this
select name,milliseconds 
from track
where milliseconds > 393599.2122
order by milliseconds desc





