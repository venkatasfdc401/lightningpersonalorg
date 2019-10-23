global class UpdateAccountFields implements Database.Batchable<sObject>,
Database.stateful{
static integer count = 0;
global Database.QueryLocator start(Database.BatchableContext BC){
return Database.getQueryLocator([SELECT Id FROM Account LIMIT 1000]);
}
global void execute(Database.BatchableContext BC,
List<sObject> scope){
for(Sobject s : scope){
count = count + 1;
    system.debug('count exceute '+ count);
}
}
global void finish(Database.BatchableContext BC){

system.debug('count finish'+ count);

}
}