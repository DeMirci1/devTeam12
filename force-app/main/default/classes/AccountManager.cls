@RestResource(urlMapping = '/Account/*')
global with sharing class AccountManager {
    //https://demirci9-dev-ed.develop.my.salesforce.com/services/apexrest/Account/001Do000003Dza0IAC
    
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        String uri = request.requestURI;
        Integer lastIndex = uri.lastIndexOf('/');
        Id accountId =uri.substring(lastIndex+1);
        Account acc = [SELECT Id, Name, Industry, Type FROM Account WHERE Id = :accountId WITH SECURITY_ENFORCED];
        return acc;
    }

    @HttpPost 
    global static Id postAccount(String name, String industry, String type, String rating) {
        
        Account acc = new Account();
        acc.name = Name;
        acc.industry = Industry;
        acc.type = Type;
        acc.rating = Rating;
                       
        insert acc;
        return acc.Id;        
    }

    @HttpDelete
    global static String deleteAccount() {
        RestRequest request = RestContext.request;
        String uri = request.requestURI;
        Integer lastIndex = uri.lastIndexOf('/');
        Id accountId = uri.substring(lastIndex+1);

        try {
            Account acc = [SELECT Id FROM Account WHERE Id = :accountId WITH SECURITY_ENFORCED];
            delete acc;
        } catch (Exception ex) {
            return 'FAIL';
        }
        return 'Success';
        
    }

    @HttpPut
    global static Id putAccount(String Id, String Name, String Industry, String Type, String Rating) {
        Account acc1 = new Account();
        acc1.Id = Id;
        acc1.Name = Name;
        acc1.Industry = Industry;
        acc1.Type = Type;
        acc1.Rating = Rating;
        insert acc1;
        return acc1.Id;
    }

    @HttpPatch
    global static Account patchAccount() {
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        Account acc = (Account)JSON.deserialize(body, Account.class);
        
        update acc;
        return [SELECT Id, Name, Industry, Type, Rating FROM Account WHERE Id = :acc.Id WITH SECURITY_ENFORCED LIMIT 1 ];

    }

}