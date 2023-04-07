create table tDepartments(
    adepid number primary key,
    adepname varchar2(20) not null,
    aempid number not null
);
create table tEmployees(
    aempid number primary key,
    aempname varchar2(20) not null,
    aempbod nvarchar2(20) not null,
    aempsex nvarchar2(20) not null,
    aempsal number not null
);
create table tRegions(
    aregid number primary key,
    aregname varchar2(20) not null
);
create table tMessage(
    name varchar2(20) not null,
    salary number not null
);
--5
DECLARE
  CURSOR c_dept IS
    SELECT t.adepid, t.adepname
    FROM tdepartments t
    WHERE t.adepid < 100
    ORDER BY t.adepid;
  
  v_adepid tdepartments.adepid%TYPE;
  v_adepname tdepartments.adepname%TYPE;
  
BEGIN
  OPEN c_dept;
  LOOP
    FETCH c_dept INTO v_adepid, v_adepname;
    EXIT WHEN c_dept%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Department ID: ' || v_adepid || ', Department Name: ' || v_adepname);
  END LOOP;
  CLOSE c_dept;
END;

--6
DECLARE
   v_empid temployees.emp_id%TYPE;                                          
   v_empname temployees.emp_name%TYPE;
BEGIN
    -- lay in4
   SELECT emp_id, emp_name
   INTO v_empid, v_empname
   FROM temployees
   WHERE emp_name = v_aempname;
   
   DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_empid || ' Employee Name: ' || v_empname);
END;

--7a
DECLARE
  v_aempname tEmployees.aempname;
  v_aempsal tEmployees.aempsal := 1500;
  
DECLARE
  v_employee_count NUMBER;
  v_aempsal number := 2000;
  v_aempname varchar2(20);
  BEGIN
  SELECT COUNT(*) 
  INTO v_employee_count
  FROM tEmployees
  WHERE aempsal = v_aempsal;
  
  IF v_employee_count = 1 THEN
    SELECT aempname INTO v_aempname
    FROM tEmployees
    WHERE aempsal = v_aempsal;
        INSERT INTO tMessage VALUES (v_aempname,v_aempsal);
  END IF;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN          
    INSERT INTO tMessage VALUES ('No employee with salary of '|| v_aempsal,v_aempsal);
        --DBMS_OUTPUT.PUT_LINE('No employee with salary of '|| v_aempsal);
    WHEN TOO_MANY_ROWS THEN
    INSERT INTO tMessage VALUES ('More than one employee with a salary of  '|| v_aempsal,v_aempsal);
        --DBMS_OUTPUT.PUT_LINE('More than one employee with a salary of  '|| v_aempsal);
END;
    
--8 a;
CREATE OR REPLACE PROCEDURE sptregions_i(
                    p_regname IN tRegions.aregname%TYPE
)
AS
    v_next_id tRegions.aregid%TYPE;
BEGIN
    -- lay id
    SELECT MAX(aregid) + 1
    INTO v_next_id
    FROM tRegions;
    -- them record
    INSERT INTO tRegions(aregid, aregname)
    VALUES (v_next_id, p_regname);
    DBMS_OUTPUT.PUT_LINE('Record inserted successfully');
END;
--b
DECLARE
    v_regname tRegions.aregname%TYPE := 'Region X';
BEGIN
    sptregions_i(v_regname);
END;


    SELECT aempname INTO v_aempname
    FROM tEmployees
    WHERE aempsal = v_aempsal;
    INSERT INTO tMessage VALUES (v_aempname || ' has a salary of ' || v_aempsal);
  ELSE
    INSERT INTO tMessage VALUES ('More than one employee with a salary of ' || v_aempsal);
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    INSERT INTO tMessage VALUES ('Error occurred: ' || SQLERRM);
END;





DECLARE 
    v_weight Number(3) := 600;
    v_message VARCHAR2(255) := 'Product 10012';
BEGIN
    DECLARE
    v_weight Number(3) := 1; 
    v_message VARCHAR2(255) := 'Product 11001';
    v_new_locn := 'Western' || v_new_locn;
    DBMS_OUTPUT.PUT_LINE(v_weight);
END;
    v_weight := v_weight + 1;
    v_messager := v_message || ' is in stock';
    v_new_locn := 'Western ' || v_new_locn;           
    
END;    
    
    
    
    