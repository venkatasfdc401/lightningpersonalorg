@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountManager{
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String AccountId = request.requestURI.substring(
          request.requestURI.lastIndexOf('/Accounts/'));
        AccountId = AccountId.substringBetween('/Accounts/', '/contacts');  
        system.debug('accountid '+AccountId);   
        Account result =  [SELECT Id,Name,(Select Id,name from Contacts) from Account
                        WHERE Id =:AccountId];
        return result;
    }
}