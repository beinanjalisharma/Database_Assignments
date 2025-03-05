create table customers211(customer_id int primary key,
customer_name varchar(30),
email varchar (30),
PhoneNumber bigint);

create table Accountss21(account_id int primary key,
customer_id int foreign key (customer_id)references  customers(customer_id),
accountNumber int,
balance decimal(10,2),
account_type  varchar (30) );


create table Transactions21(transaction_id identity (1,1) primary key ,
account_id int foreign key (account_id) references accountss(account_id),
TransactionType varchar(30),
Amount bigint ,
TransactionDate date);


create table AuditTransactions(audit_id int primary key,
account_id int foreign key (account_id) references accountss(account_id),
Amount bigint,
TransactionDate date,
Action varchar(30));
--------------------------------------------------------------------------------------------------------------
--task 1--
create nonclustered index idx_customer_name on customers211(customer_name);

--composite index
create index idx on transactions21(TransactionDate,Amount);

--unique index
create unique index  idx on Accountss21(AccountNumber);

------------------------------------------------------------------------------------------------------------------
--Task 2
--create scaler function
create function fn_interst
(
@account_id int

) 
returns  decimal(10,2)
as 
begin
declare @result decimal (10,2);

set @result=0.05 * result * balance ;

return @result;
end;
------------------------------------------------------------------------------------------------------------------
--Task3
create procedure sp_transfermoney 
@fromaccount_id int,
@toaccount_id int,
@amount int
as
begin
 declare  @frombalance decimal (10,2);
 select @frombalance = balance from  Accountss21 where account_id = @fromaccount_id;
 if  @frombalance  > @amount 
 begin 
 print 'insufficient balance.....'
 end
 else
 update  Accountss21
 set balance = balance - @amount
 where account_id = @fromaccount_id;

 update  Accountss21
 set balance = balance + @amount
 where  account_id = @toaccount_id;
 end

------------------------------------------------------------------------------------------------------------------
 --task 4

 create trigger prevent_overdraft on Acountss21
 instead of update 
 as
 begin 
  declare @balance int 
  declare @currentBalance int
   declare @account_id int
   select @account_id = account_id from inserted
   select @currentBalance = balance  where account_id  = @account_id
  select @balance = balance from inserted


  if @balance < 0 and @balance < @currentBalance
  begin 
  print 'insufficient funds!..Transaction Aborted....'
  end ;
  else
  begin
    insert into AuditTransactions(audit_id ,
account_id ,
Amount,
TransactionDate ,
Action )
select  account_id,amount, getdate(),'updated' from inserted;
end;
end;

------------------------------------------------------------------------------------------------------------------------------------
--task 5
create trigger addTransactionLog on Transactions21
after insert 
as
begin 
insert into AuditTransactions(audit_id ,
account_id ,
Amount,
TransactionDate ,
Action )
select account_id,
amount ,
TransactionDate ,'updated'
from inserted;

 










