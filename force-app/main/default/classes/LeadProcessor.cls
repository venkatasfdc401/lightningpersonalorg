global class LeadProcessor implements  Database.Batchable<sObject>, Database.Stateful {
     static integer counter = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID,LeadSource From Lead');
    }    
    global void execute(Database.BatchableContext bc,List<Lead> scope){
        // process each batch of records
        for(Lead ld: Scope){
            ld.LeadSource = 'Dreamforce';
            counter++;
        }
        //update scope;
    }    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        // 
        system.debug('counter '+counter);
    }   
}