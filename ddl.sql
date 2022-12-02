create database salon;

use salon;

create table stylists (
    stylist_id smallint auto_increment primary key,
    name varchar(80) not null,
    designation varchar(30) not null
) engine = innodb;

show tables;

describe stylists;

create table members (
    member_id int auto_increment primary key,
    first_name varchar(45) not null,
    last_name varchar(45) not null,
    contact_number varchar(15) not null
) engine = innodb;

create table rewards (
    reward_id smallint auto_increment primary key,
    name varchar(100) not null,
    type varchar(50) not null
) engine = innodb;

create table services (
    service_id tinyint auto_increment primary key,
    name varchar(50) not null,
    cost mediumint not null
) engine = innodb;

create table appointments (
    appointment_id integer auto_increment primary key,
    datetime datetime not null,
    venue varchar(100) not null,
    points mediumint not null
) engine = innodb;

alter table appointments add column member_id int;

alter table appointments add constraint fk_appointments_members
    foreign key (member_id) references members(member_id);


alter table appointments add column stylist_id smallint;

alter table appointments add constraint fk_appointments_stylists
    foreign key (stylist_id) references stylists(stylist_id);

alter table appointments add column service_id tinyint;

alter table appointments add constraint fk_appointments_services
    foreign key (service_id) references services(service_id);

create table transactions (
    transaction_id integer auto_increment primary key
) engine = innodb;

alter table transactions add column service_id tinyint;

alter table transactions add constraint fk_transactions_services
    foreign key (service_id) references services(service_id);

alter table transactions add column appointment_id integer;

alter table transactions add constraint fk_transactions_appointments
    foreign key (appointment_id) references appointments(appointment_id);

alter table transactions add column reward_id smallint;

alter table transactions add constraint fk_transactions_rewards
    foreign key (reward_id) references rewards(reward_id);

