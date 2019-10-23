public class classController {
// create properties in apex class
 @AuraEnabled private String DeveloperName {get;set;}
 @AuraEnabled public integer DeveloperAge {get;set;}
 @auraEnabled public List<account> lstOfAccount{get;set;}
 
@AuraEnabled
  public static classController initClass(){
     //create class instance
  classController obj = new classController();
     //set value in class properties
   obj.DeveloperName = 'Piyush soni';
   obj.DeveloperAge = 19 ;
 
   // query accounts list for lstOfAccount property
   obj.lstOfAccount = [select id,name from account LIMIT 10];
 
   // return class instance
   return obj ;
   }
}