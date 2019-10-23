({
	doInit: function(component, event, helper) {
        // Prepare a new record from template
        
        /*component.find("accountRecordCreator").getNewRecord(
            "Account", // sObject type (entityAPIName)
            null,      // recordTypeId
            false,     // skip cache?
            $A.getCallback(function() {
                var rec = component.get("v.accountRecord");
                var error = component.get("v.recordError");
                if(error || (rec === null)) {
                    console.log("Error initializing record template: " + error);
                }
                else {
                    console.log("Record template initialized: " + rec.sobjectType);
                }
            })
        );*/
        
    }
})