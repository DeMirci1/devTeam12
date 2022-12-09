public class AccConAndOppOperations {
    public static void sumOpp() {
        AggregateResult[] sumOfAmount = [select sum(amount) from opportunity where StageName = 'Closed Won'];
        system.debug('the result is ' + sumOfAmount);
    }
    //second way
    public static decimal sumOpp2() {
        List<Opportunity> sumOfAmount2 = [select amount from opportunity where StageName = 'Closed Won' and amount != null];

        decimal sum = 0;
        for(Opportunity eachOpportunity : sumOfAmount2) {
            sum+=eachOpportunity.amount;
        }
        system.debug('the total is ' + sum);
        return sum;
    }
    public static void AccountsStageNameFilter(string OppsStageName) 

}
select Id,name from Account where Id not In (SELECT AccountId FROM Case)