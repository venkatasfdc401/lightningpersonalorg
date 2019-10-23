@istest
private class AccountProcessorTest {
	@istest
    static void Method1(){
        Account acc= new Account();
        Acc.Name= 'Test rajesh';
        Insert acc;
        contact con = new Contact();
        con.LastName = 'rajesh contact';
        con.AccountId = acc.id;
        insert con;
        
        Test.startTest();   
        	List<id> actids = new List<id>{acc.id};
            AccountProcessor.countContacts(actids);
        Test.stopTest();
    }
}