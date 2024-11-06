select * from claim

show tables;

/* 신고테이블(claim) */
create table claim(
	idx						int					not null		auto_increment,		/*	신고 테이블 고유번호		*/
	part					varchar(15) not null,											/*	신고분류(게시판:board | 자료실:pds | 방명록:guest) */
	partIdx				int					not null,											/*	신고 분류항목의 고유번호	*/
	claimMid			varchar(30)	not null,											/*	신고자 ID	*/
	claimContent	text				not null,											/*	신고사유	*/
	claimDate			datetime		default now(),								/*	신고한 날짜	*/
	
	primary key(idx)
);

insert into claim values (default, 'board', 20, 'hkd1234', '광고,홍보,영리목적', default);