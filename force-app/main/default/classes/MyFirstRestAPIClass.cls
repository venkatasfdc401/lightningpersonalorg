@RestResource(urlMapping='/api/MyFirstRestAPIClass/*')
global with sharing class MyFirstRestAPIClass{
    
    
    global Class A{
        public string classname;
        global List<B> Blist;
    }
    global class B{
        public string studentname;
        
    }
    global class C{
        
    }
    @HttpPost
    global static String doPost(List<A> alist) {
        for( MyFirstRestAPIClass.A aitem : alist){
            for(MyFirstRestAPIClass.B bitem: aitem.Blist){
                system.debug('B '+bitem);
            }
        }
     return 'test';
    }    
}