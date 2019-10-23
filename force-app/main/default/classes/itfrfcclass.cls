public class itfrfcclass  {
    
    public itfrfcclass(){
    List<OPPcompare> djsdlist = new List<OPPcompare>();
    integer i =0;
    for(opportunity opp : [select name ,stagename from opportunity]){
        djsdlist.add(new OPPcompare(i,opp.stagename,opp.name));
        i++;
    }
    djsdlist.sort();
    }     
}