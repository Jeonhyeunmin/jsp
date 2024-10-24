show tables;

desc hoewon;

select * from hoewon;
select * from hoewon2;

create table hoewon as select * from hoewon2;

alter table hoewon drop column num;
alter table hoewon drop column job;
alter table hoewon drop column joinday;
delete from hoewon where name = '고승우';
delete from hoewon where name = '한소연';

alter table hoewon auto_increment = 21;

update hoewon set gender = '남자' where gender = '남성';
update hoewon set gender = '여자' where gender = '여성';