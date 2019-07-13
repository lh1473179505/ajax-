create database manager_employee;
use manager_employee;
create table department(
	deptId varchar(15) primary key,
	name varchar(20) not null
);
insert into department values('1','java');
insert into department values('2','javaweb');
insert into department values('3','javaee');
insert into department values('4','javascript');
create table employee(
	empId varchar(15) primary key,
	name varchar(15) not null,
	hireDate date,
	salary int,
	dept_id varchar(15),
	constraint foreign key(dept_id) references department(deptId)
);

insert into employee values('1001','xiaobai',now(),2500,'1');
insert into employee values('1002','xiaohei',now(),2500,'2');
insert into employee values('1003','xiaohuang',now(),2500,'3');
insert into employee values('1004','xiaolv',now(),2500,'4');
insert into employee values('1005','xiaohong',now(),2500,'3');
insert into employee values('1006','xiaohui',now(),2500,'1');
insert into employee values('1007','xiaoqing',now(),2500,'2');
insert into employee values('1008','xiaolan',now(),2500,'3');