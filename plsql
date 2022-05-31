set serveroutput on;
DECLARE
	a integer :=100;
	b integer :=200;
	c integer;
	f real;
BEGIN
	c := a + b;
	dbms_output.put_line(c);
END;
/


set serveroutput on;
DECLARE
	a integer :=10;
	
BEGIN
	if(a<15)
	then
	dbms_output.put_line(a);
	END IF;
END;
/



set serveroutput on;
DECLARE
	a integer :=20;
	
BEGIN
	if(a = 10) THEN
		dbms_output.put_line(a);
	ELSIF (a = 20) THEN
		dbms_output.put_line(a);
	else
		dbms_output.put_line(a);
	END IF;
END;
/

// if condition
DECLARE
	persent integer :=&persent;
BEGIN
	if(persent >=40 and persent <50 ) THEN
		dbms_output.put_line('you give 20 % scholorship');
	ELSIF (a = 20) THEN
		dbms_output.put_line(a);
	else
		dbms_output.put_line(a);
	END IF;
END;
/


// %type example

DECLARE
	tempno salespeople.snum%type;
	tempname salespeople.sname%type;
	tbasic salespeople.comm%type;
BEGIN
	tempno :=2;
	SELECT snum,sname,comm into tempno,tempname,tbasic
	FROM salespeople
	WHERE snum=tempno;
	
	dbms_output.put_line('salesman ' || tempname || ' earn insentive ' || tbasic);
END;
/

// %type example
DECLARE
	tempno customer.cnum%type;
	tempname customer.cname%type;
	tempcity customer.city%type;
	tempsalesno customer.snum%type;
BEGIN
	tempno :=&tempno;
	SELECT cnum,cname,city,snum into tempno,tempname,tempcity,tempsalesno
	FROM customer
	WHERE cnum=tempno;
	
	dbms_output.put_line('customerNo ' || tempno || ' customer name ' || tempname || 'city ' || tempcity || '  snum ' || tempsalesno);
END;
/

// %type database fetch attribute
set serveroutput on;
DECLARE
 tempno salespeople.snum%type := 1;
 tsal salespeople.comm%type;
