public with sharing class EmployeeCtrl {
    
    @AuraEnabled
    public static List<Employee__c> searchEmployees(String searchKey){
        searchKey = '%' + searchKey + '%';
        return [
            SELECT employee_name__c, designation__c, email__c
            FROM Employee__c
            WHERE employee_name__c LIKE :searchKey
            WITH SECURITY_ENFORCED];
    }
}