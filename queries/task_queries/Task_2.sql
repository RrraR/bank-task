USE [bank-task];

SELECT concat(FirstName, ' ', Surname) as Client_fullname, Card_balance, Bank_name
FROM dbo.Clients
         join Accounts Account on Clients.ClientID = Account.Client_id
         join Cards Card on Account.AccountID = Card.Account_id
         join Banks Bank on Bank.BankID = Clients.Bank_id