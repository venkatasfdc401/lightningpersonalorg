@RestResource(urlMapping='/secureApexRest')


global with sharing class SecureApexRest {
public class FunctionalException extends Exception{}
public class SecurityException extends Exception{}
    @HttpGet
    global static Contact doGet(){
        Id recordId = RestContext.request.params.get('id');
        Contact result;
        if (recordId == null){
            throw new FunctionalException('Id parameter is required');
        }
        List<contact> results;
        try{
        
            results = [SELECT id, Name, Secret_Key__c FROM Contact WHERE Id = :recordId WITH SECURITY_ENFORCED];
        }
        catch(QueryException e){
        }
        
        if (!results.isEmpty()) {
                result = results[0];
        }
        return result;
    }
    
}