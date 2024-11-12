select * from schedule;

show table;

create table schedule (
	idx int not null auto_increment,				/*	스케줄 관리 고유번호	*/
	mid varchar(20) not null,								/*	회원 아이디	*/
	sDate datetime not null,								/*	일정이 있는 날짜	*/
	part varchar(10) not null,							/*	일정분류(1.모임, 2.업무, 3. 학습, 4. 여행, 5. 기타	*/
	content	text not null,									/*	일정 상세 내역	*/
	primary key(idx),
	foreign key(mid) references member(mid)
);

desc schedule;
drop table schedule;

insert into schedule values(default, 'hkd1234', '2024-11-10', '모임', '부대찌개 3인분');
insert into schedule values(default, 'kms1234', '2024-11-10', '모임', '부대찌개 3인분');
insert into schedule values(default, 'kms1234', '2024-11-11', '업무', '헤더');
insert into schedule values(default, 'kms1234', '2024-11-11', '업무', '회원가입 구성');
insert into schedule values(default, 'hkd1234', '2024-11-11', '업무', '로그인 창 구성');
insert into schedule values(default, 'hkd1234', '2024-11-12', '업무', '계산기 구성');
insert into schedule values(default, 'kms1234', '2024-11-12', '학습', '회원가입 창 구성');
insert into schedule values(default, 'hkd1234', '2024-11-13', '기타', '인테리어 input 구성');
insert into schedule values(default, 'kms1234', '2024-11-13', '학습', '가구 input 구성');
insert into schedule values(default, 'hkd1234', '2024-11-14', '업무', '인테리어 메인 구성');
insert into schedule values(default, 'kms1234', '2024-11-14', '학습', '가구 메인 구성');
insert into schedule values(default, 'hkd1234', '2024-11-15', '학습', '인테리어 넣기');
insert into schedule values(default, 'kms1234', '2024-11-15', '업무', '가구 넣기');
insert into schedule values(default, 'hkd1234', '2024-11-16', '여행', '갈 수 있을까..?');
insert into schedule values(default, 'kms1234', '2024-11-16', '여행', '갈 수 있을까..?');
insert into schedule values(default, 'hkd1234', '2024-11-17', '모임', '김치 가지러 가기');
insert into schedule values(default, 'kms1234', '2024-11-17', '모임', '김치 가지러 가기');

select * from schedule where mid = 'hkd1234' order by idx desc;
select * from schedule where mid = 'hkd1234' and substring(sDate,1, 10) = '2024-11-12' order by idx desc;
select * from schedule where mid = 'hkd1234' and date_format(sDate,'%Y-%m-%d') = '2024-11-17' order by idx desc;

select * from schedule where mid = 'kms1234' and date_format(sDate,'%Y-%m') = '2024-11' order by sDate, part;

select *,count(*) from schedule where mid = 'kms1234' and date_format(sDate,'%Y-%m') = '2024-11' group by sDate, part order by sDate, part;

select *,count(*) from schedule where mid='hkd1234' and date_format(sDate,'%Y-%m-%d')='2024-11-30' group by sDate,part order by sDate, part;