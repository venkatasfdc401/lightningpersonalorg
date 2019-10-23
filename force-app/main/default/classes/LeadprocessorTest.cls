@isTest
private class LeadprocessorTest {
    @testSetup 
    static void setup() {
        List<Lead> Leadlist = new List<Lead>();
        for (Integer i=0;i<200;i++) {
            Leadlist.add(new lead(Lastname='Lead '+i, FirstName='Test',
                Leadsource='Web',Company='NYL'));
        }
        insert Leadlist;
    }
    static testmethod void test() {        
        Test.startTest();
        LeadProcessor Lp = new LeadProcessor();
        Id batchId = Database.executeBatch(Lp);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from Lead ]);
    }
    
}