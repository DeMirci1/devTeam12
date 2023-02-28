import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';

import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import ACCOUNT_FIELD from '@salesforce/schema/Opportunity.AccountId';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';

export default class LightningRecordFormOpportunity extends LightningElement {
    recordId = '006Do000003HfNWIA0';
    objectName = OPPORTUNITY_OBJECT;
    fields = [
        ACCOUNT_FIELD,
        NAME_FIELD,
        AMOUNT_FIELD,
        STAGENAME_FIELD,
        TYPE_FIELD,
        CLOSEDATE_FIELD
    ];

    successHandler(){
        const successToast = new ShowToastEvent({
            title: "Success",
            message: "Opportunity has saved successfully",
            variant: "Success"
        })
        this.dispatchEvent(successToast);
    }
}