create table [bank-task].dbo.Accounts
(
    AccountID int primary key identity,
    Client_id int not null,
    Balance   money default (0) check (Balance >= 0),
    constraint FK_Account_to_Client foreign key (Client_id) references Clients (ClientID) on delete cascade
);

insert into [bank-task].dbo.Accounts(Client_id, Balance)
values ((select ClientID from [bank-task].dbo.Clients where FirstName = 'Alex' And Surname = 'Ivanov'),
        1114.32),
       ((select ClientID from [bank-task].dbo.Clients where FirstName = 'Anna' And Surname = 'Kirovca'),
        57.27),
       ((select ClientID from [bank-task].dbo.Clients where FirstName = 'Ivan' And Surname = 'Tkac'),
        210.3),
       ((select ClientID from [bank-task].dbo.Clients where FirstName = 'Ivona' And Surname = 'Marek'),
        122.2),
       ((select ClientID from [bank-task].dbo.Clients where FirstName = 'Alecsandra' And Surname = 'Lina'),
        3210.14),
       ((select ClientID from [bank-task].dbo.Clients where FirstName = 'Valeria' And Surname = 'Pivon'),
        96.52),
       ((select ClientID from [bank-task].dbo.Clients where FirstName = 'Inna' And Surname = 'Alekseeva'),
        311.98),
       ((select ClientID from [bank-task].dbo.Clients where FirstName = 'Igor' And Surname = 'Pan'),
        550.72);