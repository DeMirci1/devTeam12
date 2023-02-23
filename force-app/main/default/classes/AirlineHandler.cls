public with sharing class AirlineHandler {
    public static void afterInsert (Map<Id, Airline__c> newAirlines){
        for (Id airlineId : newAirlines.keySet()) {
            AirlineCallouts.postAirline(airlineId);            
        }
    }
}