@RestResource(urlMapping='/project/*')
global with sharing class ProjectRESTService {
  
    // Post method to create project data back from PMS system call.
    @HttpPost
    global static String postProjectData(String ProjectRef, String ProjectName, String OpportunityId,
                                      Date StartDate, Date EndDate, Double Amount, String Status) {
         List<opportunity> opptys = new List<opportunity>();
         List<project__c> Projectlist = new List<Project__c>();                                 
         RestRequest req = RestContext.request;
		 RestResponse res = RestContext.response;
         Opportunitywrapper response = new Opportunitywrapper(); 
         String Message = 'OK';
         Savepoint savePoint = Database.setSavepoint();                                 
         Try{                                 
               Opportunity opp = [select Id,Name,DeliveryInstallationStatus__c,(select Billable_Amount__c,End_Date__c,ProjectRef__c,
                                              Start_Date__c,Status__c from Projects__r) from Opportunity where id =:OpportunityId];
             if(opp!=null ){                                  
                Project__c newProject = new Project__c(Opportunity__c=OpportunityId);                                   
                for(project__c proj: opp.Projects__r){
                    newProject.id = proj.id;                                  
                } 
                newProject.ProjectRef__c = ProjectRef;
                newProject.Name = ProjectName;    
                newProject.Start_Date__c = StartDate;
                newProject.End_Date__c = EndDate;
                newProject.Billable_Amount__c = Amount;
                newProject.Status__C = Status;
                opp.DeliveryInstallationStatus__c = 'In progress';
                opptys.add(opp);
                Projectlist.add(newProject);
         
             if(Projectlist.size()>0){
                 upsert Projectlist;
             }
             if(opptys.size()>0){
                 update opptys;
             }
             response.status = 'Success';
			 response.message = 'Your Opportunity was created successfully.';
          }
             else {
                 message = 'Opportunity not found';
             }   
             
         }
         Catch(Exception ex){
             Database.rollback(savepoint);
             message = ex.getMessage();
         }                                                                  
         return message;                                 
    } 
    
    public class Opportunitywrapper{
        public String status;
		public String message;
        public Opportunitywrapper(){   
        }
    }
}