public class WClassController {
    
	@AuraEnabled
    public static List<WrapperClass> getAccounts() {
        List<WrapperClass> wcList = new List<WrapperClass>();
        List<Account> accList = [SELECT Name,Active__c, (SELECT Name,Email FROM contacts) FROM Account limit 10];
        
        if(accList.size() > 0){
            integer i=0;
            for(Account acct : accList){
                List<InnerWrapperClass> conWraplist = new List<InnerWrapperClass> ();
                if(acct.contacts.size() > 0){
                    WrapperClass wc = new WrapperClass();
                    wc.count = i;
                    wc.acc = acct;
                    for(contact con: acct.contacts){
                        system.debug( 'con i'+i);
                        InnerWrapperClass cw = new InnerWrapperClass();
                        cw.count = i; 
                        cw.name = con.name;
                        cw.cont = con;
                        conWraplist.add(cw);
                        wc.conWrapperlist = conWraplist;
                    }
                    wcList.add(wc);
                }
                System.debug(' i '+i);
                i++;
            }
        }
        System.debug('wcList '+wcList); 
        return wcList;
    }
    
    public class WrapperClass{
        @AuraEnabled
        public Integer count;
        @AuraEnabled
        public Account acc;
        @AuraEnabled
		Public List<InnerWrapperClass> conWrapperlist;        
	}
    
    public class InnerWrapperClass{
        @AuraEnabled
        public String name;
        @AuraEnabled
        public Contact cont;
        @AuraEnabled
        public Integer count;
    }
}