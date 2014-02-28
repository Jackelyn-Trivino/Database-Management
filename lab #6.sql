--Jackie Trivino-- 

--Question 1--
select distinct c.name, c.city
from customers c, orders o, products p  
where p.quantity = 221400
       and p.city = c.city
       and p.pid = o.pid
       and o.cid = c.cid
group by c.name, c.city;  

--Question 2--
select c.name, c.city
from customers c
where c.city in(
	select p.city
	from products p
	group by p.city
	order by count(p.city) asc
	limit 2
)

--Question 3--
select * 
from products p 
where p.priceUSD > (select avg(priceUSD)
		    from products p);
		    
--Question 4-- 
select c.name, o.pid, o.dollars
from customers c, orders o
where c.cid = o.cid
order by o.dollars desc

--Question 5--
select c.name, coalesce(sum(o.dollars), 0.00)
from orders o
left outer join customers c on c.cid = o.cid
group by c.name	
order by c.name

--Question 6--
select c.name, p.name, a.name
from agents a, customers c, orders o, products p
where a.aid = o.aid 
  and c.cid = o.cid 
  and p.pid = o.pid
  and a.city = 'New York'

--Question 7--
select o.pid, o.qty * p.priceusd, o.dollars
from orders o, products p
where o.pid = p.pid 


