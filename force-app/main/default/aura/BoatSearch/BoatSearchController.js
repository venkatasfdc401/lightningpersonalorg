({
	 onFormSubmit: function(component, event, helper){
        var formData = event.getParam("formData");
        var boatTypeId = formData.boatTypeId;
        debugger
        console.log("boatTypeId extracted: "+boatTypeId);
        var BSRCMP = component.find("BSRCMP");
    	var auraMethodResult = BSRCMP.search(boatTypeId);
    },
})