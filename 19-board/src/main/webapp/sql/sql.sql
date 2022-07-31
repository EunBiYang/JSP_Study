-- 익명 게시판용 테이블
-- =>답글 기능 추가
-- 테이블 생성
create table board2(
    board_num number,                       -- 글 번호
    board_name varchar2(20) not null,       -- 글 작성자
    board_pass varchar2(20) not null,       -- 글비밀번호
    board_subject varchar2(100) not null,   -- 글제목
    board_content varchar2(2000) not null,  -- 글내용
    board_file varchar2(100) not null,      -- 첨부파일
    board_re_ref number not null,           -- 관련 글 번호
    board_re_lev number not null,           -- 답글 레벨
    board_re_seq number not null,           -- 관련글 중 출력순서
    board_readcount number not null,        -- 조회수
    board_date date,                        -- 작성일
    primary key(board_num)
);
-- 2) 테이블 삭제
drop table board2 purge;
-- 3)테이블 목록 확인
select * from tab;

-- 4) 시퀀스 생성
create sequence seq_num nocycle nocache;
-- 5) 시퀀스 삭제
drop sequence seq_num;

-- 6)저장(insert)
insert into board2 values(seq_num.nextval, '홍길동', '1234', '내일은', '웃으리',
'cupra.jpg', seq_num.currval, 0, 0, 0, sysdate);

-- 7) 검색
select * from board2;

-- 8) 전체 데이터 수
select count(*) as cnt from board2;

-- 9) 삭제
delete board2 where board_num=1;
delete board2 where board_num=1 and board_pass='1234';

-- 10) DB저장
commit;


-- 11) 인덱스
select * from
(select rownum rn, tt.* from
(select * from board2 order by board_num desc)tt)
where rn>=1 and rn<=10;

-- 12) 조회수 증가시키기
update board2 set board_readcount = board_readcount+1
where board_num = 56;



