public class DeleteOpportunityBatchWeek8 implements Database.Batchable<sObject>, database.stateful{ 
    public integer count=0;
    public integer countRecords=0;
  
    public Database.QueryLocator start(Database.BatchableContext BC){
        Database.QueryLocator q1 =Database.getQueryLocator([select id, stageName from opportunity where stageName='Closed Lost']);
        return q1;
    }
    public void execute(Database.BatchableContext BC,List<opportunity> scope){
        if(!scope.isEmpty()){
        
        delete scope;
        countRecords++;
        system.debug(countRecords);
        system.debug(count);
        }
   }
   public void finish(Database.BatchableContext BC){
    system.debug('number of records deleted: ' + countRecords);
   }
}