select * from album;

Q1 :- Who is the senior most employe based on the job title?

SELECT * FROM EMPLOYEE;
SELECT * FROM EMPLOYEE ORDER BY LEVELS DESC LIMIT 1;

Q2:- Which countries have the most invoices ?

select * from invoice;
select count(*), billing_country from invoice group by billing_country order by count desc;

Q3 :- What are the top 3 value of total invoice;

select total from invoice order by total desc limit 3;

Q4 :- which city has th best customers ? We would like to throw a promotional
music festival in the city we made the most money. Write a query
that returns one city that has the highest sun of invoice totals
return both the city name and sum of all invoice total.


select sum(total) as sumtotal, billing_city from invoice group by billing_city order by sumtotal desc; 

--Q5: Who is the best customer? The customer who has spent the most money
--will be declared the best customer.Write a query that returns the person 
--who has spent the most money.

Select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total from customer
join invoice on customer.customer_id = invoice.customer_id
 group by customer.customer_id order by total desc limit 1;


--Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
--Return your list ordered alphabetically by email starting with A.
select * from customer;
Select customer.email, customer.first_name, customer.last_name from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in( select track_id from track 
				  join genre on track.genre_id = genre.genre_id 
				 where genre.name = 'Rock')
order by email;

--Q2: Let's invite the artists who have written the most rock music in our dataset. 
--Write a query that returns the Artist name and total track count of the top 10 rock bands.

select artist.artist_id, artist.name, count(album.artist_Id) as total_song from track 
join album on track.album_Id = album.album_Id
join artist on album.artist_id = artist.artist_id
join genre on track.genre_id = genre.genre_id
where genre.name = 'Rock'
group by artist.artist_id order by total_song desc limit 10;