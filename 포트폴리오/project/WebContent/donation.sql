drop table campaign_history_tbl;
drop table campaign_list_tbl;
drop table campaign_tbl;
drop table donation_tbl;
drop table admin_tbl;
drop table comgrp_member_tbl;
drop table normal_member_tbl;

create table normal_member_tbl(
normal_member_id varchar(30) not null primary key,
normal_member_pw varchar(30) not null,
normal_member_name varchar(30) not null,
normal_member_birth date not null,
normal_member_phone varchar(15) not null,
normal_member_gender varchar(1) not null,
normal_member_email varchar(30),
normal_member_date date not null,
normal_member_grade varchar(2) not null
);

create table comgrp_member_tbl(
comgrp_member_id varchar(30) not null primary key,
comgrp_member_pw varchar(30) not null,
comgrp_member_category varchar(1) not null,
comgrp_member_name varchar(30) not null,
comgrp_manager_name varchar(30) not null,
comgrp_member_companyno varchar(30) not null,
comgrp_manager_phone varchar(15) not null,
comgrp_member_email varchar(30),
comgrp_member_date date not null,
comgrp_member_grade varchar(2) not null
);

create table admin_tbl(
admin_id varchar(30) not null primary key,
admin_pw varchar(30) not null,
admin_name varchar(30) not null,
admin_phone varchar(15) not null,
admin_date date not null,
admin_grade varchar(2) not null
);

create table donation_tbl(
donation_no int auto_increment not null primary key,
donation_member_id varchar(30) not null,
donation_money int not null,
donation_date date not null,
donation_campaign varchar(30) not null,
donation_type varchar(10) not null,
pay_type varchar(10) not null,
pay_status varchar(1) not null,

constraint member_donation_fk foreign key(donation_member_id)
references normal_member_tbl(normal_member_id)
);

create table campaign_tbl(
campaign_no int auto_increment not null primary key,
campaign_name varchar(30) not null,
campaign_member_id varchar(30) not null,
campaign_content varchar(2000) not null,
campaign_file varchar(50) not null,

constraint campaign_normal_member_fk foreign key(campaign_member_id)
references normal_member_tbl(normal_member_id),
constraint campaign_comgrp_member_fk foreign key(campaign_member_id)
references comgrp_member_tbl(comgrp_member_id)
);

create table campaign_list_tbl(
campaign_list_no int not null,
campaign_list_name varchar(30) not null,
campaign_list_group varchar(30) not null,
campaign_list_group_intro varchar(2000) not null,
campaign_list_all_fund_raised int not null,

constraint campaign_list_fk foreign key(campaign_list_no)
references campaign_tbl(campaign_no)
);

create table campaign_history_tbl(
campaign_support_no int not null,
campaign_support_campaign_name varchar(30) not null,
campaign_support_fund_raised int not null,
campaign_support_group_name varchar(30) not null,
campaign_support_date date not null,

constraint campaign_history_fk foreign key(campaign_support_no)
references campaign_tbl(campaign_no)
);