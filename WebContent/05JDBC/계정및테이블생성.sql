--계정 생성
create user musthave identified by 1234;

--권한 부여
grant connect, resource to musthave;

--새 계정으로 오라클 접속
conn musthave/1234;

--테이블 목록 조회
select * from tab;

/*
설명 : 먼저 만들어둔 테이블을 삭제하고 새로 생성하려는 경우 실행해주세요.
*/
drop table member;
drop table board;
drop sequence seq_board_num;

--[예제 5-1] 회원 테이블 생성
create table member (
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regidate date default sysdate not null,
    primary key (id)
);

--[예제 5-2] 모델1 방식의 게시판 테이블 생성
create table board (
    num number primary key,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    id varchar2(10) not null,
    postdate date default sysdate not null,
    visitcount number(6)
);

--[예제 5-3] 외래키 설정
alter table board
    add constraint board_mem_fk foreign key (id)
    references member (id);
    
--[예제 5-4] 시퀀스 생성
create sequence seq_board_num 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
    
--[예제 5-5] 더미 데이터 입력
insert into member (id, pass, name) values ('musthave', '1234', '머스트해브');
insert into board  (num, title, content, id, postdate, visitcount) 
	values (seq_board_num.nextval, '제목1입니다', '내용1입니다', 'musthave', sysdate, 0);
commit;