create table o_address (
  id                        smallint not null auto_increment,
  line_1                    varchar(100),
  line_2                    varchar(100),
  city                      varchar(100),
  country_code              varchar(2),
  cretime                   datetime,
  updtime                   datetime,
  constraint pk_o_address primary key (id))
;

create table o_country (
  code                      varchar(2) not null,
  name                      varchar(60),
  constraint pk_o_country primary key (code))
;

create table o_customer (
  id                        integer not null auto_increment,
  status                    varchar(1),
  name                      varchar(40) not null,
  billing_address_id        smallint,
  shipping_address_id       smallint,
  cretime                   datetime,
  updtime                   datetime,
  constraint ck_o_customer_status check (status in ('N','I','A')),
  constraint pk_o_customer primary key (id))
;

create table o_order (
  id                        integer not null auto_increment,
  status                    varchar(8),
  order_date                date,
  ship_date                 date,
  kcustomer_id              integer not null,
  cretime                   datetime,
  updtime                   datetime,
  constraint ck_o_order_status check (status in ('NEW','APPROVED','SHIPPED','COMPLETE')),
  constraint pk_o_order primary key (id))
;

create table o_order_detail (
  id                        integer not null auto_increment,
  order_qty                 integer,
  ship_qty                  integer,
  cretime                   datetime,
  order_id                  integer,
  product_id                integer,
  updtime                   datetime,
  constraint pk_o_order_detail primary key (id))
;

create table o_product (
  id                        integer not null auto_increment,
  sku                       varchar(20),
  name                      varchar(255),
  cretime                   datetime,
  updtime                   datetime,
  constraint pk_o_product primary key (id))
;

create table vehicle (
  DTYPE                     varchar(14) not null,
  id                        integer not null auto_increment,
  license                   varchar(255),
  version                   integer,
  driver                    varchar(255),
  capacity                  integer,
  constraint pk_vehicle primary key (id))
;

alter table o_address add constraint fk_o_address_country_1 foreign key (country_code) references o_country (code) on delete restrict on update restrict;
create index ix_o_address_country_1 on o_address (country_code);
alter table o_customer add constraint fk_o_customer_billingAddress_2 foreign key (billing_address_id) references o_address (id) on delete restrict on update restrict;
create index ix_o_customer_billingAddress_2 on o_customer (billing_address_id);
alter table o_customer add constraint fk_o_customer_shippingAddress_3 foreign key (shipping_address_id) references o_address (id) on delete restrict on update restrict;
create index ix_o_customer_shippingAddress_3 on o_customer (shipping_address_id);
alter table o_order add constraint fk_o_order_customer_4 foreign key (kcustomer_id) references o_customer (id) on delete restrict on update restrict;
create index ix_o_order_customer_4 on o_order (kcustomer_id);
alter table o_order_detail add constraint fk_o_order_detail_order_5 foreign key (order_id) references o_order (id) on delete restrict on update restrict;
create index ix_o_order_detail_order_5 on o_order_detail (order_id);
alter table o_order_detail add constraint fk_o_order_detail_product_6 foreign key (product_id) references o_product (id) on delete restrict on update restrict;
create index ix_o_order_detail_product_6 on o_order_detail (product_id);

