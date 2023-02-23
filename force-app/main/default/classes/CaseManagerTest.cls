@isTest
public with sharing class CaseManagerTest {
    @TestSetup
    private static void makeData(){
        List<Case> cases = new List<Case>();
        for (Integer i = 0; i < 3; i++) {
            Case cs = new Case(Subject='Test subject'+i, Description='Test description'+i, Origin='Email'+i);
            cs.Type='Electrical';
            cs.Priority='Low';
            cs.Status='New';
            cases.add(cs);            
        }       
        insert cases;
        List<Case> insertedCases = [SELECT Id FROM Case];
        System.assertEquals(3, insertedCases.size());
    }
    @isTest 
    private static void postCaseTest() {
        Test.startTest();
        Id caseId = CaseManager.postCase('Subject', 'Description', 'High', 'New');        
        System.assertNotEquals(null, caseId);    
        Case cs = [SELECT Id, Subject, Priority FROM Case WHERE Id = :caseId];
        System.assertEquals('High', cs.Priority);
        Test.stopTest();
    }

    @isTest
    private static void putCaaseTest1() {
        Test.startTest();
        // Pass null in Id => Testing insert scenario
        Id caseId = CaseManager.putCase(null, 'Subject', 'Description', 'Medium', 'New');
        System.assertNotEquals(null, caseId);
        Case cs1 = [SELECT Id, Subject, Priority FROM Case WHERE Id = :caseId];
        System.assertEquals('Medium', cs1.Priority);

        // Pass valid Id => Testing update scenario
        Id sameCaseId = CaseManager.putCase(caseId, 'Subject changed', 'Description', 'High', 'In Progress');
        system.assertNotEquals(caseId, sameCaseId);
        Case cs2 = [SELECT Id, Priority FROM Case WHERE Id = :caseId];
        System.assertEquals('High', cs2.Priority);

       
        Test.stopTest();
        
    }

    @isTest
    public static void getCaseTest() {
        Test.startTest();
        //1. Prepare RestRequest
        //https://demirci9-dev-ed.develop.my.salesforce.com/services/apexrest/Case/500Do000001cOSb
        Case cs = [SELECT Id, Subject, Priority, Status FROM Case LIMIT 1];
        String homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm();
        
        RestRequest request = new RestRequest();
        request.httpMethod = 'GET';
        request.requestURI = homeUrl +  '/services/apexrest/Case/' + cs.Id;

        //2. Prepare RestContext

        RestContext.request = request;

        //3. Prepare the business method
        Case objCase = CaseManager.getCase();
        System.assertEquals(cs.Id, objCase.Id);
        System.assertEquals(cs.Subject, objCase.Subject);
        System.assertEquals(cs.Priority, objCase.Priority);

        Test.stopTest();        
    }
    @isTest
    private static void deleteCaseTest() {
        Test.startTest();
        //1. Prepare RestRequest
        Case cs = [SELECT Id, Subject, Priority, Status FROM Case LIMIT 1];
        String homeURL = System.URL.getSalesforceBaseUrl().toExternalForm();
        
        RestRequest request = new RestRequest();
        request.httpMethod = 'DELETE';
        request.requestURI = homeURL + '/services/apexrest/Case/' + cs.Id;

        //2. Prepare RestContext
        RestContext.request = request;

        //3. Test the business method
        String status = CaseManager.deleteCase();
        System.assertEquals('Success', Status);

        try {
            String status1 = CaseManager.deleteCase();
            System.assertEquals('Fail', status1);
            
        } catch (Exception ex) {
            
        }

        Test.stopTest();
        
    }

    @isTest
    private static void patchCaseTEst() {
        Test.startTest();
        // 1. Prepare RestRequest
        Case cs = [SELECT Id, Subject, Description, Priority, Status FROM Case LIMIT 1];
        cs.Priority = 'Medium';
        cs.Status = 'In Progress';
        String body = JSON.serialize(cs);

        RestRequest request = new RestRequest();
        request.httpMethod = 'PATCH';
        request.requestBody = Blob.valueOf(body);

        // 2. Prepare RestContext
        RestContext.request = request;

        // 3. Test business method
        Case objCase =  CaseManager.patchCase();
        System.assertEquals('Medium', objCase.Priority);
        System.assertEquals('In Progress', objCase.Status);

        Test.stopTest();
    }
}