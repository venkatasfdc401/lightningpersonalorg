trigger ProjectTrigger on Project__c (after update) {
    //Call the Billing Service callout logic here
    //after trigger to fire if the Status is set to Billable.
    If (Trigger.isAfter && Trigger.isUpdate){
        for(Project__c proj : Trigger.new){
            if(proj.Status__c.equals('Billable')){
                BillingCalloutService.callBillingService(proj.ProjectRef__c, proj.Billable_Amount__c);
            }
        }
    }
}