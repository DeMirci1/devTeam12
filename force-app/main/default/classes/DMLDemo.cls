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
}
