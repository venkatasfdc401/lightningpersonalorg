({
	doInit : function(component, event, helper) {
  		var action = component.get("c.fetchMapData"); 
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {                
                var custs = [];
                var conts = response.getReturnValue();
                for(var key in conts){
                    custs.push({value:conts[key], key:key}); //Here we are creating the list to show on UI.
                }
                component.set("v.oppAccountList",custs); 
            } 
  	});           
        $A.enqueueAction(action);
	}
})