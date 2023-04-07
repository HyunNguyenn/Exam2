create table Employee(
    EMPLOYEE_ID NUMBER(6,0) NOT NULL,
    FIRST_NAME VARCHAR2(20 BYTE),
    LAST_NAME VARCHAR2(25 BYTE) NOT NULL,
    EMAIL VARCHAR2(25 BYTE) NOT NULL,
    PHONE_NUMBER VARCHAR2(20 BYTE),
    HIRE_DATE DATE NOT NULL,
    JOB_ID VARCHAR2(10 BYTE) NOT NULL,
    SALARY NUMBER(8,2),
    COMMISSION_PCT NUMBER(2,2),
    MANAGER_ID NUMBER(6,0),
    DEPARTMENT_ID NUMBER(4,0)
);
CREATE TABLE Department(
    DEPARTMENT_ID NUMBER(4,0) NOT NULL,
    DEPARTMENT_NAME VARCHAR2(30 BYTE) NOT NULL,
    MANAGER_ID NUMBER(6,0),
    LOCATION_ID NUMBER(4,0)
);
CREATE TABLE Job_Grades(
    GRADE CHAR(1 BYTE) NOT NULL,
    LOWEST_SAL NUMBER(8,2) NOT NULL,
    HIGHEST_SAL NUMBER(8,2) NOT NULL
);
CREATE TABLE Dept(
    ID NUMBER(7,0) NOT NULL,
    NAME VARCHAR2(25 BYTE) NOT NULL,
    CONSTRAINT PK_DEPT
        PRIMARY KEY (ID)
);
CREATE TABLE Emp(
    ID NUMBER(7,0) NOT NULL,
    LAST_NAME VARCHAR2(25 BYTE) NOT NULL, 
    FIRST_NAME  VARCHAR2 (25 BYTE) NOT NULL,
    CONSTRAINT FK_EMP
        FOREIGN KEY (ID) REFERENCES DEPT(ID)
);
ALTER TABLE Emp
  ADD Email VARCHAR2(45 BYTE);
  
CREATE TABLE Emp2(
    ID NUMBER(6,0) NOT NULL,
    FIRST_NAME VARCHAR2(20 BYTE),
    LAST_NAME VARCHAR2(25 BYTE) NOT NULL,
    SALARY NUMBER(8,2),
    DEPT_ID NUMBER(7,0) NOT NULL
);  
DROP TABLE EMP
insert into job_grades values( 'A',1000,2999);
insert into job_grades values( 'B',3000,5999);
insert into job_grades values( 'C',6000,9999);
insert into job_grades values( 'D',10000,14999);
insert into job_grades values( 'E',15000,24999);
insert into job_grades values( 'F',25000,40000);

