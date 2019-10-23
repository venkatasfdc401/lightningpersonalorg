public with sharing class AccountController {
  public static List<Account> getAllActiveAccounts() {
    return [SELECT Id,Name,Active__c FROM Account WHERE Active__c = 'Yes'];
  }
  
    @AuraEnabled(cacheable=true)
    public static List<Account> findAccounts(String searchKey) {
        String key = '%' + searchKey + '%';
        return [SELECT Id, Name, AccountNumber FROM Account WHERE Name LIKE :key  LIMIT 10];
    }

}