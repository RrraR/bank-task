create table [bank-task].dbo.Branches
(
    BranchID    int primary key identity,
    Branch_name nvarchar(30) default ('branch office'),
    Bank_ID     int not null,
    City_Id     int not null,
    constraint FK_Branch_to_Bank foreign key (Bank_ID) references Banks (BankID) on delete cascade,
    constraint FK_Branch_to_City foreign key (City_ID) references Cities (CityID) on delete cascade
);

insert into [bank-task].dbo.Branches(Branch_name, Bank_ID, City_Id)
values 
    (
        'Na Lenina',
        (select BankID from [bank-task].dbo.Banks where Bank_name = 'Alpha-bank'),
        (select CityID from [bank-task].dbo.Cities where City_name = 'Minsk')
    ),
    (
        'Branch num 2',
        (select BankID from [bank-task].dbo.Banks where Bank_name = 'Belarusbank'),
        (select CityID from [bank-task].dbo.Cities where City_name = 'Mogilev')
    ),
    (
        'Na Sovetskoy',
        (select BankID from [bank-task].dbo.Banks where Bank_name = 'Bnb-bank'),
        (select CityID from [bank-task].dbo.Cities where City_name = 'Zaslawye')
    ),
    (
        'Main office',
        (select BankID from [bank-task].dbo.Banks where Bank_name = 'Fransbank'),
        (select CityID from [bank-task].dbo.Cities where City_name = 'Minsk')
    ),
    (
        'Branch num 14',
        (select BankID from [bank-task].dbo.Banks where Bank_name = 'Alpha-bank'),
        (select CityID from [bank-task].dbo.Cities where City_name = 'Brest')
    ),
    (
        'Na Kamsamola',
        (select BankID from [bank-task].dbo.Banks where Bank_name = 'Priorbank'),
        (select CityID from [bank-task].dbo.Cities where City_name = 'Gomel')
    ),
    (
        'Branch num 4',
        (select BankID from [bank-task].dbo.Banks where Bank_name = 'Bnb-bank'),
        (select CityID from [bank-task].dbo.Cities where City_name = 'Zaslawye')
    ),
    (
        'Branch num 14',
        (select BankID from [bank-task].dbo.Banks where Bank_name = 'Priorbank'),
        (select CityID from [bank-task].dbo.Cities where City_name = 'Gomel')
    ),
    (
        'Na Zaslawskoy',
        (select BankID from [bank-task].dbo.Banks where Bank_name = 'Belarusbank'),
        (select CityID from [bank-task].dbo.Cities where City_name = 'Minsk')
    ),
    (
        'Branch num 21',
        (select BankID from [bank-task].dbo.Banks where Bank_name = 'Priorbank'),
        (select CityID from [bank-task].dbo.Cities where City_name = 'Brest')
    ),
    (
        'Branch num 17',
        (select BankID from [bank-task].dbo.Banks where Bank_name = 'Fransbank'),
        (select CityID from [bank-task].dbo.Cities where City_name = 'Zaslawye')
    )
;