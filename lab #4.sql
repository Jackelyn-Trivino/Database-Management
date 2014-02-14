-- Question 1--
select city
from agents 
where aid in (select aid
	      from Orders
	      where cid in (select cid 
		      from Customers
		      where name = 'Basics'))
		      


--Question 2--
select p.pid, o.ordno
from customers c, orders o, agents a, products p
where p.pid = o.pid
  and a.aid = o.aid
  and c.cid = o.cid
  and c.city = 'Kyoto'
  
--Question 3--
select c.cid, c.name, o.aid
from customers c, orders o, agents a
where a.aid = o.aid
  and c.cid = o.cid
  and o.aid != 'a03'

--Question 4--
select c.cid, c.name
from customers c, orders o, products p
where p.pid = o.pid
  and c.cid = o.cid
  and p.pid = 'p01' 
  and p.pid = 'p07'

--Question 5--
select p.pid
from agents a, orders o, products p
where p.pid = o.pid
  and a.aid = o.aid
  and a.aid = 'a03'

--Question 6--
select c.name, c.discount
from customers c, agents a, orders o
where c.cid = o.cid
  and a.aid = o.aid
  and a.city = 'Dallas'
  or a.city = 'Duluth'

--Question 7--
select c.name
from customers c
where c.city = 'Dallas'
  or c.city = 'Kyoto'
  and c.discount = 12.00
  and c.discount = 8.00
  and c.discount = 0.00


