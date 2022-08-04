--웹 도서관리(MVC로) 시험
-- 1) 테이블 생성
create table book2 (
    code varchar2(15) not null,         -- 도서코드
    name varchar2(30) not null,         -- 도서명
    author varchar2(15) not null,       -- 저자
    pub varchar2(30),                   -- 출판사
    price number,                       -- 가격
    p_day date,                         -- 출판일
    primary key (code)
);

-- 2) 테이블 삭제
drop table book2 purge;
-- 3) 테이블 확인
select * from tab;

-- 1) 데이터 저장
insert into book2 values ('2022001', '자바입문1', '홍길동', '한빛출판사', 20000, sysdate);
insert into book2 values ('2022002', '파이썬입문1', '고길동', '샛별출판사', 30000, sysdate);



-- 2) 원하는 데이터 추출
-- 2-1) 도서코드 오름차순 검색
select * from book2 order by code asc;
-- 2-2)인덱스 뷰
select * from
(select rownum rn, tt.* from
(select * from book2 order by code asc)tt)
where rn>=1 and rn<=10;


-- 2-3)총 데이터 갯수 cnd구하기
select count(*) as cnt from book2;

select * from book2 where code=2022005;

-- 3) db 저장
commit;