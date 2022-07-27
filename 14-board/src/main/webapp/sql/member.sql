-- 회원 테이블
-- 1) 테이블 생성
create table member (
    name varchar2(30) not null,
    id varchar2(30) primary key,   -- 기본키, unique, not null
    pwd varchar2(30) not null,
    gender varchar2(5),
    email1 varchar2(20),
    email2 varchar2(20),
    tel1 varchar2(10),
    tel2 varchar2(10),
    tel3 varchar2(10),
    addr varchar2(100),
    logtime date
);

-- 2) 테이블 구조 확인
desc member;
-- 3) 테이블 목록 확인
select*from tab;
-- 4) 테이블 삭제
drop table member purge;
--5) 데이터 추가
insert into member values('홍길동','hong','1234','남','hong','naver.com',
'010','1234','5678','경기도 수원시',sysdate);

-- 6) 데이터 검색
select*from member;
select*from member where id='hong';
select*from member where id='hong' and pwd='1234';

-- 7)데이터 수정
update member set tel2 = '2323' where id='hong';
update member set name='홍길동',pwd='1234',gender='0',email1='hong',email2='naver.com', tel1='010', tel2 = '2323', tel3='5656', addr='서울' where id='hong';

-- 8)데이터 삭제
delete member where id='hong';

-- 9)DB 저장
commit;

-- 10)인덱스뷰
select * from
(select rownum rn, tt.* from
(select * from member order by name asc)tt)
where rn>=1 and rn<=5;
-- 11) 총 회원수
select count(*) as cnt from member;