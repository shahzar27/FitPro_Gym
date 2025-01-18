-- Setup FitPro Database Schemas
-- Drop tables if they exist
DROP TABLE IF EXISTS visits, memberships, members;

-- Create members table
CREATE TABLE members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Create memberships table
CREATE TABLE memberships (
    member_id INT PRIMARY KEY,
    age INT,
    gender CHAR(1),
    membership_type VARCHAR(20),
    join_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- Create visits table
CREATE TABLE visits (
    visit_id INT PRIMARY KEY,
    member_id INT,
    visit_date DATE,
    check_in_time TIME,
    check_out_time TIME,
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

SELECT 'All table created succussful!';
-- Schemas Creation END


select *
from members;
select name
from members;
select member_id,
       name
from members;
select * from memberships;

select 
	age,
	gender,
	status
from memberships;
select
	count(age)
from memberships;
--- SUM,MAX,MIN,AVG,COUNT
select
	avg(age)
from memberships;
select
	count(*)
from memberships;
--Distinct
select 
	distinct(membership_type)
from memberships;
select * from visits;
select 
	count(distinct(member_id))
from visits;
--Limit
select *
from memberships
limit 5;
--Order By
select *
from memberships
order by age asc;

select *
from memberships
order by 
     gender,
	 age desc;

--Where Condition
select * from memberships
where status='Cancelled'


select * from memberships
where status='Active'

select *
from memberships
where membership_type in ('Weekly','Monthly','Quaterly')

select *
from memberships
where membership_type not in ('Weekly','Monthly','Quaterly')


select *
from memberships
where
	membership_type='Quaterly'
	and age between 20 and 30

select *
from memberships
where
	membership_type in ('Weekly','Monthly','Annually')
	and status='Cancelled'

--Group By --



















