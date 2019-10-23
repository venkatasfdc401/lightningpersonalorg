@isTest
private class DailyLeadProcessorTest {
    // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testScheduledJob() {
        // Create some out of date Opportunity records
        List<lead> leads = new List<lead>();
        for (Integer i=0; i<200; i++) {
                Lead ld = new Lead();
                ld.LastName = 'Lead ' + i;
                ld.leadsource = '';
                ld.Company ='NYL';
            
            Leads.add(ld);
        }
        insert Leads;
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());               
    }
}