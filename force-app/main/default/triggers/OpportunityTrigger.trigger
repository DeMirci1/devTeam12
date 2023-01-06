trigger OpportunityTrigger on Opportunity (before insert, after insert, before update, after update) {
    Set<id> accountIds = new Set<id>();

    if(trigger.isAfter){
        
        if(trigger.isUpdate){
            for (opportunity eachOpp : trigger.New) {
                if (eachOpp.amount != trigger.OldMap.get(eachOpp.id).amount || 
                eachOpp.StageName != trigger.OldMap.get(eachOpp.id).StageName || 
                eachOpp.accountId != trigger.OldMap.get(eachOpp.id).accountId) {
                    accountIds.add(eachOpp.accountId);
                }
            }
        }
        if(trigger.isInsert || trigger.isUndelete){
            for (opportunity eachOpp : trigger.New) {
                if (eachOpp.accountId != null) {
                    accountIds.add(eachOpp.accountId);
                }
            }
        }
        if(trigger.isDelete){
            for (Opportunity eachOpp : trigger.old) {
                if (eachOpp.AccountId != null) {
                    accountIds.add(eachOpp.accountId);
                }
                
            }
        }
    }
    if (!accountIds.isEmpty()) {
    AccountAndOpportunityWeek8Handler.UpdateHighestAmountOpportunityName(accountIds);
    AccountAndOpportunityWeek8Handler.UpdateTargetAmountAchievedOpportunityName(accountIds);
    AccountAndOpportunityWeek8Handler.UpdateTotalAmountGenerated(accountIds);
    }


    /*if(trigger.isBefore && trigger.isUpdate){
        //soru 1 (dec 14 wednesday)
        //OpportunityTriggerHandlerWeek6.printOppFields(trigger.New, trigger.Old, trigger.OldMap, trigger.NewMap);
    }
    //soru 3 (dec 14 wednesday)
    OpportunityTriggerHandlerWeek6.updateStage(trigger.New, trigger.Old, trigger.OldMap, trigger.NewMap);
}
    /*
    //Part 2 - 2
    if(trigger.isBefore && trigger.isInsert){
        for(Opportunity eachOpp : trigger.new){
            system.debug('Opp name is: ' + eachOpp.Name + ' Close date is: ' + eachOpp.CloseDate + ' Opp amount is: ' + eachOpp.Amount);
        }
        system.debug('size is ' + trigger.new.size());
    }
    */
    //Part 2 - 4
    /*if(trigger.isBefore && trigger.isInsert){
        for(opportunity eachOpp : trigger.new){
            system.debug('stage name is ' + eachOpp.StageName + ' description: ' + eachOpp.Description + ' opp name is: ' + eachOpp.Name);
        }
    }
    */
}