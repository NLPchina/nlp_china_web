create table tag (
	id int auto_increment PRIMARY KEY,
	type INT NOT NULL DEFAULT 0,
	name  varchar(31) NOT NULL
) ;

insert into tag(name,type) values('自然语言处理',1) ;
insert into tag(name,type) values('机器学习',1) ;
insert into tag(name,type) values('分词',1) ;
insert into tag(name,type) values('分类',1) ;
insert into tag(name,type) values('聚类',1) ;
insert into tag(name,type) values('机器翻译',1) ;
insert into tag(name,type) values('计算语言学',1) ;
insert into tag(name,type) values('词典',1) ;
insert into tag(name,type) values('中文信息处理',1) ;
insert into tag(name,type) values('文本语料',1) ;
insert into tag(name,type) values('推荐系统',1) ;
insert into tag(name,type) values('语音识别',1) ;
insert into tag(name,type) values('模式识别',1) ;


create table category (
	id int auto_increment PRIMARY KEY,
	name  varchar(31) NOT NULL
) ;

insert into category(id,name) values(1,'学术论文') ;
insert into CATEGORY(id,name) values(2,'语料资源') ;
insert into CATEGORY(id,name) values(3,'技术文档') ;
insert into CATEGORY(id,name) values(4,'开源项目') ;


create table resource (
	id int auto_increment PRIMARY KEY,
	title  varchar(255) NOT NULL,
	banner_img  varchar(255) ,
	sys_img  varchar(255) NOT NULL,
	summary  varchar(1023) NOT NULL,
	publish_time  date NOT NULL,
	update_time  date NOT NULL,
	author  varchar(31) NOT NULL,
	visit_url  varchar(255) ,
	category_id int 
) ;


create table resource_tag(
	id int auto_increment PRIMARY KEY,
	resource_id int NOT NULL,
	tag_id int NOT NULL
) ;


create table doc_menu(
	id int auto_increment PRIMARY KEY,
	content  LONGTEXT NOT NULL,
	author  varchar(31) NOT NULL,
	publish_time  datetime NOT NULL,
	update_time  datetime NOT NULL,
	extracting_code  varchar(15) NOT NULL
) ;

DROP TABLE IF EXISTS `document` ;
create table document(
	id varchar(36) PRIMARY KEY,
	content  LONGTEXT NOT NULL,
	author  varchar(31) NOT NULL,
	publish_time  datetime NOT NULL,
	update_time  datetime NOT NULL,
	extracting_code  varchar(15) NOT NULL,
	menu_id int default NULL 
) ;

