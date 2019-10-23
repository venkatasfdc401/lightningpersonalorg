public class accounthelper{
public static integer counter =0;
public integer counter1 =0;

@future
public static void myaccount(Id ids){
if(counter == 1){


counter++;

}


list<account> acc = [select name from account where id=:Ids ];
acc[0].Name = string.valueOf(acc[0].Name+counter);
update acc[0];
counter++;

system.debug('@@@@@@@@@@@@@'+acc[0].name);


}}