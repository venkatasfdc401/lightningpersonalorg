public with sharing class FinancialForceController {
    public string pdf{get;set;}
    public string exportexcel{get;set;}
    public FinancialForceController(ApexPages.StandardSetController controller) {

    }
    public pagereference exportpdf(){
        PageReference pageRef = new PageReference('/apex/FinancialForcepdf');
        pageRef.setredirect(true);
        return pageRef;
    }
    public pagereference exportexcel(){
        PageReference pageRef = new PageReference('/apex/FinancialForceExcel');
        pageRef.setredirect(true);
        return pageRef;
    }
}