BEGIN
 SELECT comm INTO tsal
 FROM salespeople
 WHERE snum = tempno;
 IF (tsal <= 25000)
 THEN
 UPDATE salespeople
 SET comm = comm + 1000
 WHERE snum = tempno;
 commit;
 dbms_output.put_line ('Salary
updated');
 END IF;
 
END;
/


// while loop
set serveroutput on;
 DECLARE
  2   a number :=1;
  3  BEGIN
  4  while a < 20
  5  loop
  6  dbms_output.put_line('value of a '||a);
  7  a :=a+1;
  8  end loop;
  9  END;
 10  /
 
 
 // odd number
 set serveroutput on;
 DECLARE
    a number(4) :=1;
 BEGIN
    while a < 20
    loop
	
    dbms_output.put_line('value of a '||a);
	
    a :=a+2;
    end loop;
    END;
   /
   
   
   // for loop 
   
 set serveroutput on;
 DECLARE
    a number(4);
 BEGIN
    for a in 10 .. 20
    loop
	
    dbms_output.put_line('value of a '||a);
	
    end loop;
    END;
   /
   
 

// reverse loop 
 set serveroutput on;
 DECLARE
    a number(4);
 BEGIN
    for a in reverse 10 .. 20
    loop
	
    dbms_output.put_line('value of a '||a);
	
    end loop;
    END;
   /
   
   
   // multiplication...   // modify..
 set serveroutput on;
 DECLARE
    a number(4);
 BEGIN
    for a in reverse 1 .. 10
    loop
	
    dbms_output.put_line('value of a '||a);
	
    end loop;
    END;
   /
   
   
   // %rowtype
   
DECLARE
	customer_rec customer%rowtype;
BEGIN
 SELECT * into customer_rec
 FROM customer
 WHERE cnum = 101;
 dbms_output.put_line('Customer Cnum: '|| customer_rec.cnum);
 dbms_output.put_line('Customer Name: ' || customer_rec.cname);
 dbms_output.put_line('Customer City: ' || customer_rec.city);
 dbms_output.put_line('Customer Salesman: ' || customer_rec.snum);

end;
/


DECLARE
	salesman_rec salespeople%rowtype;
BEGIN
 SELECT * into salesman_rec
 FROM salespeople
 WHERE snum = 5;
 dbms_output.put_line('salesman num: '|| salesman_rec.snum);
 dbms_output.put_line('salesman Name: ' || salesman_rec.sname);
 dbms_output.put_line('salesman City: ' || salesman_rec.city);
 dbms_output.put_line('Salesman insentive: ' || salesman_rec.comm);

end;
/


// case 
DECLARE
	grade char(1) :='A';
BEGIN
	CASE grade 
		when 'A' then dbms_output.put_line('Excellent');
		when 'B' then dbms_output.put_line('VERY GOOD');
		when 'C' then dbms_output.put_line('Well done');
		when 'D' then dbms_output.put_line('better to try');
	end case;
end;
/


================== exceptions =====================
DECLARE
	tempno customer.cnum%type:=88;
	tempname customer.cname%type;

BEGIN
	SELECT cnum,cname into tempno,tempname
	FROM customer
	WHERE cnum=tempno;
	
	dbms_output.put_line('customerNo ' || tempno || ' customer name ' || tempname );
	
	exception 
		when no_data_found then 
		dbms_output.put_line('no data found ');
		
		when others then 
		dbms_output.put_line('other error');
	
END;
/

-------- user define ---------------------
// uncomplete .........
DECLARE 
	tempno customer.cnum%type:=0;
	tempname customer.cname%type;
	
	e_invalid_snum EXCEPTION;

BEGIN
	if tempno <= 0 then 
	SELECT cnum,cname into tempno,tempname
	FROM customer
	WHERE cnum=tempno;
	
	dbms_output.put_line('customerNo ' || tempno || ' customer name ' || tempname );
	
	exception 
		when no_data_found then 
		dbms_output.put_line('no data found ');
		
		when others then 
		dbms_output.put_line('other error');
	
END;
/


----------------- cursor -------------------------------
DECLARE
	
	total_row number(4);
	
BEGIN
	update salespeople set comm=comm-10;  
	if sql%found 
	then 
	total_row := sql%rowcount;
	
	dbms_output.put_line('total row effected ' || total_row );
	commit;
	end if;
end;
/




DECLARE
	c_id customer.cnum%type;
	c_name customer.cname%type;
	c_city customer.city%type;
	
	CURSOR c_customers is 
	select cnum,cname,city from customer;
	
BEGIN

	open c_customers;
	loop
		fetch c_customers into c_id,c_name,c_city ;
		exit when c_customers%notfound;
		dbms_output.put_line(c_id ||' ' || c_name);
	end loop;
	close c_customers;
end;
/


// for loop

set serveroutput on;
DECLARE
 CURSOR cus IS SELECT cnum, cname, city
FROM customer
 where city = 'London' or city = 'Bengaluru'
	order by cname desc;
BEGIN
 FOR r in cus
LOOP
 DBMS_OUTPUT.PUT_LINE('cnum 
is ' || r.cnum);

DBMS_OUTPUT.PUT_LINE('Customer name is '
|| r.cname);
 DBMS_OUTPUT.PUT_LINE(' City is
' || r.city);
 END LOOP;
END;
/


------- procedure --- stand alone procedure   --------------
CREATE OR REPLACE PROCEDURE greetings
AS
BEGIN
 dbms_output.put_line('Welcome to the world of
PL/SQL Programming');
END;
/

execute greetings;


select object_name from user_procedures;

select object_name from user_procedures
 where object_name = 'GREETINGS';

------implecit procedure -------

DECLARE
 a number;
 b number;
 c number;
PROCEDURE findMin(x IN number, y IN number,
z OUT number) IS
BEGIN
 IF x < y
 THEN
 z := x;
 else
 z := y;
 END IF;
END;
BEGIN
 a:= &a;
 b:= &b;
 findMin(a, b, c);
 dbms_output.put_line(' Minimum of both
numbers is ' || c);
END;
/

-------------- function-------
CREATE OR REPLACE FUNCTION
totalCustomer
RETURN number IS
 total number(4) := 0;
BEGIN
 SELECT count(*) into total
 FROM customer;

 RETURN total;
END;
/

DECLARE
 c number(4);
BEGIN
 c := totalCustomer();
 dbms_output.put_line('Total no of Customers
is : ' || c);
END;
/


select object_name from user_objects
where object_type = 'FUNCTION';

---- package ------------------
// package heading 
create package sales_salary as
procedure find_sal(s_no salespeople.snum%type);
end sales_salary;
/


// package body

create or replace  package sales_salary as
procedure find_sal(s_no salespeople.snum%type) IS
s_salary salespeople.comm%type;

BEGIN
select  comm into s_salary
from salespeople
where snum=s_no;
dbms_output.put_line(comm);
end find_sal;

end sales_salary;
/
end sales_salary;
/