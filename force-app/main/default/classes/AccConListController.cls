public class AccConListController {
	@AuraEnabled
    public static List<Account> getAccounts() {
        //changed//
        List<Account> accounts=[SELECT Id, Name, (select name, Phone, Email FROM Contacts) FROM Account limit 1000];
        return accounts;
    }
}