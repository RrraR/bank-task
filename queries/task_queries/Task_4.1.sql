USE [bank-task];

-- select [bank-task].dbo.Social_Statuses.Status_name, COUNT([bank-task].dbo.Cards.CardID) as CardCount
-- from [bank-task].dbo.Cards
--          LEFT JOIN [bank-task].dbo.Accounts ON Accounts.AccountID = Cards.Account_id
--          LEFT JOIN [bank-task].dbo.Clients ON Clients.ClientID = Accounts.Client_id
--          RIGHT JOIN [bank-task].dbo.Social_Statuses on Social_Statuses.StatusID = Clients.Status_id
-- GROUP BY [bank-task].dbo.Social_Statuses.StatusID, [bank-task].dbo.Social_Statuses.Status_name

SELECT SStatus.Status_name, COUNT(Cards.CardID) as Card_count
FROM dbo.Cards
    LEFT JOIN Accounts Account on Account.AccountID = Cards.Account_id
    LEFT JOIN Clients Client on Client.ClientID = Account.Client_id
    LEFT JOIN Social_Statuses SStatus on SStatus.StatusID = Client.Status_id
GROUP BY SStatus.Status_name 
