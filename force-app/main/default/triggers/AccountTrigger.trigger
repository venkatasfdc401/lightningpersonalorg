trigger AccountTrigger on Account(after Insert){
Integer I =0;
Try{
For(account A: Trigger.new){
system.debug('try '+i);
Account acc = [Select Id from Account where  Id=: A.Id];
I++;
}
}catch(Exception ex){
System.debug('catch'+i);
}finally{
System.debug('finally'+i);
}
}