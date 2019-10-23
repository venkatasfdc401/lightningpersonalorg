public with sharing class NewCaseListController {
    
    public list<case> getNewCases(){
        List<case> cslt = [select Id, casenumber from Case where status ='New' limit 50000];
        return cslt;
    }
}