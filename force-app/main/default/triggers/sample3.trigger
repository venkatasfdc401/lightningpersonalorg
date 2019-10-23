trigger sample3  on Account (after insert) {

accounthelper.counter++;
for(account a : trigger.New)
{

AccountHelper.myaccount(a.id);

}

}