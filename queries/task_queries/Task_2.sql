select Client.FirstName,
       Client.Surname,
       [bank-task].dbo.Cards.Card_balance,
       Bank.Bank_name
From [bank-task].dbo.Cards
         join [bank-task].dbo.Accounts A on A.AccountID = Cards.Account_id
         join (select ClientID, Bank_id, FirstName, Surname from [bank-task].dbo.Clients) Client
              on Client.ClientID = A.Client_id
         join (select BankID, Bank_name from [bank-task].dbo.Banks) Bank 
             on  Bank.BankID = Client.Bank_id