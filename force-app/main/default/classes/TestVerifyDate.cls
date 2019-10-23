@isTest
private class TestVerifyDate {
    @isTest
    static void  method1(){
        date testdate = VerifyDate.CheckDates(date.today(),date.today().adddays(-1));
        date testdate1 = VerifyDate.CheckDates(date.today(),date.today().adddays(2));
    }
}