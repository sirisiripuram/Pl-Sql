//PL/SQL Create Procedure
Table creation:
create table user(id number(14) primary key,name varchar2(100));  

//Procedure Code
create or replace procedure "INSERTUSER"    
(id IN NUMBER,    
name IN VARCHAR2)    
is    
begin    
insert into user values(id,name);    
end;  


 Output:

Procedure created
//PL/SQL program to call procedure
BEGIN    
   insertuser(1,'alia');  
   dbms_output.put_line('record inserted successfully');    
END;  

// record is created
ID	Name
1	alia  

//INSERT ALL
  INTO users(id, name) VALUES (10, 'leena')
  INTO users (id, name) VALUES (20, 'sofi')
  INTO users (id, name) VALUES (30, 'ashok')
SELECT * FROM dual;



//PL/SQL Function
//example to create a function
create or replace function adder(n1 in number, n2 in number)    
return number    
is     
n3 number(8);    
begin    
n3 :=n1+n2;    
return n3;    
end; 


//program to call the function.

DECLARE    
   n3 number(2);    
BEGIN    
   n3 := adder(11,22);    
   dbms_output.put_line('Addition is: ' || n3);    
END;    


Output:
Addition is: 33



//PL/SQL function example using table
//let consider user table and have records in it.
Id	Name	Department	Salary
1	alia	ui	3500
2	sofi	python	45000
3	ashok	testing	25000
4	rama	nodejs	60000
//Create Function:

CREATE OR REPLACE FUNCTION totalUsers 
RETURN number IS  
   total number(2) := 0;  
BEGIN  
   SELECT count(*) into total  
   FROM users;  
    RETURN total;  
END;  
/ 
//Function created. 
//Calling PL/SQL Function:
DECLARE  
   c number(2);  
BEGIN  
   c := totalusers();  
   dbms_output.put_line('Total no. of users: ' || c);  
END;  
/ 
result: 
Total no. of users: 4
PL/SQL procedure successfully completed.
