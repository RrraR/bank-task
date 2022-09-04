create table [bank-task].dbo.Banks(
    BankID int primary key identity,
    Bank_name nvarchar(40) not null unique
);


insert into [bank-task].dbo.Banks (Bank_name)
values 
    ('Belarusbank'),
    ('Alpha-bank'),
    ('Priorbank'),
    ('Bnb-bank'),
    ('Fransbank');