USE [bank-task];

IF EXISTS(SELECT *
          FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_NAME = 'Cards'
            AND TABLE_SCHEMA = 'dbo')
    DROP TABLE dbo.Cards;

IF EXISTS(SELECT *
          FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_NAME = 'Accounts'
            AND TABLE_SCHEMA = 'dbo')
    DROP TABLE dbo.Accounts;

IF EXISTS(SELECT *
          FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_NAME = 'Clients'
            AND TABLE_SCHEMA = 'dbo')
    DROP TABLE dbo.Clients;

IF EXISTS(SELECT *
          FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_NAME = 'Social_Statuses'
            AND TABLE_SCHEMA = 'dbo')
    DROP TABLE dbo.Social_Statuses;

IF EXISTS(SELECT *
          FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_NAME = 'Branches'
            AND TABLE_SCHEMA = 'dbo')
    DROP TABLE dbo.Branches;

IF EXISTS(SELECT *
          FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_NAME = 'Cities'
            AND TABLE_SCHEMA = 'dbo')
    DROP TABLE dbo.Cities;

IF EXISTS(SELECT *
          FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_NAME = 'Banks'
            AND TABLE_SCHEMA = 'dbo')
    DROP TABLE dbo.Banks;

    
CREATE TABLE dbo.Banks
(
    BankID    int PRIMARY KEY IDENTITY,
    Bank_name nvarchar(40) NOT NULL UNIQUE
);

CREATE TABLE dbo.Cities
(
    CityID    int PRIMARY KEY IDENTITY,
    City_name nvarchar(40) NOT NULL UNIQUE
);

create table dbo.Branches
(
    BranchID    int primary key identity,
    Branch_name nvarchar(30) default ('branch office'),
    Bank_ID     int not null,
    City_Id     int not null,
    constraint FK_Branch_to_Bank foreign key (Bank_ID) references Banks (BankID) on delete cascade,
    constraint FK_Branch_to_City foreign key (City_ID) references Cities (CityID) on delete cascade
);

CREATE TABLE dbo.Social_Statuses
(
    StatusID    int PRIMARY KEY IDENTITY,
    Status_name nvarchar(30) DEFAULT ('Unemployed')
);

CREATE TABLE dbo.Clients
(
    ClientID     int PRIMARY KEY IDENTITY,
    FirstName    nvarchar(30) NOT NULL,
    Surname      nvarchar(30) NOT NULL,
    BirthDate    date         NOT NULL,
    Status_id    int          NOT NULL,
    Phone        nvarchar(12) NOT NULL,
    Email        nvarchar(30) NOT NULL,
    Passport_Num nvarchar(7)  NOT NULL,
    Bank_id      int          NOT NULL,
    constraint CHK_Age CHECK ( datediff(yyyy, BirthDate, getdate()) >= 14),
    constraint FK_Client_to_bank FOREIGN KEY (Bank_id) REFERENCES Banks (BankID) ON DELETE CASCADE,
    constraint FK_Client_to_status FOREIGN KEY (Status_id) REFERENCES Social_Statuses (StatusID) ON DELETE CASCADE
);

CREATE TABLE dbo.Accounts
(
    AccountID int PRIMARY KEY IDENTITY,
    Client_id int NOT NULL,
    Balance   money DEFAULT (0) CHECK (Balance >= 0),
    constraint FK_Account_to_Client FOREIGN KEY (Client_id) REFERENCES Clients (ClientID) ON DELETE CASCADE
);

CREATE TABLE dbo.Cards
(
    CardID       int PRIMARY KEY IDENTITY,
    Card_number  varchar(16) NOT NULL,
    Secret_word  varchar(40) NOT NULL,
    Card_balance money DEFAULT (0) CHECK (Card_balance >= 0),
    Account_id   int         NOT NULL
        constraint UQ_Number UNIQUE (Card_number),
    constraint FK_Card_to_Account FOREIGN KEY (Account_id) REFERENCES Accounts (AccountID) ON DELETE CASCADE
);

