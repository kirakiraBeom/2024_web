insert into tbl_test_customer values( 'H006' ,'이윤정', '서울', '010-1111-2222');
commit;

select * from  tbl_test_customer;
select * from  tbl_test_goods;
select * from  tbl_test_order;



select * 
from  tbl_test_order  o 
join tbl_test_customer c
on o.id = c.id;
 


select c.name, o.sale_cnt
from  tbl_test_order  o 
join tbl_test_customer c
on o.id = c.id;



select c.name,   o.sale_cnt  
from  tbl_test_order  o 
inner join tbl_test_customer c
on o.id = c.id;
 


select c.name,  sum( o.sale_cnt )
from  tbl_test_order  o 
inner join tbl_test_customer c
on o.id = c.id
group by  c.name
order by 2 desc;


--주문하지 않은 고객도 조회

select c.name,  o.sale_cnt 
from  tbl_test_order  o 
right outer  join tbl_test_customer c
on o.id = c.id;
 

select c.name,  sum( o.sale_cnt )
from  tbl_test_order  o 
right outer  join tbl_test_customer c
on o.id = c.id
group by  c.name
order by 2 desc;
 

select c.name,  nvl( sum( o.sale_cnt ),0)
from  tbl_test_order  o 
  join tbl_test_customer c
on o.id = c.id
group by  c.name
order by 2 desc;

--
select g.pname,      o.sale_cnt  * g.price 
from  tbl_test_order  o 
 join tbl_test_goods g
on o.pcode = g.pcode;
   

select g.pname,      sum( o.sale_cnt  * g.price )  amount
from  tbl_test_order  o 
 join tbl_test_goods g
on o.pcode = g.pcode
group by  g.pname;
----
--고객별 주문금액 구하기
select c.name,      sum( o.sale_cnt  * g.price )  amount
from  tbl_test_order  o 
 join tbl_test_goods g
on o.pcode = g.pcode
join  tbl_test_customer c
on o.id = c.id
group by  c.name;
----
select c.name,  
sum(  o.sale_cnt  )
from  tbl_test_order  o 
inner join tbl_test_customer c
on o.id = c.id
group by  rollup( c.name);

-- rollup으로 전체 합계구하기
select  c.name   ,
sum(  o.sale_cnt  )
from  tbl_test_order  o 
inner join tbl_test_customer c
on o.id = c.id
group by  rollup( c.name);


--
select  decode( c.name , null, '합계', c.name),  
sum(  o.sale_cnt  )
from  tbl_test_order  o 
inner join tbl_test_customer c
on o.id = c.id
group by  rollup( c.name);


select  decode(deptno ,null,'합계', deptno),  decode(job , null,'소계', job ),  avg(sal) , count(*)
from emp
group by rollup( deptno, job);



select  decode(deptno ,null,'합계', deptno),    avg(sal) , count(*)
from emp
group by rollup( deptno );

-- pivot 

select deptno, decode( job, 'CLERK', empno) "clerk" ,
               decode( job, 'MANAGER', empno) "Manager",
                decode( job, 'PRESIDENT', empno) "president",
                 decode( job, 'ANALYST', empno) "anayst",
                  decode( job, 'SALESMAN', empno) "saleman"
from emp;


select deptno,  count(decode( job, 'CLERK', empno)) "clerk" ,
                count( decode( job, 'MANAGER', empno) )"Manager",
                count(decode( job, 'PRESIDENT', empno) )"president",
                count(  decode( job, 'ANALYST', empno)) "anayst",
                count(  decode( job, 'SALESMAN', empno) )"saleman"
from emp
group by deptno
order by deptno;


select * from  ( select deptno, job, empno from emp) 
pivot(
  count(empno) for job in( 'CLERK' as  "CLERK" ,
                           'MANAGER' as "MANAGER" ,
                           'PRESIDENT' as "PRESIGENT", 
                           'ANALYST'  as "ANALYST",
                           'SALESMAN' as "SALESMAN") 
)order by deptno;

-- rank() over()함수

select * from emp;
select empno, ename, sal, rank() over( order by sal)  as rank , rank() over( order by sal desc) rank_desc
from emp;

select rank('SMITH')  within  group( order by ename) "RANK" from emp;


select empno, ename, job, sal , row_number() over ( order by sal desc)
from emp;



select empno, ename, sal, deptno ,  rank() over( partition by deptno  order by sal desc)  rank 
from emp
order by deptno;



select empno, ename, sal, deptno ,  dense_rank() over( partition by deptno  order by sal desc)  rank 
from emp
order by deptno;



select empno, ename, sal, deptno ,  row_number() over( partition by deptno  order by sal desc)  rank 
from emp
order by deptno;

create table goods_tbl_500(
goods_cd varchar2(6) not null primary key, 
goods_nm varchar2(30), 
goods_price number(8), 
cost number(8), in_date date
); 


