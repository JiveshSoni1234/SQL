----If you forgot the password then 
----- i) sqlplus / as sysdba
----- ii)  select name from v$database;
------iii) alter user sys identified by "Jj00@1014635@";



//Create the suppl table

Create table suppl (
supno varchar(4) primary key,
sname varchar(20) not null,
status number(4) check(status<50),
city varchar(20)
);

-------------insert value in suppl table----------------------------------------------------
insert into suppl values('s1' , 'ram' ,20, 'kolkata');
insert into suppl values('s2' , 'sham' ,30, 'kolkata');
insert into suppl values('s3' , 'amit' ,40, 'mumbai');


-----------------for view suppl table------------------------
Select * from suppl;



//PTS Table

Create table pts (
partno varchar(4) primary key,
pname varchar(20) not null,
color varchar(20) check(color='red'or color='blue' or color='green'),
wt number(5),
city varchar(20)
);

---------insert 
insert into pts values('p1' , 'nutt' ,'red',123, 'mumbai');
insert into pts values('p2' , 'bolt' ,'green',17, 'kolkata');
insert into pts values('p3' , 'screw' ,'blue',12, 'goa');


//Employee table

Create table emp(
empno varchar(10) primary key,
ename varchar(20)not null,
job varchar(20)not null,
mgr varchar(20)not null,
hiredate date not null,
sal number (20) not null,
comm varchar (20) ,
depno number (10)
);

insert into emp values('7369','smith','clerk','7902','17-12-80','800','',20);

//insert value with the help of this 
insert into emp values('&empno','&ename','&job','&mgr','&hiredate','&sal','&comm','&deptno');

select * from emp;

// shpts table

create table shpts(
supno varchar (10),
partno varchar (10),
qty number(2),
constraint xyz foreign key (supno) references suppl(supno),
constraint xyz1 foreign key (partno) references pts(partno),
constraint xyz2  primary key (partno,supno)
);

drop table shpts;

insert into shpts values('s1','p1',10);
insert into shpts values('s2','p2',20);
insert into shpts values('s3','p3',30);
insert into shpts values('s1','p2',40);

select * from shpts;

commit;



Ques 1) display name,job, salry of all employee working either as clerk or salesman or managers

Ans: 
Select ename, job, sal from emp where job='clerk' OR job='Manager' OR job='Salesman'

Select ename, job, sal from emp where job in ('clerk','Manager' );


Quest 2: display name,job, salry of all employee getting salary above than 2450 and less than 5000
Ans Select ename, job, sal from emp where sal>=2450 And sal<=5000;

Select ename, job, sal from emp where sal between 2450 And 5000;

-----------------------------------------Like operators
Ques 3: Display the name of emp 
i) whose name start with A
Ans: Select ename from emp where ename like 'A%';


ii) whose name end with A
Select ename from emp where ename like '%n';


iii) whose name start with M and has r as a 3rd Character
Select ename from emp where ename like 'M_r%';

iv) whose contain alphabet T
Select ename from emp where ename like '%t%';

v)  whose name contains fourth letter as L
Select ename from emp where ename like '___e%';


vi)  whose name donot contains fourth letter as L
Select ename from emp where ename not like '___e%';


--------------------------------------current date
Select  sysdate from dual;

Select  sysdate ,to_char (sysdate,'dd') from dual;
Select  sysdate ,to_char (sysdate,'mm') from dual;
Select  sysdate ,to_char (sysdate,'yy') from dual;
Select  sysdate ,to_char (sysdate,'yyyy') from dual;

//give no. correespond to day of week  (s--0, s--6)
Select  sysdate ,to_char (sysdate,'d') from dual;
//day of week in abbreviate form
Select  sysdate ,to_char (sysdate,'dy') from dual;

Select  sysdate ,to_char (sysdate,'day') from dual;

Select  sysdate ,to_char (sysdate,'Mon') from dual;

Select  sysdate ,to_char (sysdate,'Month') from dual;

Select  sysdate ,to_char (sysdate,'hh') from dual;
Select  sysdate ,to_char (sysdate,'hh24') from dual;

Select  sysdate ,to_char (sysdate,'mi') from dual;
Select  sysdate ,to_char (sysdate,'ss') from dual;

--quarter of year
Select  sysdate ,to_char (sysdate,'q') from dual;


Select  sysdate ,to_char (sysdate,'w') from dual;
----give week of year
Select  sysdate ,to_char (sysdate,'ww') from dual;

-----------how many days will passed
Select  sysdate ,to_char (sysdate,'ddd') from dual;

Select  sysdate ,to_char (sysdate,'ddsp') from dual;
Select  sysdate ,to_char (sysdate,'ddth') from dual;

Select  sysdate ,to_char (sysdate,'syear') from dual;