insert into dbo.Banks (Bank_name)
values ('Belarusbank'),
       ('Alpha-bank'),
       ('Priorbank'),
       ('Bnb-bank'),
       ('Fransbank');

insert into dbo.Cities(City_name)
values ('Minsk'),
       ('Brest'),
       ('Mogilev'),
       ('Gomel'),
       ('Zaslawye');

insert into dbo.Branches(Branch_name, Bank_ID, City_Id)
values ('Na Lenina',
        (select BankID from dbo.Banks where Bank_name = 'Alpha-bank'),
        (select CityID from dbo.Cities where City_name = 'Minsk')),
       ('Branch num 2',
        (select BankID from dbo.Banks where Bank_name = 'Belarusbank'),
        (select CityID from dbo.Cities where City_name = 'Mogilev')),
       ('Na Sovetskoy',
        (select BankID from dbo.Banks where Bank_name = 'Bnb-bank'),
        (select CityID from dbo.Cities where City_name = 'Zaslawye')),
       ('Main office',
        (select BankID from dbo.Banks where Bank_name = 'Fransbank'),
        (select CityID from dbo.Cities where City_name = 'Minsk')),
       ('Branch num 14',
        (select BankID from dbo.Banks where Bank_name = 'Alpha-bank'),
        (select CityID from dbo.Cities where City_name = 'Brest')),
       ('Na Kamsamola',
        (select BankID from dbo.Banks where Bank_name = 'Priorbank'),
        (select CityID from dbo.Cities where City_name = 'Gomel')),
       ('Branch num 4',
        (select BankID from dbo.Banks where Bank_name = 'Bnb-bank'),
        (select CityID from dbo.Cities where City_name = 'Zaslawye')),
       ('Branch num 14',
        (select BankID from dbo.Banks where Bank_name = 'Priorbank'),
        (select CityID from dbo.Cities where City_name = 'Gomel')),
       ('Na Zaslawskoy',
        (select BankID from dbo.Banks where Bank_name = 'Belarusbank'),
        (select CityID from dbo.Cities where City_name = 'Minsk')),
       ('Branch num 21',
        (select BankID from dbo.Banks where Bank_name = 'Priorbank'),
        (select CityID from dbo.Cities where City_name = 'Brest')),
       ('Branch num 17',
        (select BankID from dbo.Banks where Bank_name = 'Fransbank'),
        (select CityID from dbo.Cities where City_name = 'Zaslawye'))
;

insert into dbo.Social_Statuses(Status_name)
values ('Student'),
       ('Retire'),
       ('Disabled'),
       ('Employed')
;

insert into dbo.Clients(FirstName, Surname, BirthDate, Phone, Email, Passport_Num, Bank_id, Status_id)
values ('Alex',
        'Ivanov',
        '1998-10-20',
        '80294445566',
        'hjhjhhj@email.com',
        '1234567',
        (select BankID from dbo.Banks where Bank_name = 'Priorbank'),
        (select StatusID from dbo.Social_Statuses where Status_name = 'Employed')),
       ('Anna',
        'Kirovca',
        '2001-07-31',
        '80255558877',
        'lklklklk@email.com',
        '7654321',
        (select BankID from dbo.Banks where Bank_name = 'Alpha-bank'),
        (select StatusID from dbo.Social_Statuses where Status_name = 'Student')),
       ('Ivan',
        'Tkac',
        '1956-01-12',
        '80172223311',
        'jfjfjfjf@email.com',
        '5674321',
        (select BankID from dbo.Banks where Bank_name = 'Belarusbank'),
        (select StatusID from dbo.Social_Statuses where Status_name = 'Retire')),
       ('Ivona',
        'Marek',
        '1997-12-10',
        '80339998877',
        'gfgfgfgf@email.com',
        '2576413',
        (select BankID from dbo.Banks where Bank_name = 'Bnb-bank'),
        (select StatusID from dbo.Social_Statuses where Status_name = 'Disabled')),
       ('Aleksandra',
        'Lina',
        '1966-03-26',
        '375296662211',
        'kokokok@email.com',
        '2573146',
        (select BankID from dbo.Banks where Bank_name = 'Fransbank'),
        (select StatusID from dbo.Social_Statuses where Status_name = 'Retire')),
       ('Valeria',
        'Pivon',
        '2003-09-20',
        '80339994455',
        'tgtgtggt@email.com',
        '1736254',
        (select BankID from dbo.Banks where Bank_name = 'Priorbank'),
        (select StatusID from dbo.Social_Statuses where Status_name = 'Student')),
       ('Inna',
        'Alekseeva',
        '1998-05-01',
        '80332224477',
        'sdsdsdsd@email.com',
        '2315647',
        (select BankID from dbo.Banks where Bank_name = 'Fransbank'),
        (select StatusID from dbo.Social_Statuses where Status_name = 'Employed')),
       ('Igor',
        'Pan',
        '1975-10-27',
        '80178897744',
        'vbvbvb@email.com',
        '6425317',
        (select BankID from dbo.Banks where Bank_name = 'Alpha-bank'),
        (select StatusID from dbo.Social_Statuses where Status_name = 'Employed'))
