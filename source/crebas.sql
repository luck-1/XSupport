/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/4/10 0:54:58                            */
/*==============================================================*/


drop table if exists user;

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   id                   varchar(32) not null comment 'id',
   createTime           datetime default CURRENT_TIMESTAMP comment '创建时间',
   updateTime           datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
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

