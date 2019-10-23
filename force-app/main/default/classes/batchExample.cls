global class batchExample implements Database.Batchable<sObject> {
    /**
        * Webkul Software.
        *
        * @category  Webkul
        * @author    Webkul
        * @copyright Copyright (c) 2010-2016 Webkul Software Private Limited (https://webkul.com)
        * @license   https://store.webkul.com/license.html
    */
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
         
        String query = 'SELECT Id,Name FROM Account';
        return Database.getQueryLocator(query);
    }
     
    global void execute(Database.BatchableContext BC, List<Account> accList) {
        
        // process each batch of records
 
         
        for(Account acc : accList)
        {        
            if(acc.Name.contains('Webkul')){
                  
               acc.Name = acc.Name.replace('Webkul','');
               
            }
            // Update the Account Name 
            else {
                acc.Name = acc.Name + ' Webkul';
            }    
            
        }
        try {
            // Update the Account Record
            update accList;
         
        } catch(Exception e) {
            System.debug(e);
        }
          
    }   
     
    global void finish(Database.BatchableContext BC) {
        Boolean Runnormaljob = false;
        Boolean hasjobscheduled = false;
        set<Id> customjobstoabort = new set<id>();
        for (CronTrigger job : [select Id,CronJobDetail.Name from CronTrigger where CronJobDetail.Name like '%schedulableexample_custom_%' ]) { 
			customjobstoabort.add(job.id);
        }
      	for(Period__c prd: [SELECT Id, StartDate__c, EndDate__c,End_Time__C FROM Period__c where type__c ='Quarter' and EndDate__c = today]){
            if(system.now().hour() > prd.End_Time__C.hour() && customjobstoabort.size()>0){
                Runnormaljob = true;
                break;
            }    
        }
        for(id idval : customjobstoabort){
            if(Runnormaljob)system.abortJob(idval);
            
        }
        if(Runnormaljob){
            schedulableexample se  = new schedulableexample();
            se.execute(null); 
        }
    }
}