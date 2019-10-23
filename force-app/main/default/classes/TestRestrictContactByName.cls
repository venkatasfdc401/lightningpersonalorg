@istest
private class TestRestrictContactByName {
	@istest
    static void Method1(){
        contact con = new contact();
        con.LastName = 'INVALIDNAME';
        insert con;
    }
}