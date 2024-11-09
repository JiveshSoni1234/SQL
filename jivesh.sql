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
//Dual: Its a inbuilt table consiting of single column which is used by oracle
//Sysdate: Current date stored in a built system variable called sysdate

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



Select sysdate, to_char(sysdate,'d mm yyth yyyysp mi hh dd dy day mon month hh24 ss w' ) from dual;
Select sysdate, to_char(sysdate,'dd mm yy yyyy d dy day mi ss hh hh24 syear' ) from dual;

Select 4*4+9 from dual;
Select log(10,10) from dual;
Select power (3,2) from dual;
Select abs(-5) from dual;

Alter session set NLS_date_format='ddsp month yyyysp';

------------------------------------------------------------------Date Functions:

1) Add_Months: add months before and after

Select add_months(sysdate,15) from dual;
select add_months(sysdate,-15) from dual;


2) Months_Between : return differnce between two dates in a month ex: retirement of a job

select sysdate-to_date('09-02-2002') from dual;

select months_between(sysdate,to_date('09-02-2002')) from dual;

select 65-months_between(sysdate,to_date('09-02-2002'))/12 from dual;


3)last_day: return the date lastday of month

select last_day(sysdate) from dual;
select last_day(to_date('01-02-1984')) - to_date('26-02-1984') from dual;



4) next_day: return date 
select next_day(sysdate,'wed') from dual;


------------------------------------------aggregate function
1) max
2) min
3) sum
4) avg 
5) count
6) round

Select round(avg(sal),90) from emp; 

---------------Relational operator(*)

// they are not allowed on null values to check null we use is null or is not null

select * from emp where comm is null;

select * from emp where comm is not null;

Select count(*) , count (comm) from emp; 

// * count all records where as count(comm) doesnot count null values.
select * from emp;

--------------------------------------------------------String function

1) length : used to find the lenght of string

Select length(ename), ename from emp;

create table temp(
Name varchar(10),
Name1 char(10));


insert into temp values('&name' , '&name1');
a	a         
ab	ab        
abc	abc       
bacde	bacde     
bbaaccad	bbaaccad  

Select * from temp;

Select length(name), name ,length(name1), name1 from temp; 


2) INITCAP: first letter capital

select initcap(ename) from emp;
select initcap('toady is tuesday') from dual;


3) lower/upper

select upper(ename) from emp

4) LTRIM/ RTRIM: 

select name, ltrim(name, 'ab') from temp;       // remove all possible function of ab
select name1, ltrim(name1, 'ab') from temp;  

select sal, ename, rtrim(sal, 0) from emp;

select name1, rtrim(name1, '') from temp;  


5) Padding: add some extra character

select sal, lpad(sal, 10, '*') from emp;
select sal, rpad(sal, 10, '*') from emp;

select sal, lpad(sal, 10, '*') , rpad(lpad(sal,10, '*'),20,'*')from emp;

6) Decode:

select ename , job, sal , decode (job, 'clerk', 1, 'Salesman', 2, 3) as grade from emp;

select * from emp;


7) INSTR : used to find the occurence of specified alphabet in the string
           first serve first basis
           
select ename, INSTR(ename, 'a') from emp;

select ename, INSTR(ename, 'a') from emp where  INSTR(ename, 'a') <> 0;

select ename, INSTR(ename, 'A' ,3) from emp 

---------------------------------------------------------------SEQUENCE :


// consist 4 component : start with , increment by , max value/ min value, cycle/no cycle
// cycle : once sequence reaches the max value it start from starting


create sequence rohit
 start with 1
 increment by 1
 maxvalue 10
nocycle;

select rohit.nextval from dual;

Drop sequence rohit;


// pipe symbol : || used to concatenate 

select ename || ' ' || 'soni' from emp

insert into suppl values('s' || rohit.nextval, '&sname', '&status', '&city');


select * from suppl


// Information about the sequence is in an inbuilt data called user_sequences;
Select * from user_sequences;


create sequence jivesh; // it assumes deafult values


create sequence yatin
 start with 5
 cycle
 maxvalue 15
 minvalue 4
 cache 2; // specification of cache is important in case of cycle

select yatin.nextval from dual;
