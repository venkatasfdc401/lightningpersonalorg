public class Json_from_Object {
    public static void parse(){
        
        for(Attachment att: [select body from attachment where id ='00Pf2000012Reey']){
            Blob requirementsbody = att.body;
            string json_instance;
            String serializebody = requirementsbody.tostring(); 
                system.debug('serializebody '+serializebody);
 			    Map<String,Object> InitialSobjectMap = (Map<String,Object>) JSON.deserializeUntyped(serializebody);
                system.debug('InitialSobjectMap '+InitialSobjectMap);
                for(string str: InitialSobjectMap.keyset()){
                    
                    String Mainstr = JSON.serialize(InitialSobjectMap.get(str));
                    
                    List<Object> InnerInitialSobjectMap = (List<Object>) JSON.deserializeUntyped(Mainstr);
                	
                    for(Object ob: InnerInitialSobjectMap){
                        
                               Map<String, Object> innerobject = (Map<String, Object>) ob;
                                for(string stritem: innerobject.keyset()){
                                    if(stritem=='total_price'){
                                    }
                                    if(stritem=='line_items'){
                                        String strinnerlist = JSON.serialize(innerobject.get(stritem));
                                        List<Object> innerInnerInitialSobjectMap = (List<Object>) JSON.deserializeUntyped(strinnerlist);
                                        for(Object innerobj: innerInnerInitialSobjectMap){
                                        	Map<String, Object> innerinnerobject = (Map<String, Object>) innerobj;
                                            for(string strinneritem: innerinnerobject.keyset()){
                                                system.debug('strinneritem '+strinneritem);
                                            }
                                        }    
                                    }
                                }   
                    }
                }    
            
   		 } 
    }     
}