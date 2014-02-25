--Questions 1--
select a.city 
from agents a 
inner join orders o on a.aid= o.aid
inner join customers c on o.cid = c.cid
where c.name = 'Basics'

--Question 2--
select distinct o1.pid 
from Orders o
inner join customers c on c.cid = o.cid 
                       and c.city = 'Kyoto'
inner join orders o1 on o1.aid = o.aid
where o.ordno is not null
order by o1.pid;

--Question 3--
select name 
from Customers
where not cid in(select cid 
		 from Orders);

--Question 4--
select name 
from Customers c
left outer join Orders o on c.cid = o.cid
where o.cid is null;

--Question 5--
select c.name, a.name 
from Customers c, Agents a, Orders o
where c.city = a.city 
  and o.aid = a.aid 
  and o.cid = c.cid;

--Question 6--
select distinct c.name, a.name 
from Customers c, Agents a, Orders o
where c.city = a.city;

--Question 7--
select c.name, c.city 
from Customers c
where c.city in (select city 
                 from Products
                 group by city
                 limit 1);
                