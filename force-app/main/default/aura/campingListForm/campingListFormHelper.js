({
	createItem: function(component,newItem) {
        var addItem = component.getEvent("addItem");
        alert('sssss');
        addItem.setParams({"item":newItem});
        addItem.fire();
        component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c',
                        'Name': '',
                        'Quantity__c': 0,
                        'Price__c': 0,
                        'Packed__c': false });
    },
    validateItemForm: function(component) {
        // Simplistic error checking
        var validItem = true;
        // Name must not be blank
        var nameField = component.find("camping_name");
        var itemname = nameField.get("v.value");
        var priceField = component.find("camping_price");
        var price = priceField.get("v.value");
        var quantityField = component.find("camping_qty");
        var quantity = quantityField.get("v.value");
        
        if($A.util.isEmpty(itemname)){
            validItem = false;
            component.set("v.showError", true);
            component.set("v.errors","Item name can't be blank.");
        } 
        else if ($A.util.isEmpty(quantity)){
            validItem = false;
            component.set("v.showError", true);
            component.set("v.errors", "Quantity can't be blank.");
        } 
		else if ($A.util.isEmpty(price)){
            validItem = false;
            component.set("v.showError", true);
            component.set("v.errors", "Price can't be blank.");
        } 
        else {
            component.set("v.errors", null);
        }
        return (validItem);
	},
})