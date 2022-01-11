

use Bank;
select *
from account
 where open_date between '2002-01-01' and '2002-12-31';
 
 
 select i.fname,i.lname
 from customer c INNER JOIN individual i ON c.cust_id = i.cust_id 
 where i.lname LIKE '_a%e';
 
 select *
 from individual
 where lname LIKE '_a%e%';
 
SELECT a.account_id, a.cust_id, a.open_date, a.product_cd,a.open_emp_id,e.assigned_branch_id
FROM account a INNER JOIN
(SELECT emp_id, assigned_branch_id
FROM employee
WHERE start_date < '2007-01-01' AND (title = 'Teller' OR title = 'Head Teller')) e 
ON a.open_emp_id = e.emp_id
INNER JOIN
(SELECT branch_id
FROM branch
WHERE name = 'Woburn Branch') b
ON e.assigned_branch_id = b.branch_id;



SELECT e.emp_id, e.assigned_branch_id 
 FROM employee e INNER JOIN ( SELECT branch_id
 FROM branch
 where name = "Woburn Branch") b
 ON e.assigned_branch_id = b.branch_id
 WHERE start_date < '2007-01-01'
 AND (title = 'Teller' OR title = 'Head Teller');



select a.account_id , c.fed_id, p.name
from account a INNER JOIN customer c 
ON a.cust_id = c.cust_id 
INNER JOIN product p ON a.product_cd = p.product_cd
WHERE c.cust_type_cd = 'I';

select e1.emp_id, e1.fname, e1.lname
from employee e1 INNER JOIN employee e2
ON e1.superior_emp_id = e2.emp_id 
WHERE e1.dept_id != e2.dept_id;

select * 
from employee;


SELECT i.fname,i.lname
FROM individual i
union
Select e.fname,e.lname
FROM employee e
order by lname;

select SUBSTRING('Please find the substring in this string',17,9);
select abs(-25.76823),sign(-25.76823) ,round(-25.76823,2);
 Select extract(Month FROM current_date());
 
 
 
 select count(account_id) many , cust_id
 FROM account
 group by cust_id;
 
 
 select count(account_id) many , cust_id
 FROM account
 group by cust_id
 having count(account_id) >= 2;
 
 Select sum(avail_balance),product_cd , open_branch_id, count(*) many
 from account
 group by product_cd,open_branch_id
 having count(*) > 1
 order by 1 DESC;
 
 select count(*) many,a.product_cd, p.name
 from account a INNER JOIN product p 
 ON a.product_cd = p.product_cd
 group by product_cd;
 
 select *
 from account;
 
 
 Select account_id,product_cd,cust_id,avail_balance
 from account
 where open_emp_id <> ( select e.emp_id
 from employee e INNER JOIN branch b ON e.assigned_branch_id = b.branch_id
 where  e.title = 'HEAD Teller' AnD b.city = 'Woburn');
 
 
select emp_id,fname, lname, title
from employee
where emp_id IN ( select emp_id from employee where title = 'President');



select superior_emp_id, title
from employee
where superior_emp_id IS NOT NULL;


-- --Chappter 9--  

select account_id, product_cd , cust_id, avail_balance
from account
where product_cd IN ( Select product_cd
from product
where product_type_cd = 'LOAN');

--  Select product_cd
-- from product
-- where product_type_cd = 'LOAN'

select a.account_id, a.product_cd , a.cust_id, a.avail_balance
from account a
where EXISTS ( Select 1
from product p
where a.product_cd = p.product_cd AND product_type_cd = 'LOAN');


-- select *
-- from employee
--  AUT, BUS,MRT,SBL


-- SELECT 'trainee' name, '2004-01-01' start_dt, '2005-12-31' end_dt 
-- UNION ALL
-- SELECT 'worker' name, '2002-01-01' start_dt, '2003-12-31' end_dt 
-- UNION ALL
-- SELECT 'mentor' name, '2000-01-01' start_dt, '2001-12-31' end_dt


