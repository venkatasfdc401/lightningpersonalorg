({
    handleSaveRecord: function(component, event, helper) {
        component.find("accountRecordCreator").saveRecord(
            $A.getCallback(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
            // record is changed so refresh the component (or other component logic)
            var resultsToast = $A.get("e.force:showToast");
            resultsToast.setParams({
                "title": "Saved",
                "message": "The record was updated."
            });
            resultsToast.fire();

                component.set("v.recordSaveError","");
                console.log("Save completed successfully.");
            } 
            else if (saveResult.state === "INCOMPLETE") {
                console.log("User is offline, device doesn't support drafts.");
            } 
            else if (saveResult.state === "ERROR") {
                var errMsg = "";
                console.log('Problem saving record, error: ' + 
                           JSON.stringify(saveResult.error));
                for (var i = 0; i < saveResult.error.length; i++) {
                    errMsg += saveResult.error[i].message + "\n";
                }
                component.set("v.recordSaveError",errMsg);
            } 
            else {
                console.log('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));    
            }
        }));
    },
    
    // Control the component behavior here when record is changed (via any component)
    handleRecordUpdated: function(component, event, helper) {
        var eventParams = event.getParams();
        if(eventParams.changeType === "CHANGED") {
            // get the fields that are changed for this record
            var changedFields = eventParams.changedFields;
            console.log('Fields that are changed: ' + JSON.stringify(changedFields));
        } 
        else if(eventParams.changeType === "LOADED") {
            // record is loaded in the cache
        } 
        else if(eventParams.changeType === "REMOVED") {
            // record is deleted and removed from the cache
        }
        else if(eventParams.changeType === "ERROR") {
            console.log('Error: ' + component.get("v.error"));
        }
    }
})