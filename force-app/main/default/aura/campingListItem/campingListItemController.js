({
	packItem : function(component, event, helper) {
        component.set("v.item.Packed__c",true);
        var btnClick = event.getSource();
        btnClick.set("v.disabled",true);
	}
})