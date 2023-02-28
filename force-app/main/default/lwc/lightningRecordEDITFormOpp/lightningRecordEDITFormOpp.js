import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import ACCOUNT_FIELD from '@salesforce/schema/Opportunity.AccountId';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';

export default class LightningRecordEDITFormOpp extends LightningElement {
    recordId = '006Do00000319AjIAI';
    objectName = OPPORTUNITY_OBJECT;
    
    fields = {
        accountId : ACCOUNT_FIELD,
        name : NAME_FIELD,
        amount : AMOUNT_FIELD,
        stage : STAGENAME_FIELD,
        type : TYPE_FIELD,
        closeDate : CLOSEDATE_FIELD
    };

    successHandler(){
        const successToast = new ShowToastEvent({
            title: "Success",
            message: "Opportunity has been saved successfully",
            variant: "success"
        })
        this.dispatchEvent(successToast);
    }
}
