public with sharing class ControllerMyDataTable {

    public ControllerMyDataTable(ApexPages.StandardSetController controller) {

    }
    public string pdf {get;set;}

    public List<contact> Contactlist { get; set; }
    public ControllerMyDataTable (){
        Contactlist = [SELECT id,name,Account.Name,Phone FROM Contact];
        
    }
    public void print(){
      pdf  = 'pdf';
      
    }


}