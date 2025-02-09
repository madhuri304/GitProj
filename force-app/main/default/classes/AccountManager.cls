@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {

    @HttpGet 
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
        Account result = [Select Id,Name,(Select ID, FirstName, LastName from Contacts) from Account where Id = :accountId];
        return result;
    }
}