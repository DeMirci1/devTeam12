trigger CaseTrigger on Case (before insert, before update, after insert, after update) {
    //1A
    System.debug('WE ARE IN TRIGGER.......');
    //1B
    if(Trigger.isAfter){
        System.debug('WE ARE IN AFTER trigger...');
    }
    //1C
    if(Trigger.isBefore){
        System.debug('WE ARE IN BEFORE trigger...');
    }
    //1D
    if(Trigger.isBefore && Trigger.isUpdate){
        System.debug('WE ARE in BEFORE UPDATE trigger.....');
    }
    //1E
    if(Trigger.isBefore && Trigger.isInsert){
        System.debug('WE ARE IN BEFORE INSERT trigger.......');
    }
    if(Trigger.isAfter && Trigger.isInsert){
        System.debug('WE ARE in AFTER INSERT trigger.....');
    }
    //1E
    if(Trigger.isAfter && Trigger.isUpdate){
        System.debug('WE ARE IN AFTER UPDATE........');
    }
}