public class ContactTriggerHandler {
    public static void updateContactValidation1(List<contact> conTriggerNew, List<contact> conTriggerOld,
                                    Map<id, contact> conTriggerNewMap, map<id, contact> conTriggerOldMap) {
        for (contact eachContact : conTriggerNew) {
            contact oldContact = conTriggerOldMap.get(eachContact.id);
            if (oldContact.LeadSource == 'Partner Referral') {
                eachContact.addError('Cannot update Partner Referral contact');
            }
        }
        for (contact eachContact : conTriggerNew) {
            if (eachContact.leadSource != conTriggerOldMap.get(eachContact.id).LeadSource) {
                eachContact.LeadSource.addError('Can not update LEADSOURCE sorry');
                
            }
        }
    }
}