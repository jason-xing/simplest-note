--1. 后台验证
--URL
create table urls (
    id                     integer not null primary key,
    name                   varchar(64) not null unique,
    value                  varchar(64) not null unique,
    description            varchar(256)
);
comment on column urls is 'URL';
comment on column urls.id is 'AUTO INCREMENT';
comment on column urls.name is '名称';
comment on column urls.value is '值';
comment on column urls.description is '描述';

--角色
create table roles (
    id                     integer not null primary key,
    name                   varchar(64) not null unique,
    parent_id              references roles (id),
    description            varchar(256)
);
comment on table roles is '角色';
comment on column roles.id is 'AUTO INCREMENT';
comment on column roles.name is '名称';
comment on column roles.parent_id is '父角色id';
comment on column roles.description is '描述';

--角色的URL
create table role_url (
    role_id                integer not null references roles (id),
    url_id                 integer not null references urls (id),
    unique (role_id, url_id)
);
comment on table role_url is '角色的URL';
comment on column role_url.role_id is '角色id';
comment on column role_url.url_id is 'URL id';

--用户
create table users (
    id                     integer not null primary key,
    login_name            varchar(32) not null unique,
    password               varchar(32) not null,
    name                   varchar(32),
    email                  varchar(32) unique,
    enable                 boolean not null
);
comment on table users is '用户';
comment on column users.id is 'AUTO INCREMENT';
comment on column users.login_name is '登录名';
comment on column users.password is '密码';
comment on column users.name is '名称';
comment on column users.email is '电子邮件';
comment on column users.enable is '是否可用';

--用户的角色
create table user_role (
    user_id                integer not null references users (id),
    role_id                integer not null references roles (id),
    unique (user_id, role_id)
);
comment on table user_role is '用户的角色';
comment on column user_role.user_id is '用户id';
comment on column user_role.role_id is '角色id';


--2. 前台展示
create table menus (
    id                     integer not null primary key,
    name                   varchar(64) not null,
    url_id                 integer references urls (id), 
    parent_id              references menu (id),
    order                  integer not null,
    is_left                boolean not null,
    enabled                boolean not null
);
