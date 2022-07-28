--Imageboard테이블
-- 1) 테이블 생성
create table imageboard (
    seq number not null,                    -- 글번호
    imageId varchar2(30) not null,          -- 상품코드
    imageName varchar2(40) not null,        -- 상품명
    imagePrice number not null,             -- 단가
    imageQty number not null,               -- 개수
    imageContent varchar2(4000) not null,   -- 내용
    image1 varchar2(200),                   -- 파일이름
    logtime date default sysdate            -- 작성일
);
-- 2) 테이블 삭제
drop table imageboard purge;
-- 3) 테이블 목록 확인
select * from tab;

-- 4) 시퀀스 객체 생성
create sequence seq_imageboard nocache nocycle;
-- 5) 시퀀스 객체 삭제
drop sequence seq_imageboard;

-- 6)정의된 시퀀스 조회
select * from user_sequences;
-- 7)데이터 저장(insert)
insert into imageboard values (seq_imageboard.nextval, 'img_001', '컵라면',
1000,10, '맛잇는 컵라면', 'cupra.jpg',sysdate);
-- 8) 데이터 검색 (select)
select*from imageboard;
select*from imageboard where seq=1;
-- 9)데이터 삭제
delete imageboard where seq=1;

-- 10)DB저장
commit;

-- 11)인덱스 뷰
-- =>행번호(RowNum, 인덱스) 기준으로 데이터를 얻어오는 것
select * from
(select rownum rn, tt.* from
(select * from imageboard order by seq desc)tt)
where rn>=1 and rn<=5;

-- 12)총 데이터 갯수 cnd구하기
select count(*) as cnt from imageboard;

-- 13)게시글 수정하기
update imageboard set imageName='봉봉', imagePrice=100, imageQty=10,imageContent='맛있는 봉봉',image1='' where seq=36;


