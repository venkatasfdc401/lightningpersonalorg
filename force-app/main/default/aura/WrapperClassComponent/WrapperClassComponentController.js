({
	doInit : function(component, event, helper) {
        
        
		var action = component.get("c.getAccounts");
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state == "SUCCESS") {
                console.log('response.getReturnValue() '+response.getReturnValue().length);
                var list = response.getReturnValue();
                for(var i = 0, size = list.length; i < size ; i++) {
                    var item = list[i];
                    console.log('item'+item);
                    
                    console.log('conWrapperlist '+ item["conWrapperlist"][i]);
                    
                    
                }
        		component.set("v.objaccounts", response.getReturnValue());
            	var wrap= response.getReturnValue();
                console.log('wrap '+wrap);
            }
            else if (state === "ERROR") {
						var errors = response.getError();
						if (errors) {
							if (errors[0] && errors[0].message) {
								console.log("Error message: " + 
											errors[0].message);
							}
						} else {
							console.log("Unknown error");
						}
		    }
        });
        $A.enqueueAction(action);
	},
    openActionDetail: function(component, event, helper){
        var action = event.target.getAttribute("data-action");
        alert('action '+action);
        component.set("v.showinner",parseInt(action,10));
    }
})