create trigger accounts_update
    on [bank-task].dbo.Accounts
    instead of update
    as
begin
    declare @changedBalance money, @totalCardsBalance money
    select @changedBalance = (select Balance
                              from inserted)
    select @totalCardsBalance = (select SUM([bank-task].dbo.Cards.Card_balance) as total_balance
                                 from [bank-task].dbo.Cards
                                 where Cards.Account_id = (select inserted.AccountID
                                                           from inserted)
                                 group by Cards.Account_id)
    update [bank-task].dbo.Accounts
    set Balance = @changedBalance
    where AccountID = all (select inserted.AccountID
                           from inserted)
      and @changedBalance >= @totalCardsBalance

    if @@ROWCOUNT = 0
        print 'Warning: No rows were updated';
    else
        print 'Balance was updated successfully';
end