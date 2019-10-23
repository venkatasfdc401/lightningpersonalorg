public class AddPrimaryContact implements Queueable {
    
    private contact Contactobj;
    private String State;
    List<Contact> Contactslist = new List<Contact>();
    
    public AddPrimaryContact(Contact contactobj,String State) {
        this.Contactobj = contactobj;
        this.state = state;
    }
    public void execute(QueueableContext context) {
        for (Account account : [select id from account where BillingState =: State]) {
        	Contact con= Contactobj.clone();
            con.AccountId = account.Id;
            Contactslist.add(con);
        }
        Insert Contactslist;
    }
    
}