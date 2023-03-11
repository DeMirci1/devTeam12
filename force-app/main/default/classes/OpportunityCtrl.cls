public with sharing class OpportunityCtrl {    
    @AuraEnabled(cacheable=true)
    public static list<Opportunity> getTopOpportunities(string stage){
        return [
            SELECT Name, Type, Amount 
            FROM Opportunity 
            WHERE StageName = :stage
            AND Amount != null 
            WITH SECURITY_ENFORCED 
            ORDER BY Amount 
            DESC LIMIT 5
            ];
        }
    
}