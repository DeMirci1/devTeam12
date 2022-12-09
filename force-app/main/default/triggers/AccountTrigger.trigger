trigger AccountTrigger on Account (before insert, after insert) {
    if(trigger.isBefore){
        System.debug('Account before insert trigger called');
    }
    if(trigger.isAfter){
    System.debug('Account after insert trigger called');
    }
}