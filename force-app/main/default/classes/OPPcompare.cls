public class OPPcompare implements comparable {
	public integer order;
    public string name;
    public String stage;
    // Constructor
    public OPPcompare(integer i,string stage,string name) {
        This.stage = stage;
        This.name = name;
    }
    
    // Implement the compareTo() method
    public integer compareTo(Object compareTo) {
        OPPcompare compareToEmp = (OPPcompare)compareTo;
        system.debug('compareToEmp '+compareToEmp.stage);
        integer  id;
        if (compareToEmp.stage == 'Closed Won') {
          id = 1;
          order = id;
          system.debug('if id '+id);
          return id;
        } 
        else if (compareToEmp.stage == 'Prospecting') {
          id= 0;
          order = id;
            system.debug('else if id '+id);
          return id;
        } 
        else{
		  id= -1;
          order = id;
            system.debug('else id '+id);
          return id;            
        }
        
    }
}