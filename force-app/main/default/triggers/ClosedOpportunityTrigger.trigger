trigger ClosedOpportunityTrigger on Opportunity (After Insert, After Update) {
    List<Task> Tasklist = new List<Task>();
    
    for(Opportunity opp: Trigger.New){
        if(opp.StageName =='Closed Won'){
            Task tnew = new Task();
            tnew.Subject = 'Follow Up Test Task';
            tnew.WhatId= opp.Id;
            tnew.Status ='In Progress';
            Tasklist.add(tnew);
        }
    }
    if(Tasklist.size()>0){
        Insert Tasklist;
    }
}