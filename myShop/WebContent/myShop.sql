create table product (
productId varchar(50) primary key,
productName varchar(20) not null,
productContent varchar(2048) not null,
price int not null
);

insert into product values (?, ?, ?, ?);

select * from product;

update product set productName=?, productContent=?, price=? where productId=?

delete from product where productId=?

select * from product where productId LIKE ? or productName LIKE ? or productContent LIKE ? or price LIKE ?