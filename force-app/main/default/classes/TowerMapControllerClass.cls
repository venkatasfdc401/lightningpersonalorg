public inherited sharing class TowerMapControllerClass {
     @AuraEnabled
     public static List<Tower__c> getAllTowers() {
          String theObject = 'Tower__c';
          List<String> theFields = new List<String>{'Id', 'Name', 'State__r.Name','Tower_Location__latitude__s','Tower_Location__longitude__s'};//'Tower_Location__c'
          List<String> theFilters = new List<String>();  //empty filter list
          String sortField = 'Name';
          String sortOrder = 'ASC';
          List<Tower__c> allTowers = UtilityClass.queryObjects(theObject, theFields, theFilters, sortField, sortOrder);
          System.debug('allTowers '+allTowers);
          return allTowers;
     }
}