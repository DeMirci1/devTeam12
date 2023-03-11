public with sharing class AccountCtrl {
    @AuraEnabled(cacheable=true)
    public static list<Account> getTopAccounts(){
        return [
        SELECT Id, Name, Type, Industry, AnnualRevenue 
        FROM Account 
        WHERE AnnualRevenue != null 
        WITH SECURITY_ENFORCED 
        ORDER BY AnnualRevenue 
        DESC LIMIT 10
        ];
    }

    @AuraEnabled
    public static List<Account> getAccountByIndustry(String industry) {
        return [SELECT Name, Type, Industry, AnnualRevenue
                FROM Account
                WHERE Industry = :industry
                with SECURITY_ENFORCED
                order by AnnualRevenue DESC];
    }
}