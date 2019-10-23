trigger aaaa on Account ( after insert) {
    
    class hhh {
        integer x=9;
        integer y=10;
            
        public hhh(){
            x = 20;
        }
    
    }
    
    for(account acc: trigger.new){
    
        system.debug(new hhh().x);
    }
}