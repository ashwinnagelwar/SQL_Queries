create table employee( employee_id INT primary key auto_increment, name varchar(255),address varchar(255), age INT, salary INT); 

-- one to one mapping--
-- one employee one department
create table department( 
department_id INT primary key auto_increment,
 dept_name varchar(255), 
 employee_id INT unique, -- foreign key as unique for one to one mapping
 foreign key(employee_id) references employee(employee_id)-- this way is to define foregn key
 );
 
 -- one to many mapping
 -- one employee many department
 create table department(
 department_id INT primary key auto_increment,
 dept_name varchar(255),
 employee_id INT, -- foregin key not unique to provide one employee have many department for one to many mapping
 foreign key(employee_id) references employee(employee_id)
 );
 
 -- many to one
 -- many employee one department
 
 create table employee(
 employee_id INT primary key auto_increment,
 emp_name varchar(255),
 address varchar(255),
 age INT, 
 salary INT,
 department_id INT,
 foreign key(department_id) references department(department_id)
 );
 
 -- many to many mapping
 -- many employee many department
 
 create table employee(
 employee_id INT primary key auto_increment,
 emp_name varchar(255),
 address varchar(255),
 age INT, 
 salary INT,
 department_id INT
 );
 
 create table department(
 department_id INT primary key auto_increment,
  dept_name varchar(255),
 employee_id INT
 );
 
 -- making many to many mapping as follows
 create table employee_department(
 department_id INT,
 employee_id INT,
 primary key(department_id,employee_id),
 foreign key(department_id) references department(department_id),
 foreign key(employee_id) references employee(employee_id)
 );
 
 
 -- count total employee from each department
 SELECT d.dept_name AS department_name, COUNT(e.employee_id) AS employee_count
FROM employee e
INNER JOIN department d
ON e.employee_id = d.employee_id -- joins works on primary key of one table and foreign key of another table
GROUP BY d.dept_name; -- as we want to get count by department name we need to group it by department name

select * from employee;
insert into employee values(1,"Ashwin","Nagpur",32,1200);
insert into employee values(2,"Rahul","Chandrapur",33,2300);
insert into employee values(3,"Raj","Nagpur",32,4500);
insert into employee values(4,"Vishal","Pune",27,900);
insert into employee values(5,"Rajni","Pune",32,1900);
insert into employee values(6,"Nikhil","Nagpur",32,2300);

-- find nth highest salary--
select distinct salary from employee e1 where 3=(select count(distinct salary) from employee e2 where e2.salary>=e1.salary);

select distinct salary from employee order by salary desc limit 2,1;

-- find count of employee from  each address which have salary >300

-- using where cluas 
SELECT address, COUNT(employee_id) 
FROM employee e
WHERE salary >= 300
GROUP BY address;

-- using having claus
SELECT address, COUNT(employee_id) 
FROM employee e
GROUP BY address
HAVING SUM(salary) >= 300;

-- find max salary from each city
select max(salary), address
from employee
group by address;

-- defining composit primary key
create table student_address(
stud_id int,
add_id int,
stud_name varchar(255),
add_city varchar(255),
primary key(stud_id,add_id)
);

select * from student_address;
-- find 3rd highest salary from each dept
create table dept(
dpt_id int primary key auto_increment,
dpt_name varchar(255),
salary int);

insert into dept values(1,"HR",1200);
insert into dept values(2,"IT",2300);
insert into dept values(3,"HR",4500);
insert into dept values(4,"IT",900);
insert into dept values(5,"Account",1900);
insert into dept values(6,"Account",2300);

select distinct(salary), dpt_name from dept d1 where 2=(
select count(distinct salary) from dept d2 where d2.salary >= d1.salary and d2.dpt_name=d1.dpt_name);


