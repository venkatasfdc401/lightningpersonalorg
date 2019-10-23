({
    fireApplicationEvent : function(component, event) {
        // Get the application event by using the
        // e.<namespace>.<event> syntax
        var appEvent = $A.get("e.c:aeEvent");
        
        component.find("navigationService").navigate({
                type: "standard__component",
                attributes: {
                    componentName: "c__componentae" 
                }
		});
        
        appEvent.setParams({
            "message" : "An application event fired me. " +
            "It all happened so fast. Now, I'm everywhere!" });
        appEvent.fire();
    }
})