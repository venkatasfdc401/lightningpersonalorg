@IsTest
public class TestMyfirstRestAPI {
	static testMethod void testPostMethod()
    {
        RestRequest request = new RestRequest();
        request.requestUri ='/services/apexrest/api/MyFirstRestAPIClass/';
        request.httpMethod = 'POST';
        RestContext.request = request;
        MyFirstRestAPIClass MRC = new MyFirstRestAPIClass();
        List<MyFirstRestAPIClass.A> Alist = new List<MyFirstRestAPIClass.A>();
        MyFirstRestAPIClass.A ainstance= new MyFirstRestAPIClass.A();
        ainstance.classname ='ssc';
        List<MyFirstRestAPIClass.B> blist = new List<MyFirstRestAPIClass.B>();
        MyFirstRestAPIClass.B binstance = new MyFirstRestAPIClass.B();
        binstance.studentname ='rajesh';
        
        blist.add(binstance);
        ainstance.Blist = blist;
        Alist.add(ainstance);
        String strId = MyFirstRestAPIClass.doPost(Alist);
        System.assert(strId !=null );
    }
}