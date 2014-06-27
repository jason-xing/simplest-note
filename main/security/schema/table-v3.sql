--Create Tables

--资源
create table resource (
    id                     serial not null primary key,
    type                   varchar(16) not null,
    name                   varchar(64) not null,
    value                  varchar(128),
    unique (type, name)
);
comment on table resource is '资源';
comment on column resource.id is 'AUTO INCREMENT';
comment on column resource.type is '类型。如URL、MENU等';
comment on column resource.name is '名称。如URL类型的修改用户信息、MENU类型的我的订单。后台分配资源等时的显示名称';
comment on column resource.value is '值。如URL类型的/user/ModifyUser.do、MENU类型的/order/MyOrders.js';

--菜单（前台）。resource的一种，继承自resource。
create table menu (
    id                     integer not null primary key references resource (id),
    parent_id              integer references menu (id),
    display_name           varchar(64) not null,
    display_order          integer not null,
    is_leaf                boolean not null
);
comment on table menu is '菜单';
comment on column menu.id is 'id';
comment on column menu.parent_id is '父菜单id';
comment on column menu.display_name is '显示名称';
comment on column menu.display_order is '显示顺序';
comment on column menu.is_leaf is '是否为叶子';

--权限
create table permission (
    id                     serial not null primary key,
    name                   varchar(64) not null unique,
    resource_id            integer not null references resource (id),
    operation              varchar(16) not null,
    unique (resource_id, operation)
);
comment on table permission is '权限';
comment on column permission.id is 'AUTO INCREMENT';
comment on column permission.name is '名称';
comment on column permission.resource_id is '资源id';
comment on column permission.operation is '操作。对于资源类型为URL，有VISIT(访问)，对于资源类型为MENU，有FE_DISP(前端显示)';

--角色
create table role (
    id                     serial not null primary key,
    name                   varchar(64) not null unique,
    parent_id_list         varchar(128)
);
comment on table role is '角色';
comment on column role.id is 'AUTO INCREMENT';
comment on column role.name is '名称';
comment on column role.parent_id_list is '父角色id列表的拼串，形如：3,5,8。这里的角色继承为一般继承（General Inheritance，多继承），而不是有限制的继承（Limited Inheritance，单继承）';

--角色的权限
create table role_permission (
    role_id                integer not null references role (id),
    permission_id          integer not null references permission (id),
    unique (role_id, permission_id)
);
comment on table role_permission is '角色的权限';
comment on column role_permission.role_id is '角色id';
comment on column role_permission.permission_id is '权限id';

--用户。user在DB中是关键字。如果DB为postgresql，则可加双引号避免报错。
create table "user" (
    id                     serial not null primary key,
    username               varchar(32) not null unique,
    password               varchar(32) not null,
    email                  varchar(32) unique
);
comment on table "user" is '用户';
comment on column "user".id is 'AUTO INCREMENT';
comment on column "user".username is '用户名';
comment on column "user".password is '密码';
comment on column "user".email is '电子邮件';

--用户的角色
create table user_role (
    user_id                integer not null references "user" (id),
    role_id                integer not null references role (id),
    unique (user_id, role_id)
);
comment on table user_role is '用户的角色';
comment on column user_role.user_id is '用户id';
comment on column user_role.role_id is '角色id';

--Drop Tables
drop table user_role;
drop table role_permission;
drop table "user";
drop table role;
drop table permission;
drop table menu;
drop table resource;