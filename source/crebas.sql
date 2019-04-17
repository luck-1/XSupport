/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/4/16 22:56:33                           */
/*==============================================================*/


drop table if exists humidity;

drop table if exists soak;

drop table if exists system_error;

drop table if exists temperature;

drop table if exists user;

/*==============================================================*/
/* Table: humidity                                              */
/*==============================================================*/
create table humidity
(
   id                   varchar(32) not null comment 'id',
   createTime           datetime default CURRENT_TIMESTAMP comment '创建时间',
   value                varchar(32) comment '湿度值',
   state                int default 0 comment '状态(0：正常，1：异常，2：已处理)',
   remark               varchar(1000) comment '备注',
   primary key (id)
);

alter table humidity comment '湿度监控';

/*==============================================================*/
/* Table: soak                                                  */
/*==============================================================*/
create table soak
(
   id                   varchar(32) not null comment 'id',
   createTime           datetime default CURRENT_TIMESTAMP comment '创建时间',
   value                varchar(32) comment '浸润值',
   state                int default 0 comment '状态(0：正常，1：异常，2：已处理)',
   remark               varchar(1000) comment '备注',
   primary key (id)
);

alter table soak comment '浸润测量';

/*==============================================================*/
/* Table: system_error                                          */
/*==============================================================*/
create table system_error
(
   id                   varchar(32) not null comment 'id',
   createTime           datetime default CURRENT_TIMESTAMP comment '创建时间',
   username             varchar(20) comment '用户名',
   optionUser           varchar(5) comment '操作人',
   exceptionName        varchar(200) comment '异常类型',
   exceptionLocation    varchar(20) comment '异常定位',
   methodDescription    varchar(20) comment '方法描述',
   remark               varchar(1000) comment '备注',
   primary key (id)
);

alter table system_error comment '系统异常';

/*==============================================================*/
/* Table: temperature                                           */
/*==============================================================*/
create table temperature
(
   id                   varchar(32) not null comment 'id',
   createTime           datetime default CURRENT_TIMESTAMP comment '创建时间',
   value                varchar(32) comment '温度值',
   state                int default 0 comment '状态(0：正常，1：异常，2：已处理)',
   remark               varchar(1000) comment '备注',
   primary key (id)
);

alter table temperature comment '温度监控';

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   id                   varchar(32) not null comment 'id',
   createTime           datetime default CURRENT_TIMESTAMP comment '创建时间',
   username             varchar(20) comment '账号',
   password             varchar(20) comment '密码',
   isAdmin              tinyint default 0 comment '是否管理员(1:管理员  0:普通用户)',
   isForbidden          tinyint default 0 comment '是否禁用(0:正常 1::禁用)',
   name                 varchar(10) comment '姓名',
   sex                  tinyint default 0 comment '性别(0:男  1:女)',
   age                  int default 0 comment '年龄',
   address              varchar(50) comment '家庭住址',
   phone                varchar(11) comment '联系电话',
   remark               text comment '备注',
   primary key (id)
);

