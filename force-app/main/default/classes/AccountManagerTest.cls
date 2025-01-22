@isTest
private class AccountManagerTest {

     @isTest
    static void testGetAccount()
    {
        Account a = new Account(Name='TestAccount');
        insert a;
        Contact c = new Contact(AccountId=a.Id,FirstName='Test',LastName='Test');
        insert c;
        
        RestRequest request = new RestRequest();
        request.requestUri='https://yourInstance.salesforce.com/services/apexrest/Accounts'+a.id+'/contacts';
        request.httpMethod = 'GET';
        RestContext.Request = request;
        
        Account myAccount = AccountManager.getAccount();
        System.assert(myAccount != null);
        System.assertEquals('TestAccount', myAccount.Name);
        
    }
}