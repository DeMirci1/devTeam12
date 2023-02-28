import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CASE_OBJECT from '@salesforce/schema/Case';

import ACCOUNT_FIELD from '@salesforce/schema/Case.AccountId';
import CONTACT_FIELD from '@salesforce/schema/Case.ContactId';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import DESCRIPTION_FIELD from '@salesforce/schema/Case.Description';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';

export default class LightningRecordEditFormCASE2 extends LightningElement {
    recordId = "500Do000001cOSLIA2";
    objectName = CASE_OBJECT;
    fields = {
        accountId: ACCOUNT_FIELD,
        contactId: CONTACT_FIELD,
        subject: SUBJECT_FIELD,
        priority: PRIORITY_FIELD,
        status: STATUS_FIELD,
        description: DESCRIPTION_FIELD,
        origin: ORIGIN_FIELD
    };

    successHandler(){
        const showToast = new ShowToastEvent({
            title:"Success",
            message: "Saved",
            variant: "success"
        });
        this.dispatchEvent(showToast);
    }

} 