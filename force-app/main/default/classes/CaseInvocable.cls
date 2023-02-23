public with sharing class CaseInvocable {

    @invocableMethod(Label= 'Sen Email & Save Activities'
    description= 'This method sends email and save activities'
    category= 'Case')

    public static void sendEmailSaveActivity(List<InputRequest> inputs) {
        List<Messaging.SingleEmailMessage> msgs = new List<Messaging.SingleEmailMessage>();
        for (InputRequest input : inputs) {
            Messaging.SingleEmailMessage msg= new Messaging.SingleEmailMessage();
            msg.setSubject('Case created: ' + input.caseNumber);
            msg.setPlainTextBody('A Case has been created for your query. Please quote the case number available in the subject when you talk to customer care');
            msg.setTargetObjectId(input.contactId);
            msg.setSaveAsActivity(true);
            msgs.add(msg);

        }
        if (!msgs.isEmpty()) {
            Messaging.sendEmail(msgs);
        }
    }    

    public class InputRequest {
        @invocableVariable(Label= 'Contact ID' Description= 'Contact Id' required= true)
        public Id contactId;

        @invocableVariable(Label= 'Case ID' Description= 'Case Number' required= true)
        public string caseNumber;        
    }
}


