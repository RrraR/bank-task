create table [bank-task].dbo.Cards
(
    CardID       int primary key identity,
    Card_number  varchar(16) not null,
    Secret_word  varchar(40) not null,
    Card_balance money default (0) check (Card_balance >= 0),
    Account_id   int         not null
    constraint UQ_Number UNIQUE (Card_number),
    constraint FK_Card_to_Account foreign key (Account_id) references Accounts (AccountID) on delete cascade
);

insert into [bank-task].dbo.Cards(Card_number, Secret_word, Card_balance, Account_id)
values ('0832091096406677',
        'Baranavichy',
        15.2,
        (select AccountID
         from [bank-task].dbo.Accounts
         where Client_id = (select ClientID from [bank-task].dbo.Clients where FirstName = 'Alex' And Surname = 'Ivanov'))),
       ('5400699797067285 ',
        'Kiril',
        0,
        (select AccountID
         from [bank-task].dbo.Accounts
         where Client_id = (select ClientID from [bank-task].dbo.Clients where FirstName = 'Anna' And Surname = 'Kirovca'))),
       ('1048527258760025',
        'milk',
        21,
        (select AccountID
         from [bank-task].dbo.Accounts
         where Client_id = (select ClientID from [bank-task].dbo.Clients where FirstName = 'Ivan' And Surname = 'Tkac'))),
       ('4312865323996519',
        'martini',
        2,
        (select AccountID
         from [bank-task].dbo.Accounts
         where Client_id = (select ClientID from [bank-task].dbo.Clients where FirstName = 'Ivona' And Surname = 'Marek'))),
       ('8416739285262533',
        'Krishneva',
        57.65,
        (select AccountID
         from [bank-task].dbo.Accounts
         where Client_id = (select ClientID from [bank-task].dbo.Clients where FirstName = 'Alecsandra' And Surname = 'Lina'))),
       ('2045479879723252',
        'money',
        12.1,
        (select AccountID
         from [bank-task].dbo.Accounts
         where Client_id = (select ClientID from [bank-task].dbo.Clients where FirstName = 'Valeria' And Surname = 'Pivon'))),
       ('0841689480209425',
        'One piece',
        6,
        (select AccountID
         from [bank-task].dbo.Accounts
         where Client_id = (select ClientID from [bank-task].dbo.Clients where FirstName = 'Inna' And Surname = 'Alekseeva'))),
       ('5321695326303010',
        'Spain',
        125,
        (select AccountID
         from [bank-task].dbo.Accounts
         where Client_id = (select ClientID from [bank-task].dbo.Clients where FirstName = 'Igor' And Surname = 'Pan')))
;