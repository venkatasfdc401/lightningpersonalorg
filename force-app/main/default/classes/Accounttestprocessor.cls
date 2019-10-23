@iSTest
public class Accounttestprocessor {   

    //below test setup method will be invoked
    // implicitly before every test methods 
    @testsetup
    static void createAccount(){
        List<Account> lstAccount = new List<Account>();        
        for(Integer i = 0 ; i<200 ; i++) {
            lstAccount.add(new Account(Name = 'testLName'+i));
        } 
        insert lstAccount ;
    }
    
   //Check whether records created in test method
   //is accessible or not
    public static testMethod void test(){
        System.assertEquals(200, [SELECT COUNT() FROM Account ]);
    }
}