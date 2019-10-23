({
	doInit : function(component, event, helper) {
		 var a = component.get('c.doSearch');
         $A.enqueueAction(a);
	},
    doSearch:function(component, event, helper) {
        var action = component.get("c.getBoats");
        action.setParams({
            boatTypeId: ''
        });
        debugger
    	action.setCallback(this, function(response) {
               var state= response.getState();
               if (component.isValid() && state === "SUCCESS") {
                    console.log(JSON.stringify(response.getReturnValue()));
                    component.set("v.Spinner", true);
                    component.set("v.boats", response.getReturnValue());
                    component.set("v.Spinner", true);
                }
                else {
                    console.log("Failed with state1: " + state);
                }
        });    
        $A.enqueueAction(action);
    },
    search :function(component, event, helper) {
    	var params = event.getParam('arguments');
        alert('params'+params.boatTypeId);
        component.set("v.boatselectTypeId", params.boatTypeId);
        
        helper.onSearch(component,event);
        return "search complete.";
	},
    // this function automatic call by aura:waiting event  
	    showSpinner: function(component, event, helper) {
	       // make Spinner attribute true for display loading spinner 
	        component.set("v.Spinner", true); 
	   },
	    
	 // this function automatic call by aura:doneWaiting event 
	    hideSpinner : function(component,event,helper){
	     // make Spinner attribute to false for hide loading spinner    
	       component.set("v.Spinner", false);
	    },
    onBoatSelect: function(component, event, helper){
        debugger
        var boatId = event.getParam("boatId");
        component.set("v.selectedBoatId", boatId);
       
    },
})