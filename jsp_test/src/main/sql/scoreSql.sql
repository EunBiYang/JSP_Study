-- 성적관리 JSP시험
--1)테이블 생성
create table score(
    hak varchar2(40) not null,  -- 학번
    name varchar2(40) not null, -- 이름
    kor number,                 -- 국어
    eng number,                 -- 영어
    mat number,                 -- 수학
    tot number,                 -- 총점
    avg number(6,2),            -- 평균
    primary key(hak) -- 기본키, unique(중복금지) + not null
);

-- 1) 데이터 저장
insert into score values ('2022077', '김비비', 90, 80, 70, 240, 80.0);
insert into score values ('2022073', '박미미', 91, 81, 71, 243, 81.0);
insert into score values ('2022076', '김디디', 89, 79, 69, 237, 79.0);

-- 2) 데이터 확인 
select * from tab;
select * from score;
-- 3) 학번 기준 오름차순
select * from score order by hak asc;

-- 4)10개씩 출력
select * from
(select rownum rn, tt.* from
(select * from score order by hak asc)tt)
where rn>=1 and rn<=10;

-- 5)데이터 갯수 확인
select count(*) as cnt from score;

-- 6) 삭제
delete score;
drop table score purge;

-- 7) db 저장
commit;