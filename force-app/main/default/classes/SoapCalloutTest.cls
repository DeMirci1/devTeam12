@isTest
public with sharing class SoapCalloutTest {
        
    @isTest
    private static void parksCalloutTest() {
        //1. Set the mock
        ParksServicesMock mock = new ParksServicesMock();
        Test.setMock(WebServiceMock.class, mock);

        //2. Test the mock
        String country = 'Turkiye';
        String[] parks = SoapCallouts.parksCallout(country);

        //3. Run asserts
        System.assertEquals(2, parks.size());        
    }
    @isTest
    private static void doAddCalloutTest() {
        //1. Set the mock
        DoAddCallooutMock mock = new DoAddCallooutMock();
        Test.setMock(WebServiceMock.class, mock);

        //2. Test the mock
        Double result = SoapCallouts.doAddCallout(10, 5);

        //3. Run asserts
        System.assertEquals(15, result);        
    }
    @isTest
    private static void doMultiplyCalloutTest() {
        //1. Set the mock
        DoMultiplyCalloutMock mock = new DoMultiplyCalloutMock();
        Test.setMock(WebServiceMock.class, mock);

        //2. Test the mock
        Double result = SoapCallouts.doMultiplyCallout(10, 5);

        //3. Run asserts
        System.assertEquals(50, result);        
    }
}