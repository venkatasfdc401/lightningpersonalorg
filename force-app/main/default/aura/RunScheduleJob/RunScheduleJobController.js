({
    doInit:  function(component, event, helper) {
        
    },
    customjobaction : function(component, event, helper) {
        
        var action  = component.get("c.runcustomjob");
        action.setCallback(this, function(response){
            
            var state = response.getState();
            console.log('state '+state);
            if (state === "SUCCESS") {
                var value = response.getReturnValue();
            	alert('job scheduled');
            }
            else {
                alert('job not scheduled');
            }
               
        }); 
        $A.enqueueAction(action);
	},
    regularjobaction : function(component, event, helper) {
        
		var action  = component.get("c.runregularjob");
       
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log('state '+state);
            if (state === "SUCCESS") {
                var value = response.getReturnValue();
            	alert('job scheduled');
            }
            else {
                alert('job not scheduled');
            }
              
        });  
        $A.enqueueAction(action); 
	}
})