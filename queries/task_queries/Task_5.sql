CREATE PROCEDURE AddTenDollars @status nvarchar(8)
AS
begin
    begin try
        if @status <= 0 or @status > (select max(StatusID) from [bank-task].dbo.Social_Status) or @status is null
            throw 51000, 'Error, social status code is invalid', 1;
        select StatusID, Status_name
        from [bank-task].dbo.Social_Status
        where (IsNumeric(@status + '0e0') = 1)
          And StatusID = (select @status)
        update [bank-task].dbo.Accounts
        set Balance = Balance + 10
        where Accounts.AccountID = any (SELECT AccountID
                                        from [bank-task].dbo.Social_Status,
                                             [bank-task].dbo.Clients,
                                             [bank-task].dbo.Accounts
                                        where Social_status.StatusID = @status
                                          and Social_status.StatusID = Clients.Status_id
                                          and Accounts.Client_id = Clients.ClientID)
    end try
    begin catch
        throw
    end catch
end


exec AddTenDollars @status = '2'