PL/SQL Implicit Cursor Example
//Create users table and have records:
ID	NAME	AGE	ADDRESS	  SALARY
1	Rama	24	Hyderabad 20000
2	alia	23	Chennai	  22000
3	roopa	21	Banglore  24000
4	ashok   22	Noida	  26000
5	saritha	21	Mumbai	  28000
6	Sunita	25	Delhi	  30000

Create procedure:

DECLARE   
   total_rows number(2);  
BEGIN  
   UPDATE users  
   SET salary = salary + 4000;  
   IF sql%notfound THEN  
      dbms_output.put_line('nousers updated');  
   ELSIF sql%found THEN  
      total_rows := sql%rowcount;  
      dbms_output.put_line( total_rows || 'users updated ');  
   END IF;   
END;  

select * from users;

ID	NAME	AGE	ADDRESS	  SALARY
1	Rama	24	Hyderabad 20000
2	alia	23	Chennai	  22000
3	roopa	21	Banglore  24000
4	ashok   22	Noida	  26000
5	saritha	21	Mumbai	  28000
6	Sunita	25	Delhi	  30000

// Explicit Cursors
Create users table and have records:

ID	NAME	AGE	ADDRESS	  SALARY
1	Rama	24	Hyderabad 20000
2	alia	23	Chennai	  22000
3	roopa	21	Banglore  24000
4	ashok   22	Noida	  26000
5	saritha	21	Mumbai	  28000
6	Sunita	25	Delhi	  30000

//Create procedure:

DECLARE  
   c_id users.id%type;  
   c_name users.name%type;  
   c_addr users.address%type;  
   CURSOR c_users is  
      SELECT id, name, address FROM users;  
BEGIN  
   OPEN c_users;  
   LOOP  
      FETCH c_users into c_id, c_name, c_addr;  
      EXIT WHEN c_users%notfound;  
      dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_addr);  
   END LOOP;  
   CLOSE c_users;  
END;  
 
Output:
1 Rama	  Hyderabad 
2 alia	  Chennai	  
3 roopa	  Banglore 
4 ashok   Noida	 
5 saritha Mumbai	  
6 Sunita  Delhi	  