insert into Employee values( 100,'Steven','King','SKING','515.123.4567',to_date('17/06/1987','dd/mm/yyyy'),'AD_PRES',24000,null,null,90);
insert into Employee values( 101,'Neena','Kochhar','NKOCHHAR','515.123.4568',to_date('21/09/1989','dd/mm/yyyy'),'AD_VP',17000,null,100,90);
insert into Employee values( 102,'Lex','De Haan','LDEHAAN','515.123.4569',to_date('13/01/1993','dd/mm/yyyy'),'AD_VP',17000,null,100,90);
insert into Employee values( 103,'Alexander','Hunold','AHUNOLD','590.423.4567',to_date('3/01/1990','dd/mm/yyyy'),'IT_PROG',9000,null,102,60);
insert into Employee values( 104,'Bruce','Ernst','BERNST','590.423.4568',to_date('21/05/1991','dd/mm/yyyy'),'IT_PROG',6000,null,103,60);
insert into Employee values( 107,'Diana','Lorentz','DLORENTZ','590.423.5567',to_date('7/02/1999','dd/mm/yyyy'),'IT_PROG',4200,null,103,60);
insert into Employee values( 124,'Kevin','Mourgos','KMOURGOS','650.123.5234',to_date('16/11/1999','dd/mm/yyyy'),'ST_MAN',5800,null,100,50);
insert into Employee values( 141,'Trenna','Rajs','TRAJS','650.121.8009',to_date('17/10/1995','dd/mm/yyyy'),'ST_CLERK',3500,null,124,50);
insert into Employee values( 142,'Curtis','Davies','CDAVIES','650.121.2994',to_date('29/01/1997','dd/mm/yyyy'),'ST_CLERK',3100,null,124,50);
insert into Employee values( 143,'Randall','Matos','RMATOS','650.121.2874',to_date('15/03/1998','dd/mm/yyyy'),'ST_CLERK',2600,null,124,50);
insert into Employee values( 144,'Peter','Vargas','PVARGAS','650.121.2004',to_date('9/07/1998','dd/mm/yyyy'),'ST_CLERK',2500,null,124,50);
insert into Employee values( 149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018',to_date('29/01/2000','dd/mm/yyyy'),'SA_MAN',10500,0.2,100,80);
insert into Employee values( 174,'Ellen','Abel','EABEL','011.44.1644.429267',to_date('11/05/1996','dd/mm/yyyy'),'SA_REP',11000,0.3,149,80);
insert into Employee values( 176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265',to_date('24/03/1998','dd/mm/yyyy'),'SA_REP',8600,0.2,149,80);
insert into Employee values( 178,'Kimberely','Grant','KGRANT','011.44.1644.429263',to_date('24/05/1999','dd/mm/yyyy'),'SA_REP',7000,0.15,149,null);
insert into Employee values( 200,'Jennifer','Whalen','JWHALEN','515.123.4444',to_date('17/09/1987','dd/mm/yyyy'),'AD_ASST',4400,null,101,10);
insert into Employee values( 201,'Michael','Hartstein','MHARTSTE','515.123.5555',to_date('17/02/1996','dd/mm/yyyy'),'MK_MAN',13000,null,100,20);
insert into Employee values( 202,'Pat','Fay','PFAY','603.123.6666',to_date('17/08/1997','dd/mm/yyyy'),'MK_REP',6000,null,201,20);
insert into Employee values( 205,'Shelley','Higgins','SHIGGINS','515.123.8080',to_date('7/06/1994','dd/mm/yyyy'),'AC_MGR',12000,null,101,110);
insert into Employee values( 206,'William','Gietz','WGIETZ','515.123.8181',to_date('7/06/1994','dd/mm/yyyy'),'AC_ACCOUNT',8300,null,205,110);
insert into Employee values( 207,'TEST','TEST','TEST','084.123.4567',to_date('17/06/2018','dd/mm/yyyy'),'IT_PROG',24000,null,null,60);

insert into Department values( 10,'Administration',200,1700);
insert into Department values( 20,'Marketing',201,1800);
insert into Department values( 50,'Shipping',124,1500);
insert into Department values( 60,'IT',103,1400);
insert into Department values( 80,'Sales',149,2500);
insert into Department values( 90,'Executive',100,1700);
insert into Department values( 110,'Accounting',205,1700);
insert into Department values( 190,'Contracting',null,1700);

UPDATE employee
SET last_name = 'FPTS'
WHERE employee_id = 207;

create table Emp3(
    EMPLOYEE_ID NUMBER(6,0) NOT NULL,
    FIRST_NAME VARCHAR2(20 BYTE),
    LAST_NAME VARCHAR2(25 BYTE) NOT NULL,
    EMAIL VARCHAR2(25 BYTE) NOT NULL,
    PHONE_NUMBER VARCHAR2(20 BYTE),
    HIRE_DATE DATE NOT NULL,
    JOB_ID VARCHAR2(10 BYTE) NOT NULL,
    SALARY NUMBER(8,2),
    COMMISSION_PCT NUMBER(2,2),
    MANAGER_ID NUMBER(6,0),
    DEPARTMENT_ID NUMBER(4,0)
);

CREATE TABLE NEW_Department(
    DEPT_ID NUMBER(4,0) NOT NULL,
    DEPT_NAME VARCHAR2(30 BYTE) NOT NULL,
    MAN_ID NUMBER(6,0),
    LOC_ID NUMBER(4,0)
);

select a.department_id, a.department_name
from department a where a.department_name like 'A%'
order by 2
union
select a.department_id, a.department_name
from department a where a.department_name = 'IT'
union
select a.department_id, a.department_name
from department a where a.department_name = 'Sales'

select 1, astock ,aqty from Customer where acustaccount='058c000001'
union all
select 2, 'Total' astock, sum(aqty) aqty from Customer where acustaccount='058c000001'


