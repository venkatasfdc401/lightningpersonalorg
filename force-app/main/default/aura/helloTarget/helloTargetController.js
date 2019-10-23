({
	onPageReferenceChange: function(cmp, evt, helper) {
        var myPageRef = cmp.get("v.pageReference");
        if(myPageRef.state != undefined ){
        var firstname = myPageRef.state.c__firstname;
        cmp.set("v.firstname", firstname);
        }
    }
})