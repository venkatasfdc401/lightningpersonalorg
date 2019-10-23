public with sharing class Account_DynamicADDDELMOD {
    @AuraEnabled
    public static void SaveAccounts(List<Account> accList){
        List<Account> InsertAcclist = new List<Account>();
        List<Account> updateAcclist = new List<Account>();
        for(Account acc: accList){
            if(acc.id == null){
                InsertAcclist.add(acc);
            }
            else {
                updateAcclist.add(acc);
            }
        }
        insert InsertAcclist;
        update updateAcclist;
        
    }
    @AuraEnabled
    public static List<Account> getAccountrecords(){
        List<Account> Acctlist = new List<Account>();
        for (account acc: [select id,Name,Accountnumber,Phone from Account limit 1000]){
             Acctlist.add(acc);
        }
        return Acctlist;
    }
}