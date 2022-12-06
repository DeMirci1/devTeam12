public class SOQL_Assignment {
    public static void SOQL_WhereClause() {
        list<contact> listcontact = [SELECT lastname FROM  contact WHERE lastname LIKE '%A%'];
        system.debug('The list of all contacts is ' + listcontact);
        System.debug('tHE SIZE OF CONTACT IS ' + listcontact.size());
    }
    public static void SOQL_formethod() {
        list<contact> lstcontact = [SELECT lastname, phone FROM contact];
        system.debug('The list of all contacts is ' + lstcontact);
        for (Contact eachCnt : lstcontact) {
            string lstName = eachCnt.lastname;
            string contPhone = eachCnt.Phone;
            system.debug('Contact Last name is ' + lstName + ', Contact phone is ' + contPhone);
        }
    }
}
