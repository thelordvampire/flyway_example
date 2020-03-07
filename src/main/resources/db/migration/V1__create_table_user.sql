

create table user(
    id int primary key AUTO_INCREMENT,
    name nvarchar(100),
    password varchar(250),
    address nvarchar(200),
    phone varchar(15),
    email varchar(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table article (
    id int primary key AUTO_INCREMENT,
    title nvarchar(200),
    content mediumtext,
    short_content nvarchar(2000),
    image varchar(2000),
    user_id int references user(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table privilege (
    id int primary key auto_increment,
    name varchar(255) not null
);

create table field (
    id int primary key auto_increment,
    description varchar(255) null,
    name varchar(255) not null
);

create table post
(
    id int primary key auto_increment,
    content longtext not null,
    created_datetime datetime(6) null,
    image mediumtext null,
    post_status varchar(255) null,
    tag varchar(255) null,
    title varchar(255) not null,
    updated_datetime datetime(6) null,
    user_id int not null,
    is_own tinyint(1) null,
    short_content varchar(500) charset utf8 not null,
    CONSTRAINT FK_post_user FOREIGN KEY (user_id) REFERENCES user(id)
);


create or replace table user_field
(
    id int auto_increment
    primary key,
    field_id int null,
    user_id int null,
    constraint FKjl6vprvgk311d7j4q6vbwavfg
    foreign key (field_id) references field (id),
    constraint FKpu043kkw31k1tv0dt4a6ru1ks
    foreign key (user_id) references user (id)
);

create or replace table user_list_post
(
    user_id int not null,
    list_post_id bigint not null,
    constraint UK_cs9bjompppiwtbflxq7xppf89
    unique (list_post_id),
    constraint FK3fpubx1nertgy5xul7t8j7fit
    foreign key (user_id) references user (id),
    constraint FKtn1od3xamnkeox25hvk81opjs
    foreign key (list_post_id) references post (id)
);

create or replace table user_privilege
(
    id int not null
    primary key,
    privilege_id int null,
    user_id int null,
    constraint FKbun0vye5x60x4jat4inmt6wbj
    foreign key (user_id) references user (id),
    constraint FKmru0v5b2y73od0o5ejfe4m9v8
    foreign key (privilege_id) references privilege (id)
);




create or replace schema lawdb collate utf8mb4_unicode_ci;

create or replace table SPRING_SESSION
(
    PRIMARY_ID char(36) not null
    primary key,
    SESSION_ID char(36) not null,
    CREATION_TIME bigint not null,
    LAST_ACCESS_TIME bigint not null,
    MAX_INACTIVE_INTERVAL int not null,
    EXPIRY_TIME bigint not null,
    PRINCIPAL_NAME varchar(100) null,
    constraint SPRING_SESSION_IX1
    unique (SESSION_ID)
);

create or replace table chat_room
(
    id int not null
    primary key,
    client_name varchar(255) not null,
    end_date datetime(6) null,
    server_user_id int null,
    start_date datetime(6) null,
    status int null
);



create or replace table spring_session
(
    PRIMARY_ID char(36) not null
    primary key,
    SESSION_ID char(36) not null,
    CREATION_TIME bigint not null,
    LAST_ACCESS_TIME bigint not null,
    MAX_INACTIVE_INTERVAL int not null,
    EXPIRY_TIME bigint not null,
    PRINCIPAL_NAME varchar(100) null,
    constraint SPRING_SESSION_IX1
    unique (SESSION_ID)
);

create or replace index SPRING_SESSION_IX2
          on spring_session (EXPIRY_TIME);

create or replace index SPRING_SESSION_IX3
          on spring_session (PRINCIPAL_NAME);

create or replace table spring_session_attributes
(
    SESSION_PRIMARY_ID char(36) not null,
    ATTRIBUTE_NAME varchar(180) not null,
    ATTRIBUTE_BYTES blob not null,
    primary key (SESSION_PRIMARY_ID, ATTRIBUTE_NAME),
    constraint SPRING_SESSION_ATTRIBUTES_FK
    foreign key (SESSION_PRIMARY_ID) references spring_session (PRIMARY_ID)
    on delete cascade
);

create or replace table user
(
    id int not null
    primary key,
    charge text null,
    education text null,
    email varchar(100) not null,
    experience text null,
    image mediumtext null,
    infor_detail text null,
    introduce text null,
    name varchar(255) null,
    password varchar(255) null,
    phone varchar(255) null,
    prize text null,
    role_id int null,
    constraint UK_ob8kqyqqgmefl0aco34akdtpe
    unique (email)
);

create or replace table chat_message
(
    id int not null
    primary key,
    content varchar(255) null,
    created_date datetime(6) null,
    room_id int null,
    sender varchar(255) null,
    type varchar(255) null,
    user_id int null,
    constraint FKf7tbywofv1iojpxc1kw8c3bx7
    foreign key (user_id) references user (id),
    constraint FKfvbc4wvhk51y0qtnjrbminxfu
    foreign key (room_id) references chat_room (id)
);
