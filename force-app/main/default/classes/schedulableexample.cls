global class schedulableexample implements Schedulable {

    global void execute(SchedulableContext ctx) {
        Boolean hasjobscheduled = false;
        Boolean isQuarterend = false;
        Set<Id> cusjobstoterminate = new Set<Id>();
        Set<Id> jobstoterminate = new Set<Id>();
        Map<string,set<id>> jobmap = new Map<string,set<id>>();
        
        for (CronTrigger job : [select Id,CronJobDetail.Name from CronTrigger where CronJobDetail.Name like 
                                           '%schedulableexample_Regular_%' OR CronJobDetail.Name like '%schedulableexample_custom_%' ]) { 
                                             

                       if(!jobmap.isEmpty()){                  
                            if(jobmap.containsKey('schedulableexample_custom_')){
                                 jobmap.get('schedulableexample_custom_').add(job.id);
    
                            }
                            if(jobmap.containsKey('schedulableexample_regular_')){
                                 jobmap.get('schedulableexample_regular_').add(job.id);
    
                            }
                       }
                       else {
                           if(job.CronJobDetail.Name.contains('schedulableexample_custom_')){
                               jobmap.put('schedulableexample_custom_', new set<id>{job.id});     
                           }
                           if(job.CronJobDetail.Name.contains('schedulableexample_regular_')){
                               jobmap.put('schedulableexample_regular_', new set<id>{job.id});     
                           }
                        }
            hasjobscheduled = true;
        }
        for(Period__c prd: [SELECT Id, StartDate__c, EndDate__c,End_Time__C FROM Period__c where type__c ='Quarter' and EndDate__c = today]){
    	
    		if(system.now().hour() == prd.End_Time__C.hour()){
                isQuarterend = true;
                break;
            }    
        }
        if(!isQuarterend){
            if(!jobmap.isempty() && jobmap.containskey('schedulableexample_custom_')){
                for(id jbid: jobmap.get('schedulableexample_custom_')){
                    System.abortJob(jbid); 
                }
            }    
            integer i= 0;
            while(i < 30){ 
               i = i+30;
                if(!jobmap.isempty() && !jobmap.containskey('schedulableexample_regular_')){
                   system.schedule('schedulableexample_regular_'+system.now()+'_'+i, '0 '+i+' * * * ?', new schedulableexample()); 
                }
                else if(jobmap.isempty() || !jobmap.containskey('schedulableexample_regular_')){
                   system.schedule('schedulableexample_regular_'+system.now()+'_'+i, '0 '+i+' * * * ?', new schedulableexample()); 
                }
               
            }
        }
        system.debug('jobmap '+jobmap);
        if(isQuarterend ){
            if(!jobmap.isempty() && jobmap.containskey('schedulableexample_regular_')){
                for(id jbid: jobmap.get('schedulableexample_regular_')){
                    System.abortJob(jbid); 
                }
            }                
            integer i= 0;
            while(i <55){ 
               i = i+5;
               if(!jobmap.isempty() && !jobmap.containskey('schedulableexample_custom_')){
                   system.schedule('schedulableexample_custom_'+system.now()+'_'+i, '0 '+i+' * * * ?', new schedulableexample()); 
                }
                else if(jobmap.isempty() || !jobmap.containskey('schedulableexample_custom_')){
                   system.schedule('schedulableexample_custom_'+system.now()+'_'+i, '0 '+i+' * * * ?', new schedulableexample()); 
                }
            }
        } 
        else {
            batchExample be = new batchExample();
            Database.executebatch(be);
        }    
    }
}