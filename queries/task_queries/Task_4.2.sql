SELECT [bank-task].dbo.Social_Status.Status_name,
       (SELECT COUNT(*)
        FROM [bank-task].dbo.Cards, [bank-task].dbo.Accounts, [bank-task].dbo.Clients
        WHERE Cards.Account_id = Accounts.AccountID
          AND Accounts.Client_id = Clients.ClientID
          AND Clients.Status_id = [bank-task].dbo.Social_Status.StatusID) AS CardsCount
FROM [bank-task].dbo.Social_Status