DECLARE 
   c_id customerstable.customer_id%type := &cc_id; 
   c_name customerstable.customer_firstname%type; 
   c_addr customerstable.customer_address%type;  
   -- user defined exception 
   ex_invalid_id  EXCEPTION; 
BEGIN 
   IF c_id <= 0 THEN 
      RAISE ex_invalid_id; 
   ELSE 
      SELECT  customer_firstname, customer_address INTO  c_name, c_addr 
      FROM customerstable 
      WHERE customer_id = c_id;
      DBMS_OUTPUT.PUT_LINE ('customer_firstname: '||  c_name);  
      DBMS_OUTPUT.PUT_LINE ('customer_address: ' || c_addr); 
   END IF; 

EXCEPTION 
   WHEN ex_invalid_id THEN 
      dbms_output.put_line('ID must be greater than zero!'); 
   WHEN no_data_found THEN 
      dbms_output.put_line('No such customer!'); 
   WHEN others THEN 
      dbms_output.put_line('Error!');  
END; 
   

CREATE OR REPLACE TRIGGER display_salary_changes 
BEFORE DELETE OR INSERT OR UPDATE ON customerstable 
FOR EACH ROW 
WHEN (NEW.customer_ID > 0) 
DECLARE 
   sal_diff number; 
BEGIN 
   sal_diff := :NEW.customer_salary  - :OLD.customer_salary; 
   dbms_output.put_line('Old customer_salary: ' || :OLD.customer_salary); 
   dbms_output.put_line('New customer_salary: ' || :NEW.customer_salary); 
   dbms_output.put_line('Salary difference: ' || sal_diff); 
END; 
/ 
INSERT INTO customerstable(customer_id,customer_firstname,customer_age,customer_address,customer_salary)VALUES(105,'rekha',23,'chennai',45000);
   
UPDATE customerstable 
SET customer_salary = customer_salary + 500 
WHERE customer_id = 105; 

CREATE OR REPLACE PACKAGE c_package AS 
   -- Adds a customer 
   PROCEDURE addCustomer(c_id   customerstable.customer_id%type, 
   c_name customerstable.customer_firstname%type, 
   c_age  customerstable.customer_age%type, 
   c_addr customerstable.customer_address%type,  
   c_sal  customerstable.customer_salary%type); 
   
   -- Removes a customer 
   PROCEDURE delCustomer(c_id  customerstable.customer_id%TYPE); 
   --Lists all customers 
   PROCEDURE listCustomer; 
  
END c_package; 