insert into goods_tbl_500 values('110001','육계장사발면',1050,750,'20190302');
insert into goods_tbl_500 values('110002','단팥빵',1300,800,'20190302'); 
insert into goods_tbl_500 values('110003','사브로',2000,1700,'20190302');
insert into goods_tbl_500 values('110004','칠성사이다',900,750,'20190302'); 
insert into goods_tbl_500 values('110005','콜라',750,300,'20190302'); 
insert into goods_tbl_500 values('110006','아몬드초콜릿',1500,1300,'20190302'); 
insert into goods_tbl_500 values('110007','초코몽',850,600,'20190302');


 create table store_tbl_500(
 store_cd varchar2(5) not null primary key,
 store_nm varchar2(20), 
 store_fg varchar2(1)
);

 insert into store_tbl_500 values('A001','노원점','0');
 insert into store_tbl_500 values('A002','마포점','0'); 
insert into store_tbl_500 values('A003','석계점','0'); 
insert into store_tbl_500 values('B001','하계점','1');
 insert into store_tbl_500 values('C001','상계점','1'); 
insert into store_tbl_500 values('D001','중계점','0');
 insert into store_tbl_500 values('D002','태릉입구점','1'); 
insert into store_tbl_500 values('E001','화랑대점','0');


 create table sale_tbl_500(
 sale_no varchar2(4) not null primary key, 
 sale_ymd date not null,
 sale_fg varchar2(1) not null, 
 store_cd varchar2(5)  ,         
 goods_cd varchar2(6) ,
 sale_cnt number(3),
 pay_type varchar2(2),
 constraint  fk1 foreign key (store_cd)  references store_tbl_500(store_cd),
 constraint  fk2  foreign key (goods_cd) references goods_tbl_500(goods_cd)
); 

insert into sale_tbl_500 values('0001','20190325','1','A001','110001',2,'02'); 
insert into sale_tbl_500 values('0002','20190325','1','B001','110003',2,'02');
 insert into sale_tbl_500 values('0003','20190325','1','D001','110003',1,'01'); 
insert into sale_tbl_500 values('0004','20190325','1','A001','110006',5,'02'); 
insert into sale_tbl_500 values('0005','20190325','1','C001','110003',2,'02'); 
insert into sale_tbl_500 values('0006','20190325','2','C001','110003',2,'02');
 insert into sale_tbl_500 values('0007','20190325','1','A002','110005',4,'02');
 insert into sale_tbl_500 values('0008','20190325','1','A003','110004',4,'02');
 insert into sale_tbl_500 values('0009','20190325','1','B001','110001',2,'01');
 insert into sale_tbl_500 values('0010','20190325','1','A002','110006',1,'02');

commit;
select    st.store_nm,  
           nvl(sum(decode(s.pay_type,'01', s.sale_cnt*g.goods_price)),0)  cash, 
           nvl(sum(decode(s.pay_type,'02', s.sale_cnt*g.goods_price)),0)  card,
           sum(s.sale_cnt*g.goods_price)  total
from        sale_tbl_500 s
join         goods_tbl_500 g
on          g.goods_cd = s.goods_cd
join         store_tbl_500 st
on          st.store_cd = s.store_cd
group by  st.store_nm;



select    st.store_nm,  
           nvl(sum(decode(s.pay_type,'01', s.sale_cnt*g.goods_price)),0)  cash, 
           nvl(sum(decode(s.pay_type,'02', s.sale_cnt*g.goods_price)),0)  card,
           sum(s.sale_cnt*g.goods_price)  total
from        sale_tbl_500 s
join         goods_tbl_500 g
on          g.goods_cd = s.goods_cd
join         store_tbl_500 st
on          st.store_cd = s.store_cd
group by  st.store_nm;


select * from (  
        select      st.store_nm,  s.pay_type , s.sale_cnt* g.goods_price                  
        from        sale_tbl_500 s
        join         goods_tbl_500 g
        on          g.goods_cd = s.goods_cd
        join         store_tbl_500 st
        on          st.store_cd = s.store_cd  
);


select *  from  (  
        select       st.store_nm  storenm,  s.pay_type   pay ,    s.sale_cnt* g.goods_price     amt               
        from         sale_tbl_500 s
        join         goods_tbl_500 g
        on           g.goods_cd = s.goods_cd
        join         store_tbl_500 st
        on          st.store_cd = s.store_cd  
)
pivot (
         sum(amt)    for pay  in(   '01'    "cash" , '02'  "card"  )
 
);

select * from emp;

 


select *  from  (  
        select       st.store_nm  storenm,  s.pay_type   pay ,    s.sale_cnt* g.goods_price     amt               
        from         sale_tbl_500 s
        join         goods_tbl_500 g
        on           g.goods_cd = s.goods_cd
        join         store_tbl_500 st
        on          st.store_cd = s.store_cd  
)
pivot (
         sum(amt)    for pay  in(   '01'  "cash" , '02'  "card"  )
 
);


 
--연습문제
select * from emp;
--  500+null => null로됨
select max(sal+nvl(comm, 0)) "MAX",
       min(sal+nvl(comm, 0)) "MIN",
       round(avg(sal+nvl(comm, 0)), 1) "AVG"
