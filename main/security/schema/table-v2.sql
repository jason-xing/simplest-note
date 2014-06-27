--1. 后台验证
--资源
create table resource (
    id                     serial not null primary key,
    name                   varchar(64) not null unique,
    type                   varchar(16) not null,
    value                  varchar(256),
    description            varchar(256)
);
comment on table resource is '资源';
comment on column resource.id is 'AUTO INCREMENT';
comment on column resource.name is '名称';
comment on column resource.type is '类型';
comment on column resource.value is '值';
comment on column resource.description is '描述';

--权限
create table permission (
    id                     serial not null primary key,
    name                   varchar(64) not null unique,
    resource_id            integer not null references resource (id),
    operation              varchar(16),
    description            varchar(256),
    unique (resource_id, operation)
);
comment on table permission is '权限';
comment on column permission.id is 'AUTO INCREMENT';
comment on column permission.name is '名称';
comment on column permission.resource_id is '资源id';
comment on column permission.operation is '操作';
comment on column permission.description is '描述';

--角色
create table role (
    id                     serial not null primary key,
    name                   varchar(64) not null unique,
    parent_id              integer references role (id),
    description            varchar(256)
);
comment on table role is '角色';
comment on column role.id is 'AUTO INCREMENT';
comment on column role.name is '名称';
comment on column role.parent_id is '父角色id';
comment on column role.description is '描述';

--用户
create table user (
    id                     serial not null primary key,
    username               varchar(32) not null unique,
    password               varchar(32) not null,
    email                  varchar(32) unique,
    enable                 boolean not null
);
comment on table user is '用户';
comment on column user.id is 'AUTO INCREMENT';
comment on column user.username is '用户名';
comment on column user.password is '密码';
comment on column user.email is '电子邮件';
comment on column user.enable is '是否可用';

--角色的权限
create table role_permission (
    role_id                integer not null references role (id),
    permission_id          integer not null references permission (id),
    unique (role_id, permission_id)
);
comment on table role_permission is '角色的权限';
comment on column role_permission.role_id is '角色id';
comment on column role_permission.permission_id is '权限id';

--用户的角色
create table user_role (
    user_id                integer not null references user (id),
    role_id                integer not null references role (id),
    unique (user_id, role_id)
);
comment on table user_role is '用户的角色';
comment on column user_role.user_id is '用户id';
comment on column user_role.role_id is '角色id';


--2. 前台展示
create table menu (
    id                     serial not null primary key,
    name                   varchar(64) not null,
    parent_id              integer references menu (id),
    display_order          integer not null,
    is_left                boolean not null
);
comment on table menu is '菜单';
comment on column menu.name is '名称';
comment on column menu.parent_id is '父菜单id';
comment on column menu.display_order is '显示顺序';
comment on column menu.is_left is '是否为叶子';