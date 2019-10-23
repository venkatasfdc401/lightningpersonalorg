public with sharing class  BoatSearchFormController {
    @AuraEnabled
    public static List<String> getBoatTypes(){
        List<string> options = new List<string>();
        for(BoatType__c bt: [SELECT Id, Name from BoatType__c ORDER BY Name limit 10000]){
            options.add(bt.Name);
        }
        return options;        
    }
}