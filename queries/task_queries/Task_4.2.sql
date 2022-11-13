USE [bank-task]

SELECT dbo.Social_Statuses.Status_name,
       (SELECT COUNT(*)
        FROM dbo.Cards,
             dbo.Accounts,
             dbo.Clients
        WHERE Cards.Account_id = Accounts.AccountID
          AND Accounts.Client_id = Clients.ClientID
          AND Clients.Status_id = dbo.Social_Statuses.StatusID) AS Card_Count
FROM dbo.Social_Statuses