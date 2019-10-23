public with sharing class RunAPEXJob {
    public RunAPEXJob() {


	}
    @AuraEnabled
    public static string runregularjob() {
        schedulableexample  sqrb2 = new schedulableexample ();

        for (CronTrigger job : [select Id from CronTrigger where CronJobDetail.Name like '%schedulableexample_custom_%']) { 
            System.abortJob(job.Id); 
        }
        integer i = 0;
        while(i <50){
            
            i = i+10;
            system.debug('i '+i);
           system.schedule('schedulableexample_regular_'+Date.today()+'_'+i, '0 '+i+' * * * ?', sqrb2);
           
        }
        return 'true';
    }
    
    @AuraEnabled
    public static string runcustomjob() {
        Try{
        set<string> months = new set<string>();
		schedulableexample  sqrb2 = new schedulableexample ();
        String sch;
        /*if(date.today().day() == Date.daysInMonth(date.today().year(), date.today().month())){
            	DateTime dt = DateTime.now();
				String monthName = dt.format('MMMMM');
                months.add(monthName);
        }*/
        DateTime dt = DateTime.now();
		String monthName = dt.format('MMMMM');
        months.add(monthName);
        for(Job_configuring__mdt  jbm: [select id,DeveloperName,Applicable__c,Minutes__c from 
                                        Job_configuring__mdt where DeveloperName
                                        in : months]){
                                            
                if(jbm.Applicable__c != 'Default' && jbm.Minutes__c != null ){
                     
                     sch = '0 '+jbm.Minutes__c+ ' * * * ?';                           
                }
        }
        for (CronTrigger job : [select Id from CronTrigger where CronJobDetail.Name like '%schedulableexample_Regular_%' ]) { 
            System.abortJob(job.Id); 
        }
        integer i= 0;
        while(i <60){
            
            i = i+5;
            system.debug('i '+i);
           system.schedule('schedulableexample_custom_'+Date.today()+'_'+i, '0 '+i+' * * * ?', sqrb2);
           
        }    
        return 'true';
    }
        Catch(Exception e){
            system.debug('exception '+e.getMessage());
            return 'false';
        }
    }
    
}