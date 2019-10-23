trigger deskMaster on Desk__c (after delete,after update, after insert, after undelete) {
List<classroom__c>ct = new List<classroom__c>();
set<id>classroomIDs = new set<id>();
if(trigger.isInsert){
  for(Desk__c deskItem : Trigger.new){
      classroomIDs.add(deskItem.Classroom__c);
   }
}
else if(trigger.isDelete){
    for(Desk__c deskItem : Trigger.old){
        classroomIDs.add(deskItem.Classroom__c);
     }
}
else if(trigger.isUnDelete){
     for(Desk__c deskItem : Trigger.new){
     classroomIDs.add(deskItem.Classroom__c);
      }
}
else if(trigger.isUpdate){
     for(Desk__c deskitem : trigger.new){
if(trigger.oldmap.get(deskitem.id).classroom__c!=deskitem.classroom__c){
classroomIDs.add(deskItem.Classroom__c);
classroomIDs.add(trigger.oldmap.get(deskitem.id).classroom__c);
}
}
}
AggregateResult[] groupedResults = [SELECT COUNT(Id), classroom__c FROM desk__c where classroom__C IN :classroomIDs GROUP BY classroom__c ];
   for(AggregateResult ar:groupedResults) {
        Id custid = (ID)ar.get('classroom__c');
        Integer count = (INTEGER)ar.get('expr0');
        classroom__c cust1 = new classroom__c(Id=custid);
        cust1.count__c = count;
        ct.add(cust1);
     }
     update ct;
}