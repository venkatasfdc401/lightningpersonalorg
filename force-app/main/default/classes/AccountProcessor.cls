public class AccountProcessor {
    @future
    public static void countContacts(List<Id> Actids){
        Map<Id,Integer> ContactcountMap = new Map<Id,Integer>();
        List<Account> Accountstoupdate = new List<Account>();
        for(Account acc: [select id,Number_of_Contacts__c, (select id from contacts) from account where id in : Actids]){
            for(integer i=0;i<acc.contacts.size();i++){
                ContactcountMap.put(acc.id,i);
            }
            if(!ContactcountMap.isempty()){
                acc.Number_of_Contacts__c = ContactcountMap.get(acc.id);
                Accountstoupdate.add(acc);
            }
        }
        
        Update Accountstoupdate;
    }
}