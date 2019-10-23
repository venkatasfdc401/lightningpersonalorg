public class BillingCalloutService {
    //Implement business and callout logic methods here
    @Future(callout=true)
    public static void callBillingService(string projectRef, decimal billAmount){
         //gets the custom settings values.
        ServiceCredentials__c servCred = ServiceCredentials__c.getValues('BillingServiceCredential');
        BillingServiceProxy.project project = new BillingServiceProxy.project();
        project.username = servCred.Username__c;
        project.password = servCred.Password__c;
        project.projectid =  projectRef == '' ? ' ' : projectRef;
	    project.projectRef =  projectRef == '' ? ' ' : projectRef;
        project.billAmount = billAmount;
        //synchronous call to the Billing Invoice system.
        BillingServiceProxy.InvoicesPortSoap11 invoiceCall = new BillingServiceProxy.InvoicesPortSoap11();
        //getting the response back from billing system.
        String response = invoiceCall.billProject(project);
        if(response != null && response.equalsIgnoreCase('OK')){
            List<Project__c> projectslisttoupdate = new  List<Project__c>();
            for(Project__c pro :[select id,Status__c FROM Project__c WHERE ProjectRef__c =: ProjectRef]){
                pro.status__c = 'Billed';
                projectslisttoupdate.add(pro);
            }
            if(projectslisttoupdate.size()>0){
                update projectslisttoupdate;
            }
        }
    }
}