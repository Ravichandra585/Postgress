create database sunkavalli_retail_db;

create user sunkavalli_retail_user with encrypted password 'sunkavalli@12345';

grant all on database sunkavalli_retail_db to sunkavalli_retail_user;