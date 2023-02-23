@isTest
public with sharing class AccountManagerTest {
    @TestSetup
    private static void makeData(){
        List<Account> listAcc = new List<Account>();
        for (Integer i = 0; i < 3; i++) {
            Account acc = new Account(Name='Hilal Demirci'+1, Industry='Energy'+1);
            acc.Type='Prospect';
            acc.Phone = '7025593360';
            acc.Rating ='Hot';
            listAcc.add(acc);            
        }
        insert listAcc;
        List<Account> insertedList =[SELECT Id FROM Account];
        System.assertEquals(3, insertedList.size());
    }
    @isTest
    private static void postAccountTest() {
        Test.startTest();
        Id accountId = AccountManager.postAccount('Nihal', 'Energy', 'Prospect', 'Hot');
        System.assertNotEquals(null, accountId);

        Account acc2 = [SELECT Id, Name, Type FROM Account WHERE Id = :accountId];
        System.assertEquals('Industry', acc2.Industry);
        Test.stopTest();
    }
    @isTest

    private static void putAccountTest1() {
        Test.startTest();
        //1.Pass null in Id => Testing inseet scenario
        Id accId = AccountManager.putAccount(null, 'Name', 'Energy', 'Prospect', 'Hot');
        System.assertNotEquals(null, accId);
        Account acc = [SELECT Id, Name, Industry, Type, Rating FROM Account WHERE Id = :accId];
        System.assertEquals('Banking', acc.Industry);

        //2. Pass valid Id => Testing update scenario
        Id sameAccId = AccountManager.putAccount(null, 'Name', 'Banking', 'Installation Partner', 'Warm');
        System.assertNotEquals(accId, sameAccId);
        Account acc1 = [SELECT Id, Name, Industry, Type, Rating FROM Account WHERE Id = :accId];
        System.assertEquals('Energy', acc1.Industry);

        Test.stopTest();
    }


    @isTest
    private static void getAccountTest() {
        Test.startTest();
        //https://demirci9-dev-ed.develop.my.salesforce.com/services/apexrest/Account/001Do000003Dza0IAC

        Account acc = [SELECT Id, Name, Industry, Type, Rating FROM Account LIMIT 1];
        String homeURL = System.URL.getSalesforceBaseUrl().toExternalForm();

        RestRequest request = new RestRequest();
        request.httpMethod = 'GET';
        request.requestURI = homeURL + '/services/apexrest/Account/' + acc.Id;


        RestContext.request = request;

        Account objAccount = AccountManager.getAccount();
        System.assertEquals(acc.Id, objAccount.Id);
        System.assertEquals(acc.Name, objAccount.Name);
        System.assertEquals(acc.Industry, objAccount.Industry);

        Test.stopTest();

    }

    @isTest
    private static void deleteAccountTest() {
        Test.startTest();
        Account acc3 = [SELECT Id, Name, Industry, Type FROM Account LIMIT 1];
        String homeURL = System.URL.getSalesforceBaseUrl().toExternalForm();

        RestRequest request = new RestRequest();
        Request.httpMethod = 'DELETE';
        Request.requestURI = homeURL + '/services/apexrest/Account/' + acc3.Id;

        RestContext.request = request;

        String Type =  AccountManager.deleteAccount();
        System.assertEquals('Success', Type);

        try {
            String Type1 = AccountManager.deleteAccount();
            System.assertEquals('Fail', Type1);

        } catch (Exception ex) {
            
        }

        Test.stopTest();
        
    }
}