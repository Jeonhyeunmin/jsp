select * from board;

create table board(
	idx 			int						not null auto_increment,	/* 게시글 고유번호 */
	mid 			varchar(30)		not null,									/* 게시글 올린 사람 ID */
	nickName	varchar(30)		not null,									/* 게시글 올린 사람 닉네임 */
	title			varchar(100)	not null,									/* 게시글 제목 */
	content		text 					not null,									/* 글 내용 */
	hostIp		varchar(40)		not null,									/* 게시글 올린 사람 IP */
	openSw		char(3)				default '공개'							/* 공개여부 */
	readNum		int 					default 0,								/* 글 조회수 */
	good			int 					default 0,								/* 좋아용 */
	wDate			datetime 			default now(),						/* 글 올린 날짜 */
	claim			char(2)				default 'NO',							/* 신고글 유무 */
	
	primary key(idx),
	foreign key(mid) references member(mid)	
);

insert into board values (default, 'admin', '관리인', '게시판 서비스를 시작합니다.', '공개 게시판입니다 많관부', '192.168.50.56', default, default, default, default, default);
