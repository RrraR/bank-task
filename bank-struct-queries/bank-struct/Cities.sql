create table [bank-task].dbo.Cities(
    CityID int primary key identity,
    City_name nvarchar(40) not null unique 
);

insert into [bank-task].dbo.Cities(City_name)
values
    ('Minsk'),
    ('Brest'),
    ('Mogilev'),
    ('Gomel'),
    ('Zaslawye');