({
	onSearch : function(component,event) {
        
		var btType=component.get("v.boatselectTypeId")
        var action = component.get("c.getBoats");
        if(btType =='All Types'){
            btType ='';
        }
        action.setParams({
            boatTypeId: btType
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
    
})