public class Schedulejobsctrl {
    
    @AuraEnabled(cacheable = true)
    public static string runregularjob() {
        schedulableexample  sqrb2 = new schedulableexample ();
        for (CronTrigger job : [select Id from CronTrigger where CronJobDetail.Name like '%schedulableexample_Every_30_min%']) { 
                System.abortJob(job.Id); 
        }
        String sch = '0 5 * * * ?';
        system.schedule('schedulableexample_Regular_every_2hr '+System.now(), sch, sqrb2);
        return 'true';
    }
    @AuraEnabled(cacheable = true)
    public static string runcustomjob() {
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
        for (CronTrigger job : [select Id from CronTrigger where CronJobDetail.Name like '%schedulableexample_Regular_every_2hr%']) { 
                System.abortJob(job.Id); 
        }
        system.schedule('schedulableexample_Every_30_min'+System.now(), sch, sqrb2);
        return 'true';
    }
		
}