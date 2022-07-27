-- 게시판 글관리 테이블 
-- 1) 테이블 생성
create table board (
    seq number not null ,               -- 글번호
    id varchar2(30) not null,           -- 아이디
    name varchar2(40) not null,         -- 이름
    subject varchar2(255) not null,     -- 제목
    content varchar2(4000) not null,    -- 내용
    hit number default 0,               -- 조회수
    logtime date default sysdate        -- 작성일
);

-- 2) 테이블 삭제
drop table board1 purge;
-- 3) 테이블 구조 확인
desc board;
-- 4) 테이블 목록 확인
select * from tab;
-- 시퀀스 객체 테스트
CREATE SEQUENCE test INCREMENT by 2 minvalue 1 maxvalue 9 nocache cycle;
-- 시퀀스 객체 삭제
drop sequence test;
-- 정의된 시퀀스 조회
select * from user_sequences;
-- 다음 시퀀스 조회
select test.nextval from dual;
-- 현재 시퀀스 조회
select test.currval from dual;
-- 5)글번호에 사용할 시퀀스 객체 생성
create sequence seq_board nocache nocycle;
-- 6)시퀀스 삭제
drop sequence seq_board;
-- 7)데이터 저장 : insert
insert into board values
(seq_board.nextval, 'num1', '홍길동','내일은','웃으리!',0,sysdate);

-- 8) 전체 데이터 검색
select * from board;

-- 9) 글번호로 1개 데이터 검색
select * from board where seq=1;

-- 10) 데이터 수정
update board set subject='오늘도', content='크게 웃으리' where seq=1;

-- 11)데이터 삭제
delete board where seq=1;

-- 12) DB 저장
commit;


-- 13) 인덱스 뷰
-- =>행번호(RowNum, 인덱스) 기준으로 데이터를 얻어오는 것
select * from
(select rownum rn, tt.* from
(select * from board order by seq desc)tt)
where rn>=3 and rn<5;

-- 전체 데이터를 seq기준으로 내림 차순 정렬해서 얻어옴
select * from board order by seq desc;

--rownum : 행번호, hidden column 
select rownum rn, tt.* from
(select * from board order by seq desc) tt;

-- 사용할 sql구문(날짜 모양때문에!)
select seq, id, name, subject, content, hit, to_char(logtime,'YYYY.MM.DD')as logtime from
(select rownum rn, tt.* from
(select * from board order by seq desc)tt)
where rn>=1 and rn<=5;

-- 14)조회수 증가시키기
update board set hit = hit+1 where seq=38;

--15)데이터 갯수 확인
select count(*) from board;
