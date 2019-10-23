trigger RestrictContactByName on Contact (before insert, before update) {
    
    //check contacts prior to insert or update for invalid data
    List<account> acclist = new List<account>();
    id pid = userinfo.getprofileid();
    string userprofilename  = [select name from profile where id = : pid].name;
    triggermanager__c contacttrigger = triggermanager__c.getValues('System Administrator');
    
    For (Contact c : Trigger.New) {
        if(c.LastName == 'INVALIDNAME'  ) {   //invalidname is invalid
            c.AddError('The Last Name "'+c.LastName+'" is not allowed for DML');
        }
        account acc = new account();
        acc.id = c.accountid;
        acclist.add(acc);
        
    }
    system.debug('getLimitDMLStatements()()'+ Limits.getLimitDMLStatements());
    update acclist;
    
    system.debug('getDMLRows()'+ Limits.getDMLRows());
    system.debug('Trigger.New size'+ Trigger.New.size());
    system.debug('getDMLStatements()'+ Limits.getDMLStatements());
    //update acclist;
    system.debug('getLimitDMLStatements()()'+ Limits.getLimitDMLStatements());
}