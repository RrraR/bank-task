USE [bank-task];

SELECT AccountID, (Balance - SUM(Card.Card_balance)) as Balance_difference
FROM dbo.Accounts
         left join Cards Card on Accounts.AccountID = Card.Account_id
GROUP BY  Balance, AccountID 