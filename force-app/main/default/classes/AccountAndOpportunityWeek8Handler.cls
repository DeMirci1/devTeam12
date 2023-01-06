public class AccountAndOpportunityWeek8Handler {
    /*Update the "Highest Amount Opportunity Name" field at Account level with the
    opportunity Name which have the Highest amount among the opportunities related to
    the account.*/
    @future
    public static void UpdateHighestAmountOpportunityName(set<id>accountIds) {
        List<account> listAccountwithHighestOpportunities = [select id, name,  Highest_Amount_Opportunity_Name__c, (select name, amount from opportunities where amount != null order by amount DESC limit 1) from account where id in : accountIds];
        for (account eachAcc : listAccountwithHighestOpportunities) {
            if (!eachAcc.Opportunities.isEmpty()) {
            eachAcc.Highest_Amount_Opportunity_Name__c = eachAcc.opportunities[0].name;
            } else {
            eachAcc.Highest_Amount_Opportunity_Name__c='';
            }            
        }
        update listAccountwithHighestOpportunities;
    }
    /*Update the 'Target Amount Achieved Opportunity Name' at Account level with the
    Closed Won Opportunity Name. Populate the opportunity name which have highest
    value in Amount field, and it should be more than 'Target Amount' field value at account.*/
    @future
    public static void UpdateTargetAmountAchievedOpportunityName(set<id>accountIds) {
        List<account> listAccWithClosedWonOpps = [select id, name, Target_Amount_Achieved_Opportunity_Name__c, (select name, amount from opportunities where amount != null and StageName = 'Closed Won' order by amount DESC limit 1) from account where id in : accountIds];
        for (account eachAcc : listAccWithClosedWonOpps) {
            if (!eachAcc.opportunities.isEmpty() && eachAcc.opportunities[0].amount> eachAcc.Target_Amount__c) {
                eachAcc.Target_Amount_Achieved_Opportunity_Name__c = eachAcc.opportunities[0].name;
            } else {
                eachAcc.Target_Amount_Achieved_Opportunity_Name__c=null;
            }
            
        }
        update listAccWithClosedWonOpps;
    }
    /*Update the 'Total Amount Generated' at Account with the total of Amount for all the
    closed Won Opportunities related to an Account.*/
    @future
    public static void UpdateTotalAmountGenerated(Set<id> accountIds) {
        List<account> listAccWithOpps = [select id, Total_Amount_Generated__c, (select amount from opportunities where amount != null and StageName = 'Closed Won') from account where id in : accountIds];
        for (account eachAcc : listAccWithOpps) {
            decimal sumOfAmount = 0;
            for (opportunity eachOpp : eachAcc.opportunities) {
                sumOfAmount += eachOpp.amount;
            }
            eachAcc.Total_Amount_Generated__c = sumOfAmount; 
        }
        update listAccWithOpps;
    }
}
