({
	doInit : function(component, event, helper) {
        var Action = component.get("c.getAccountrecords");
        Action.setCallback(this, function(response) {
             console.log(response.getState()); 
                if(response.getState()=='SUCCESS'){
                    var data = response.getReturnValue();
                    if(data.length >0 ){
                    	component.set("v.AccountList",response.getReturnValue());
                    }
                    else {
                        component.set("v.Accountrecordsmsg","Accounts does not Exist");
                    }
                }
            	else{
                	var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + 
                                        errors[0].message);
                        }
                    }
            	}
            
        });   
        $A.enqueueAction(Action);
	},
    // function for create new object Row in Contact List 
    addRow: function(component, event, helper) {
        // call the comman "createObjectData" helper method for add new Object Row to List  
        helper.createObjectData(component, event);
    },
    // function for delete the row 
    removeDeletedRow: function(component, event, helper) {
        //get the selected row Index for delete, from Lightning Event Attribute  
        var index = event.getParam("indexVar");
        var recordid = event.getParam("recordId");
        helper.deleterecord();
        //get the all List (AccountList attribute) and remove the Object Element Using splice method    
        var AllRowsList = component.get("v.AccountList");
        AllRowsList.splice(index, 1);
        //set the AccountList after remove selected row element  
        component.set("v.AccountList", AllRowsList);
    },
    // function for save the Records 
    Save: function(component, event, helper) {
        
        // first call the helper function in if block which will return true or false.
        // this helper function check the "Account Name" will not be blank on each row.
        if (helper.validate(component, event)) {
            // call the apex class method for save the Account List
            // with pass the contact List attribute to method param.  
            var action = component.get("c.SaveAccounts");
            action.setParams({
                "accList": component.get("v.AccountList")
            });
            // set call back 
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    // if response if success then reset the 'AccountList' Attribute 
                    // and call the common helper method for create a default Object Data to Account List 
                    //component.set("v.AccountList", []);
                    //helper.createObjectData(component, event);
                    //alert('Account records saved successfully');
                    var a = component.get('c.showSuccessToast');
        			$A.enqueueAction(a);
                }
            });
            // enqueue the server side action  
            $A.enqueueAction(action);
        }
    },
    showSuccessToast : function(component, event, helper) {
        var sMsg = 'Hello i am first statement \n';
        sMsg += 'Hello i am Second statement \n Hello i am Third statement';
        
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            mode: 'sticky',
            message: sMsg,
            type : 'success'
        });
        toastEvent.fire();
    },
    showErrorToast : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title : 'Error Message',
            message:'Mode is pester ,duration is 5sec and Message is not overrriden because messageTemplateData is not specified',
            messageTemplate: 'Mode is pester ,duration is 5sec and Message is overrriden',
            duration:' 5000',
            key: 'info_alt',
            type: 'error',
            mode: 'pester'
        });
        toastEvent.fire();
    },
})