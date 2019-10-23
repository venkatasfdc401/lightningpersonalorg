@isTest
public class AddPrimaryContactTest {
    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                Name='Test Account'+i,
                BillingState = 'NY'
            ));
        }
        for (Integer i = 50; i < 100; i++) {
            accounts.add(new Account(
                Name='Test Account'+i,
                BillingState = 'CA'
            ));
        }
        insert accounts;
        
        Contact con = new contact();
        con.LastName = 'Test Contact rajesh';
        insert con;
    }
    
    static testmethod void testQueueable() {
        // Create our Queueable instance
        contact con = [select id,LastName from contact];
        AddPrimaryContact  creator = new AddPrimaryContact(con, 'NY');
        AddPrimaryContact  creator2 = new AddPrimaryContact(con, 'CA');
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        System.enqueueJob(creator);
        System.enqueueJob(creator2);
        Test.stopTest();        
        
    }
    
}