from emp;


-- decode 사용
select count(birthday)||'EA' "TOTAL",
       count(decode(substr(birthday, 4, 2), '01', '0'))||'EA' "JAN",
       count(decode(substr(birthday, 4, 2), '02', '0'))||'EA' "FEB",
       count(decode(substr(birthday, 4, 2), '03', '0'))||'EA' "MAR",
       count(decode(substr(birthday, 4, 2), '04', '0'))||'EA' "APR",
       count(decode(substr(birthday, 4, 2), '05', '0'))||'EA' "MAY",
       count(decode(substr(birthday, 4, 2), '06', '0'))||'EA' "JUN",
       count(decode(substr(birthday, 4, 2), '07', '0'))||'EA' "JUL",
       count(decode(substr(birthday, 4, 2), '08', '0'))||'EA' "AUG",
       count(decode(substr(birthday, 4, 2), '09', '0'))||'EA' "SEP",
       count(decode(substr(birthday, 4, 2), '10', '0'))||'EA' "OCT",
       count(decode(substr(birthday, 4, 2), '11', '0'))||'EA' "NOV",
       count(decode(substr(birthday, 4, 2), '12', '0'))||'EA' "DEC"
from student;

--3번
select count(tel) "TOTAL",
       count(decode(substr(tel, 1, instr(tel, ')')-1), '02', '0')) "SEOUL",
       count(decode(substr(tel, 1, instr(tel, ')')-1), '031', '0')) "GYEONGGI",
       count(decode(substr(tel, 1, instr(tel, ')')-1), '051', '0')) "BUSAN",
       count(decode(substr(tel, 1, instr(tel, ')')-1), '052', '0')) "ULSAN",
       count(decode(substr(tel, 1, instr(tel, ')')-1), '053', '0')) "DAEGU",
       count(decode(substr(tel, 1, instr(tel, ')')-1), '055', '0')) "GYEONGNAM"
from student;


--4번
select deptno,
         decode(job, 'CLERK', sal, 0) "CLERK",
         decode(job, 'MANAGER', sal, 0) "MANAGER",
         decode(job, 'PRESIDENT', sal, 0) "PRESIDENT",
         decode(job, 'ANALYST', sal, 0) "ANALYST",
         decode(job, 'SALESMAN', sal, 0) "SALESMAN"      
from emp;
 

--
select deptno,  sum(nvl2(job, sal, 0)) "TOTAL"
from emp
group by rollup(deptno)
order by deptno;
--
select deptno,
       sum(decode(job, 'CLERK', sal, 0)) "CLERK",
       sum(decode(job, 'MANAGER', sal, 0)) "MANAGER",
       sum(decode(job, 'PRESIDENT', sal, 0)) "PRESIDENT",
       sum(decode(job, 'ANALYST', sal, 0)) "ANALYST",
       sum(decode(job, 'SALESMAN', sal, 0)) "SALESMAN",
       sum(nvl2(job, sal, 0)) "TOTAL"
from emp
group by rollup(deptno)
order by deptno;

--4
select decode(deptno,null,'합계', deptno) deptno ,
       sum(decode(job, 'CLERK', sal, 0)) "CLERK",
       sum(decode(job, 'MANAGER', sal, 0)) "MANAGER",
       sum(decode(job, 'PRESIDENT', sal, 0)) "PRESIDENT",
       sum(decode(job, 'ANALYST', sal, 0)) "ANALYST",
       sum(decode(job, 'SALESMAN', sal, 0)) "SALESMAN",
       sum(nvl2(job, sal, 0)) "TOTAL"
from emp
group by rollup(deptno)
order by deptno;




--
select deptno, decode( job, 'CLERK', empno) "clerk" ,
 decode( job, 'MANAGER', empno) "Manager",
 decode( job, 'PRESIDENT', empno) "president",
 decode( job, 'ANALYST', empno) "anayst",
 decode( job, 'SALESMAN', empno) "saleman"
from emp;

select deptno, count(decode( job, 'CLERK', empno)) "clerk" ,
 count( decode( job, 'MANAGER', empno) )"Manager",
 count(decode( job, 'PRESIDENT', empno) )"president",
 count( decode( job, 'ANALYST', empno)) "anayst",
 count( decode( job, 'SALESMAN', empno) )"saleman"
from emp
group by deptno
order by deptno;
 
 
 --sum() over()
 select p_date, p_total, sum(p_total) over( order by p_total)  from panmae where p_store=1000;
 
 --
 select p_store,  p_date, p_code , p_total , sum(p_total) over( partition  by p_code  order by p_total) 
 from panmae
 where p_store=1002;
 
 
 -- 비등가조인
  select * from customer;
  select * from  gift;
  
  
  select * from customer  c join gift g on c.point >= g.g_start and c.point <= g.g_end ;
  
  
  --self 조인