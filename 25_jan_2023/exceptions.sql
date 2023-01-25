CREATE TABLE customerstable
( customer_id number(10) NOT NULL,
  customer_firstname varchar(50) NOT NULL,
  customer_age number(10) NOT NULL,
 customer_address varchar2(40) NOT NULL,
 customer_salary number(10) NOT NULL
)

SELECT * FROM customerstable;


INSERT ALL
INTO customerstable
(customer_id, customer_firstname,customer_age,customer_address,customer_salary)VALUES(101, 'rama',25,'hyderabad',20000)
INTO customerstable
(customer_id, customer_firstname,customer_age,customer_address,customer_salary)VALUES(102, 'roopa',23,'chennai',30000)
INTO customerstable
(customer_id, customer_firstname,customer_age,customer_address,customer_salary)VALUES(103, 'saritha',24,'hyderabad',40000)
INTO customerstable
(customer_id, customer_firstname,customer_age,customer_address,customer_salary)VALUES(104, 'alia',21,'bangloore',25000)
 SELECT * FROM dual;
DELETE FROM customerstable
WHERE customer_id = 101;
set SERVEROUTPUT ON
DECLARE  
   c_id customerstable.customer_id%type;  
   c_name customerstable.customer_firstname%type;  
   c_address customerstable.customer_address%type;  
   CURSOR c_customerstable is  
      SELECT customer_id, customer_firstname, customer_address FROM customerstable;  
BEGIN  
   OPEN c_customerstable;  
   LOOP  
      FETCH c_customerstable into c_customer_id, c_customer_firstname, c_customer_address;  
      EXIT WHEN c_customerstable%notfound;  
      dbms_output.put_line(c_id || ' ' || c_firstname || ' ' || c_address);  
   END LOOP;  
   CLOSE c_customerstable;  
END;
--set SERVEROUTPUT ON
DECLARE
   c_id customerstable.customer_id%type:=4;
   c_firstname customerstable.customer_firstname%type;
   c_addr  customerstable.customer_address%type;
BEGIN
   SELECT customer_firstname,customer_address INTO c_firstname,c_addr
   FROM customerstable
   WHERE customer_id=c_id;
   DBMS_OUTPUT.PUT_LINE('customers_salary:'||c_firstname);
   DBMS_OUTPUT.PUT_LINE('customers_address:'||c_addr);
   EXCEPTION
    WHEN no_data_found THEN
    dbms_output.put_line('No such customer!');
    WHEN others THEN
    dbms_output.put_line('Errors!');
END;

   
   
   
   
   
   