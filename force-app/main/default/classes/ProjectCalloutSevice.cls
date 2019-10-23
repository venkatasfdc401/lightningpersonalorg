public class ProjectCalloutSevice {
	@InvocableMethod    
    public static void PostOpportunityToPMS(List<Id> opptyIds){
        List<string> jsonoptylist = new List<string>();
        String jsonstring;
        string oppid;
        String serviceToken = ServiceTokens__c.getValues('ProjectServiceToken').Token__c;
        for(Opportunity opp: [select id,Account.name,name,CloseDate,Amount from opportunity where id in : opptyIds]){
            JsonPerpareOppty.Jsonoppty jopty = new JsonPerpareOppty.Jsonoppty();
            jopty.opportunityId = opp.id;
            oppid = opp.id;
            jopty.opportunityName= opp.Name;
            jopty.amount= String.valueof(opp.amount);
            jopty.closeDate=String.valueof(opp.CloseDate);
            jopty.accountName  = opp.Account.name;
            jsonstring = Json.serialize(jopty);
            System.debug('jsonstring '+jsonstring);
            jsonoptylist.add(jsonstring);
            String jsonstrings = Json.serialize(jsonoptylist);
            System.debug('jsonstrings '+jsonstrings);
            
        }
         System.enqueueJob(new QueueablePMSCall(serviceToken, jsonstring, oppid));
    }
    @Future(callout=true)
    private static void postToPMS(string serviceToken,string jsoninput,string oppid){
        	HTTPRequest req = new HTTPRequest();
            req.setEndPoint('callout:ProjectService');
            req.setMethod('POST');
            req.setHeader('token',serviceToken);
            req.setHeader('Content-Type', 'application/json;charset=UTF-8');        
            req.setBody(jsonInput);
            HTTP http = new HTTP();
            HTTPResponse res = http.send(req);
            Opportunity opp = new Opportunity(Id=oppId);
            if(res.getStatusCode() != 201){
                opp.StageName = 'Resubmit Project';
                System.debug('Failure: ' + res.getStatusCode() + ' ' + res.getStatus());
            } 
            else {
                opp.StageName = 'Submitted Project';                
                System.debug('Success: ' + res.getStatus());
            }
            update opp;
    }  
    public class QueueablePMSCall implements System.Queueable, Database.AllowsCallouts {
        private String serviceToken;
        private String jsonInput;
        private String oppId;
        
        public QueueablePMSCall(string serviceToken,string jsoninput,string oppid){
            this.serviceToken = serviceToken;
            this.jsonInput = jsoninput;
            this.oppId = oppid;
        }
        public void execute(QueueableContext context) {
            postToPMS(serviceToken, jsonInput, oppId);
        }
    }
}