select levels.name , el.emp_id, el.fname, el.lname
from employee el  INNER JOIN
(SELECT 'trainee' name, '2004-01-01' start_dt, '2005-12-31' end_dt UNION ALL
SELECT 'worker' name, '2002-01-01' start_dt, '2003-12-31' end_dt UNION ALL
SELECT 'mentor' name, '2000-01-01' start_dt, '2001-12-31' end_dt ) levels
ON el.start_date between levels.start_dt AND levels.end_dt;


select e.emp_id, e.fname,e.lname,( select d.name
from department d 
where d.dept_id = e.dept_id) department_name
,( select b.name
from branch b
where b.branch_id = e.assigned_branch_id) branch_name
from employee e;


 -- chapter 10
 
select *
from product_type,product;


select a.cust_id, a.avail_balance , levels.name
FROM account a INNER JOIN 
(  SELECT 'Small Fry' name, 0 low_limit, 4999.99 high_limit 
 UNION ALL
 SELECT 'Average Joes' name, 5000 low_limit, 9999.99 high_limit
 UNION ALL
 SELECT 'Heavy Hitters' name, 10000 low_limit, 9999999.99 high_limit ) levels
 ON a.avail_balance between levels.low_limit AND levels.high_limit;
 
 
SELECT DATE_ADD('2021-01-01', interval(ones.num + tens.num + hundreds.num ) DAY ) dt
FROM
(SELECT 0 num 
UNION ALL 
SELECT 1 num 
UNION ALL 
SELECT 2 num 
UNION ALL 
SELECT 3 num 
UNION ALL 
SELECT 4 num 
UNION ALL 
SELECT 5 num 
UNION ALL 
SELECT 6 num 
UNION ALL 
SELECT 7 num 
UNION ALL 
SELECT 8 num 
UNION ALL 
SELECT 9 num) ones 
CROSS JOIN
(SELECT 0 num UNION ALL SELECT 10 num UNION ALL SELECT 20 num UNION ALL SELECT 30 num UNION ALL SELECT 40 num UNION ALL SELECT 50 num UNION ALL SELECT 60 num UNION ALL SELECT 70 num UNION ALL SELECT 80 num UNION ALL SELECT 90 num) tens
CROSS JOIN
(SELECT 0 num UNION ALL SELECT 100 num UNION ALL SELECT 200 num UNION ALL SELECT 300 num) hundreds;


-- 10.1
select p.name, a.account_id
from product p left outer join account a
ON p.product_cd = a.product_cd;


select account.account_id, account.product_cd, individual.fname, individual.lname, business.name
from account left outer join individual
ON account.cust_id = individual.cust_id
left outer join business
on account.cust_id = business.cust_id;

select ones.num + tens.num + 1
FROM
(SELECT 0 num 
UNION ALL 
SELECT 1 num 
UNION ALL 
SELECT 2 num 
UNION ALL 
SELECT 3 num 
UNION ALL 
SELECT 4 num 
UNION ALL 
SELECT 5 num 
UNION ALL 
SELECT 6 num 
UNION ALL 
SELECT 7 num 
UNION ALL 
SELECT 8 num 
UNION ALL 
SELECT 9 num) ones 
CROSS JOIN
(SELECT 0 num UNION ALL SELECT 10 num UNION ALL SELECT 20 num UNION ALL SELECT 30 num UNION ALL SELECT 40 num UNION ALL SELECT 50 num UNION ALL SELECT 60 num UNION ALL SELECT 70 num UNION ALL SELECT 80 num UNION ALL SELECT 90 num) tens
ORDER BY 1;

-- 11-1
SELECT emp_id;
-- 11-2 
select sum(case 
			WHEN open_branch_id = 1 THEN 1
            Else 0
            END) branch_1,
            sum(case 
			WHEN open_branch_id = 2 THEN 1
            Else 0
            END) branch_2,
            sum(case 
			WHEN open_branch_id = 3 THEN 1
            Else 0
            END) branch_3,
            sum(case 
			WHEN open_branch_id = 4 THEN 1
            Else 0
            END) branch_4
            
FROM account
