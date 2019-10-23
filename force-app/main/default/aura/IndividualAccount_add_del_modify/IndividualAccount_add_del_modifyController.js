({
	doinit : function(component, event, helper) {
		  
	},
    addRow:function(component,evenr,helper){
        component.getEvent("AddRowEvent").fire();     
    },
    deleteRow : function(component, event, helper){
        //Execute the DeleteRowEvent Lightning Event and pass the deleted Row Index to Event attribute
        component.getEvent("DeleteRowEvent").setParams({
            "indexVar" : component.get("v.rowIndex"),
            "recordId": component.get("v.AccountInstance")
        }).fire();
    }, 
})