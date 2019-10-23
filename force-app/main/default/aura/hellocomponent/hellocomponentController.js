({
    init : function(component, event, helper) {
        var pageReference = {
            type: 'standard__component',
            attributes: {
                componentName: 'c__helloTarget',
            },
            state: {
                "c__firstname": "John"
            }
        };
        component.set("v.pageReference", pageReference);
     },
     handleClick: function(component, event, helper) {
        /*console.log('sdfrfdf');
        var navService = component.find("navService");
        var pageReference = component.get("v.pageReference");
        event.preventDefault();
        navService.navigate(pageReference);*/
        window.open('/lightning/n/urlcasetab')
    },
    parentComponentEvent : function(cmp, event) { 
        //Get the event message attribute
        var message = event.getParam("message"); 
        //Set the handler attributes based on event data 
        cmp.set("v.eventMessage", message + 'Rajesh');         
    } 
})