;

insert into dbo.Accounts(Client_id, Balance)
values ((select ClientID from dbo.Clients where FirstName = 'Alex' And Surname = 'Ivanov'),
        1114.32),
       ((select ClientID from dbo.Clients where FirstName = 'Anna' And Surname = 'Kirovca'),
        57.27),
       ((select ClientID from dbo.Clients where FirstName = 'Ivan' And Surname = 'Tkac'),
        210.3),
       ((select ClientID from dbo.Clients where FirstName = 'Ivona' And Surname = 'Marek'),
        122.2),
       ((select ClientID from dbo.Clients where FirstName = 'Aleksandra' And Surname = 'Lina'),
        3210.14),
       ((select ClientID from dbo.Clients where FirstName = 'Valeria' And Surname = 'Pivon'),
        96.52),
       ((select ClientID from dbo.Clients where FirstName = 'Inna' And Surname = 'Alekseeva'),
        311.98),
       ((select ClientID from dbo.Clients where FirstName = 'Igor' And Surname = 'Pan'),
        550.72);

insert into dbo.Cards(Card_number, Secret_word, Card_balance, Account_id)
values ('0832091096406677',
        'Baranavichy',
        15.2,
        (select AccountID
         from dbo.Accounts
         where Client_id = (select ClientID from dbo.Clients where FirstName = 'Alex' And Surname = 'Ivanov'))),
       ('5400699797067285 ',
        'Kiril',
        0,
        (select AccountID
         from dbo.Accounts
         where Client_id = (select ClientID from dbo.Clients where FirstName = 'Anna' And Surname = 'Kirovca'))),
       ('1048527258760025',
        'milk',
        21,
        (select AccountID
         from dbo.Accounts
         where Client_id = (select ClientID from dbo.Clients where FirstName = 'Ivan' And Surname = 'Tkac'))),
       ('4312865323996519',
        'martini',
        2,
        (select AccountID
         from dbo.Accounts
         where Client_id = (select ClientID from dbo.Clients where FirstName = 'Ivona' And Surname = 'Marek'))),
       ('8416739285262533',
        'Krishneva',
        57.65,
        (select AccountID
         from dbo.Accounts
         where Client_id = (select ClientID from dbo.Clients where FirstName = 'Aleksandra' And Surname = 'Lina'))),
       ('2045479879723252',
        'money',
        12.1,
        (select AccountID
         from dbo.Accounts
         where Client_id = (select ClientID from dbo.Clients where FirstName = 'Valeria' And Surname = 'Pivon'))),
       ('0841689480209425',
        'One piece',
        6,
        (select AccountID
         from dbo.Accounts
         where Client_id = (select ClientID from dbo.Clients where FirstName = 'Inna' And Surname = 'Alekseeva'))),
       ('5321695326303010',
        'Spain',
        125,
        (select AccountID
         from dbo.Accounts
         where Client_id = (select ClientID from dbo.Clients where FirstName = 'Igor' And Surname = 'Pan')))
;