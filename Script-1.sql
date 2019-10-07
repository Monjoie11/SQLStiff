create sequence employee_id_seq1 start 55;

insert into employee (employeeid, firstname, lastname) values((select nextval('employee_id_seq1')), 'Nick', 'p');

drop trigger employee_insert;

create or replace 
function insert_into_employee()
returns trigger as $$
begin
	if(TG_OP = 'INSERT')then
	new.employeeid = (select nextval('employee_id_seq'));
	end if;
    return new;
   end;
$$ language plpgsql;

create trigger employee_insert
before insert on employee
for each row 
execute procedure insert_into_employee();

Insert into employee (employeeid, firstname, lastname) values(-5, 'Trevin', 'C');

select * from album where artistid = 1;

select name, albumid from track where albumid = 1 or albumid = 4;

select artistid from artist where name = 'AC/DC';

select * from album
where artistid = 
(select artistid from artist where name = 'AC/DC');


select * from track
where albumid in (select albumid from album
where artistid =
(select artistid from artist where name = 'AC/DC'));



select * from track
where albumid not in 
(select albumid from album
where artistid =
(select artistid from artist where name = 'AC/DC'));


selct name from track where trackidin ( select trackid from playlisttrack where)


create view acdc_songs as select * from track
where albumid in (select albumid from album
where artistid =
(select artistid from artist where name = 'AC/DC'));


----------------------------------------------------------------------------------

--2.1

select * from employee;

select * from employee 
where lastname = 'King';

select * from employee
where firstname like 'Andrew' 
and reportsto = null;


select * from employee
where firstname like 'Andrew';
where reportsto is null;

--2.2

select * from album
order by title desc;

select firstname from customer
order by city asc;

--2.3

insert into genre values(1007, 'Freaky Disco'), (10044, 'Country sucks');

insert into employee values(10, 'jerry', 'springer', 'comic relief'), (11, 'whodat', 'drop table', 'mystery shopper') ;

insert into employee values(100, 'jerry', 'springer'), (101, 'whodat', 'drop table') ;

--2.4


UPDATE customer
SET firstname = 'Robert', lastname = 'Walter'
WHERE firstname = 'Aaron'
and lastname = 'Mitchell' ;

update artist
set name = 'CCR'
where name like 'Creedence Clearwater Revival'

--2.5

select * from invoice
where billingaddress like 'T%';

--2.6

select * from invoice
where total  
between 15 and 50


select * from employee
where hiredate 
between '2003-06-01' and '2004-03-01';

--2.7

delete from invoiceline 
where invoiceid 
in (50, 61, 116, 245, 268, 290, 342);

delete from invoice 
where customerid = 32;

delete from customer 
where firstname = 'Robert' and lastname = 'Walter';

--3.1

select now();

select length(name) from mediatype where mediatypeid = 3 ;

--3.2

select avg(total) from invoice;

select max(unitprice) from track;

--6.0

This is not 6.0 thi me trying to figure out triggers from your gitbub

Create an after insert trigger on the employee table fired after a new record isinserted into the table

create or replace 
	function insert_into_employee()
	returns trigger as $$
	begin
		if(TG_OP = 'INSERT') then
			new.employeeid = (select nextval('employee_id_seq'));
		end if;
		return new;
	end;
$$ language plpgsql;

create trigger employee_insert
	before insert on employee
	for each row
	execute procedure insert_into_employee();

insert into employee(employeeid, firstname, lastname) values(-1, 'Alex', 'R');


--7.1


SELECT customer.firstname, customer.lastname, invoice.invoiceid
FROM customer
Inner JOIN invoice
  ON customer.customerid = invoice.customerid;

 --7.2
 

 
 select customer.customerid, customer.firstname, customer.lastname, invoice.invoiceid, invoice.total
 from customer
 full join invoice
 on customer.customerid = invoice.customerid
 
 --7.3
 
  
  select artist.name, album.title
  from artist
  right join album
  on artist.artistid = album.artistid;
 
 
 --7.4
 
 
 
 select * 
 from artist
 cross join album
 order by artist."name";

--7.5

 Perform a self-join on the employee table, joining on the reportsto column.
 
 select *
 from employee 
 inner join employee.reportsto on employee.reportsto;
 
 
 
 
 
 











