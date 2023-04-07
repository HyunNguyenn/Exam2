CREATE OR REPLACE PROCEDURE insertEmp(
  p_empid IN NUMBER,
  p_fname IN VARCHAR2,
  p_lname IN VARCHAR2,
  p_email IN VARCHAR2,
  p_phone IN CHAR,
  p_hiredate IN DATE,
  p_jobid IN NUMBER,
  p_salary IN NUMBER,
  p_commiss IN NUMBER,
  p_managerid IN NUMBER,
  p_department IN NUMBER,
  p_result OUT VARCHAR2
)
IS
BEGIN
  INSERT INTO employee(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary,commission_pct, manager_id, department_id)
  VALUES (p_empid, p_fname, p_lname, p_email, p_phone, p_hiredate, p_jobid, p_salary, p_commiss, p_managerid, p_department);
  p_result := 'Insert successful.';
EXCEPTION
  WHEN OTHERS THEN
    p_result := 'Insert failed: ' || SQLERRM;
END;

SELECT
    get_dept_employees(90)
FROM
    dual;
    
CREATE OR REPLACE FUNCTION get_dept_employees(d_deptid  IN NUMBER)
RETURN VARCHAR2 AS e_employee_f employee.first_name%TYPE
                    e_employee_l employee.last_name%TYPE
  
BEGIN
    SELECT e.last_name, e.first_name
    INTO e_Last_Name,e_First_Name
    FROM employees e INNER JOIN department d ON e.department_id = d.department_id
    WHERE d.department_id = d_deptid;
    Exception
     When No_Data_Found Then
     e_First_Name:= Null;
     e_Last_Name:= Null;
END;
  Return e_First_Name,e_Last_Name;
End;

CREATE OR REPLACE FUNCTION get_job_title(p_emp_id IN NUMBER)
RETURN VARCHAR2
IS
  v_job_title VARCHAR2(50);
  v_grade CHAR(1);
  v_hire_date DATE;
BEGIN
  -- get employee's job title and grade
  SELECT job_title, grade, hire_date
  INTO v_job_title, v_grade, v_hire_date
  FROM employee INNER JOIN 
  WHERE employee_id = p_emp_id;

  -- calculate number of months worked
  DECLARE
    v_months_worked NUMBER := MONTHS_BETWEEN(SYSDATE, v_hire_date);
  BEGIN
    -- check if employee has worked for at least 5 years
    IF v_months_worked >= 60 THEN
      -- determine new job title based on grade and months worked
      CASE v_grade
        WHEN 'A' THEN
          IF v_months_worked >= 18 THEN
            v_job_title := 'TeamLeader';
          END IF;
        WHEN 'B' THEN
          IF v_months_worked >= 18 THEN
            v_job_title := 'TeamLeader';
          END IF;
        WHEN 'C' THEN
          IF v_months_worked >= 36 THEN
            v_job_title := 'Manager';
          END IF;
        WHEN 'D' THEN
          IF v_months_worked >= 48 THEN
            v_job_title := 'Director';
          END IF;
        WHEN 'E' THEN
          IF v_months_worked >= 120 THEN
            v_job_title := 'Director';
          END IF;
        ELSE
          v_job_title := 'Employee';
      END CASE;
    END IF;

    RETURN v_job_title;
  END;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END;

