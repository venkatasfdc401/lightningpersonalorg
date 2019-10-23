public with sharing class CampingListController {
	@AuraEnabled
    public static List<Camping_Item__c> getItems() {
        // Perform isAccessible() checking first, then
        return [SELECT Id, Name, Quantity__c,Packed__c,Price__c 
                FROM Camping_Item__c];
    }
    
    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c Item) {
        // Perform isUpdatable() checking first, then
        upsert Item;
        return Item;
    }
}