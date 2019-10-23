public class RandomContactFactory {
    static list<contact> contactslist = new List<Contact>(); 
    Public static  List<Contact> generateRandomContacts(Integer isize,string lname){
        for(integer i=0;i<isize;i++){
            contactslist.add(new contact(Firstname=lname+' '+i));
        }
        return contactslist;
    }
}