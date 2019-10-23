@IsTest
private class AccountManagerTest {
    @isTest 
    static void TestGetAccountById() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://forlooptechvenkatarajesh-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
            +recordId+'/contacts/';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisaccount = AccountManager.getAccount();
    }
    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account acc = new Account(Name='Rajesh 1');
        insert acc;
        contact con = new Contact();
        con.Lastname = 'Test con rajesh';
        con.accountid = acc.id;
        insert con;
        return acc.id;
    }       
}