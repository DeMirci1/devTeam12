import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CASE_OBJECT from '@salesforce/schema/Case';
import ACCNAME_FIELD from '@salesforce/schema/Case.AccountId';
import CONTNAME_FIELD from '@salesforce/schema/Case.ContactId';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import DESCRIPTION_FILED from '@salesforce/schema/Case.Description';
import PRIORITY_FILED from '@salesforce/schema/Case.Priority';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';

export default class LightningRecordViewFormCase extends LightningElement {
    recordId = '500Do000001cOSNIA2';
    objectName = CASE_OBJECT;
    fields = {
        accountId : ACCNAME_FIELD,
        contactId : CONTNAME_FIELD,
        subject : SUBJECT_FIELD,
        description : DESCRIPTION_FILED,
        priority : PRIORITY_FILED,
        origin : ORIGIN_FIELD
    };

    successHandler(){
        const successToast = new ShowToastEvent({
            title: "Success",
            message: "Case has been saved successfully",
            variant: "Success"
        })
        this.dispatchEvent(successToast);
    }
}