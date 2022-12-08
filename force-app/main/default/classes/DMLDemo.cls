public class DMLDemo {
    public static void dmlInsertDemo_stndObj() {
        
        Account acc = new Account();

        acc.Name = 'Delivery Pro';

        insert acc;
    }
    public static void dmlInsertDemo_cstmObj(){
        salesforce_project__c  spNew = new salesforce_project__c();
        spNew.project_name__c = 'Delivery PRO-2';
        spNew.description__c = 'New delivery company';

        insert spNew;
    }
    public static void dmlUpdateDemo_1(){
        Account acc = new Account();

        acc.Name = 'Delivery Inc';

        insert acc;

        acc.Name = 'Delivery ORG';
        update acc;


    }
    public static void dmlUpdateDemo_3(){
        Account acc = [select id, name from account where name = 'Delivery ORG' limit 1];
        acc.name = 'Delivery Professionals';
        update acc; 
        system.debug('New name is ==>> ' + acc );
    }
    public static void dmlInsertDemo_4() {
        Account acc = [select id from account where name = 'Soft innovas' limit 1];
        
        Contact cnt = new contact();
        cnt.LastName = 'Biden';
        cnt.AccountId = acc.Id;
        insert cnt;
        system.debug('cnt -> ' + cnt);
    }
    public static void dmlInsertDemo_2_CO() {
        Salesforce_Project__c sp = [select id from Salesforce_Project__c order by Createddate desc limit 1];
        
        Salesforce_Ticket__c st = new Salesforce_Ticket__c();
        st.Subject__c = 'Learn Apex DML';
        st.Priority__c = 'High';
        st.Status__c = 'New';
        st.Requested_by_date__c	 = date.today();
        //setting relationship
        st.Salesforce_Project__c = sp.id;
        insert st;
    }
    public static void dmlInsertMultiple_right() {
        List<account> listAcc = new list<account>();

        account acc1 = new account();
        acc1.Name = 'acc bulk 1';
        listAcc.add(acc1);

        account acc2 = new account();
        acc2.Name = 'acc bulk 2';
        listAcc.add(acc2);

        account acc3 = new account();
        acc3.Name = 'acc bulk 3';
        listAcc.add(acc3);

        insert listAcc;
    }
    public static void dmlInsertMultiple_right_2() {
        List<account> listAcc = new list<account>();
        for (integer i = 0;  i < 155; i++) {
            account acc = new account();
            acc.name = 'Deliver Pro I' + i;
            acc.Active__c = 'Yes';
            listAcc.add(acc);
        }
        if(!listAcc.isEmpty()){
            insert listAcc;
        }            
    }
    public static void dmlUpdateMultiple_right1() {
        list<account> listAccount = [select id, name, active__c from account];

        //update only those account for which active__c == 'Yes'     
        list<account> updateAccounts = new list<account>();
         
        for (Account acc : listAccount) {
            //check if acc active = yes
            if (acc.Active__c == 'Yes') {
                acc.Name = acc.Name + ' via B.0'; 
                updateAccounts.add(acc);
            }
        }

        if (!updateAccounts.isEmpty()) {
            update updateAccounts;
        }
    }
}
