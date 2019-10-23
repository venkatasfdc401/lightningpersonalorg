@RestResource (urlMapping='/sobjectAPI/*')
global class RestSobjectservice {

    @HttpGet
    global static sobject getobject() {
        RestRequest req = RestContext.request;
        String objectname = req.params.get('objectname');
        Map<String, Schema.SObjectField> fields = Schema.getGlobalDescribe().get(objectname).getDescribe().fields.getMap();
        List<String> editableFields = new List<String>();
        for(Schema.SObjectField fieldRef : fields.values()) {
            Schema.DescribeFieldResult fieldResult = fieldRef.getDescribe();
            if(fieldResult.isUpdateable()) {
                editableFields.add(fieldResult.getname());
            }
        }
        string comaseparatedstring;
        for(string str: editableFields){
            comaseparatedstring = comaseparatedstring+','+str;
        }
        String sObjectName = 'Account';
        Schema.SObjectType t  = Schema.getGlobalDescribe().get(sObjectName);
        SObject s = t.newSObject();
        s.put('Name', 'Test');
        s.put('Description', 'Testing');
        system.debug('comaseparatedstring '+comaseparatedstring);
        
        return s;
    }


}