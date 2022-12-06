//From CHILD to PARENT....
public class SOQLAssignment2 {
    public static void queryContAcc() {
        list<contact> lstcontact = [SELECT id, name, account.Id , account.Name
        from contact]; 
        System.debug(lstcontact);
        for (contact eachContact : lstcontact) {
            string cntName = eachContact.Name;
            string cntId = eachContact.Id;
            string accountName = eachContact.account.Name;
            string accountId = eachContact.account.Id;
            system.debug('Account name is ' + accountName + ', Account ID is ' + accountId);
        }
    }
    
    
    //from PARENT to CHILD.....
    public static void queryAccCont() {
        list<account> lstaccount = [SELECT id, (SELECT Id, Name FROM Contacts) FROM Account]; 
        System.debug(lstaccount);


        for (account eachAccount : lstaccount) {
            list<contact> lstcont = eachAccount.contacts;
            for (contact eachCont : lstcont ) {
                id contactId = eachCont.id;
                string contactName = eachCont.name;
                system.debug('Contact ID is ' + contactId + ', Contact name is ' + contactName);
            }            
        }
    }
}