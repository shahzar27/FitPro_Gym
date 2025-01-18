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
--Group By --
select * from memberships

select count(member_id),gender
from memberships
group by gender

select
	status,
	count(member_id) as Total_number
from memberships
where age>30
group by status

select
	status,
	count(member_id) as Total_number
from memberships
group by status
having count(member_id)<500

select 
	status,
	count(member_id) as Total_number
from memberships
where status is not null
group by status
having count(member_id)<500

--Get count of different genders in each memberships type
select
	membership_type,
	gender,
	count(*) as cnt_number
from memberships
group by 1,2
having count(*)<200
order by 3 desc


select * from memberships
select * from members

select 
	age
from memberships
order by age desc
limit 1 offset 1
--Retrieve the name, membership_type, and status of members who are Active and Monthly, ordered by status
select 
	name,
	membership_type,
	status
from memberships

--Find the average age of members who have a Quarterly membership type.

select avg(age)
from memberships
where membership_type="Monthly"

--Count the total number of visits made by each member, grouping by member_id.

select * from visits

select
	member_id,
	count(visit_id) as total
from visits
group by 1
order by count(visit_id) desc

---Group By Questions
select * from memberships
select * from members
select * from visits
--1.Find the total number of visits made by each member, grouping by member_id.
select
	member_id,
	count(visit_id) as total_visit
from visits
group by 1
--2.Retrieve the count of members by membership_type (e.g., how many Monthly, Weekly, and Quarterly members there are).
select
	membership_type,
	count(member_id)
from memberships
group by 1
--3.Get the average age of members, grouped by their membership_type.
select 
	membership_type,
	avg(age) as average_age
from memberships
group by 1
--4.Find the total number of visits for each visit_date (group by the visit date).
select
	visit_date,
	count(*)
from visits
group by 1
--5.Retrieve the number of members with each status (Active or Cancelled), grouped by status.
SELECT
    status,
	count(member_id)
FROM memberships
WHERE status IN ('Active', 'Cancelled')
GROUP BY status;
--WHERE, GROUP BY, LIMIT, ORDER BY, and HAVING
--Q.1Retrieve the top 3 members who have made the most visits, 
--only showing name and total_visits, and order by total_visits in descending order.
select * from visits;
select
	member_id,
	count(visit_id) as total_visit
from visits
group by member_id
order by count(visit_id) desc
limit 3

SELECT
    m.name,
    COUNT(v.visit_id) AS total_visits
FROM
    visits v
INNER JOIN
    members m
ON
    v.member_id = m.member_id
GROUP BY
    m.name
ORDER BY
    total_visits DESC
LIMIT 3;
--Q.2Find the number of members with a Monthly membership who are Active,
--grouped by membership_type, and limit the result to the top 2 most recent join dates.
select * from memberships
select
	status,
	membership_type,
	count(member_id)
from
	memberships
where
	status='Active' and membership_type='Monthly'
group by
		1,2
order by max(join_date) desc
limit 2
--Q.3--Get the total number of visits for each member who has more than 2 visits,
--ordered by total_visits, and display only the first 5 members.
select * from visits
select 
	member_id,
	count(visit_id) as total_visit
from
	visits
group by 
	1
Having 
	count(visit_id)>2
order by
	total_visit asc
limit
	5
--Q.4--Retrieve the number of members who have joined in 2023,
--grouped by membership_type, where the total number of members in each group is more than 1.
select * from memberships
select 
	membership_type,
	--join_date,
	count(*) as total_number
from 
	memberships
where 
	 EXTRACT(YEAR FROM join_date) = 2023
group by
	1
having 
	count(*)>1

--Altrnate Solution
select 
	membership_type,
	join_date,
	count(*) as total_number
from 
	memberships
where 
	 EXTRACT(YEAR FROM join_date) = 2023
group by
	1,2
having 
	count(*)>1
--Q.5--Find the average age of members who have Active membership status,
--grouped by membership_type, ordered by membership_type alphabetically,and limit the result to 3.
select * from memberships
select 
 	membership_type,
	avg(age)
from
	memberships
where
	status='Active'
group by
	1
order by
	membership_type asc
limit 
	3




















