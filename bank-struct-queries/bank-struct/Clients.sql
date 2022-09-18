﻿-- create table [bank-task].dbo.Clients
-- (
--     ClientID     int primary key identity,
--     FirstName    nvarchar(30) not null,
--     Surname      nvarchar(30) not null,
--     BirthDate    date         not null,
--     Status_id    int          not null,
--     Phone        nvarchar(12) not null,
--     Email        nvarchar(30) not null,
--     Passport_Num nvarchar(7)  not null,
--     Bank_id      int          not null,
--     constraint CHK_Age check ( datediff(yyyy, BirthDate, getdate()) >= 14),
--     constraint FK_Client_to_bank foreign key (Bank_id) references Banks (BankID) on delete cascade,
--     constraint FK_Client_to_status foreign key (Status_id) references Social_Statuses (StatusID) on delete cascade
-- );

insert into [bank-task].dbo.Clients(FirstName, Surname, BirthDate, Phone, Email, Passport_Num, Bank_id, Status_id)
values ('Alex',
        'Ivanov',
        '1998-10-20',
        '80294445566',
        'hjhjhhj@email.com',
        '1234567',
        (select BankID from [bank-task].dbo.Banks where Bank_name = 'Priorbank'),
        (select StatusID from [bank-task].dbo.Social_Statuses where Status_name = 'Employed')),
       ('Anna',
        'Kirovca',
        '2001-07-31',
        '80255558877',
        'lklklklk@email.com',
        '7654321',
        (select BankID from [bank-task].dbo.Banks where Bank_name = 'Alpha-bank'),
        (select StatusID from [bank-task].dbo.Social_Statuses where Status_name = 'Student')),
       ('Ivan',
        'Tkac',
        '1956-01-12',
        '80172223311',
        'jfjfjfjf@email.com',
        '5674321',
        (select BankID from [bank-task].dbo.Banks where Bank_name = 'Belarusbank'),
        (select StatusID from [bank-task].dbo.Social_Statuses where Status_name = 'Retire')),
       ('Ivona',
        'Marek',
        '1997-12-10',
        '80339998877',
        'gfgfgfgf@email.com',
        '2576413',
        (select BankID from [bank-task].dbo.Banks where Bank_name = 'Bnb-bank'),
        (select StatusID from [bank-task].dbo.Social_Statuses where Status_name = 'Disabled')),
       ('Alecsandra',
        'Lina',
        '1966-03-26',
        '375296662211',
        'kokokok@email.com',
        '2573146',
        (select BankID from [bank-task].dbo.Banks where Bank_name = 'Fransbank'),
        (select StatusID from [bank-task].dbo.Social_Statuses where Status_name = 'Retire')),
       ('Valeria',
        'Pivon',
        '2003-09-20',
        '80339994455',
        'tgtgtggt@email.com',
        '1736254',
        (select BankID from [bank-task].dbo.Banks where Bank_name = 'Priorbank'),
        (select StatusID from [bank-task].dbo.Social_Statuses where Status_name = 'Student')),
       ('Inna',
        'Alekseeva',
        '1998-05-01',
        '80332224477',
        'sdsdsdsd@email.com',
        '2315647',
        (select BankID from [bank-task].dbo.Banks where Bank_name = 'Fransbank'),
        (select StatusID from [bank-task].dbo.Social_Statuses where Status_name = 'Employed')),
       ('Igor',
        'Pan',
        '1975-10-27',
        '80178897744',
        'vbvbvb@email.com',
        '6425317',
        (select BankID from [bank-task].dbo.Banks where Bank_name = 'Alpha-bank'),
        (select StatusID from [bank-task].dbo.Social_Statuses where Status_name = 'Employed'))
;