import { LightningElement } from 'lwc';
import LEAD_OBJ from '@salesforce/schema/Lead';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateRecordLead extends LightningElement {

    formdata = {};

    changeHandler(event){
        const {name,value} = event.target;
        this.formdata[name] = value;
        console.log(JSON.stringify(this.formdata));
    }

    saveLead(){
        const recordInput = {
            apiName: LEAD_OBJ.objectApiName,
            fields: this.formdata
        }

        createRecord(recordInput)
        .then(result => {
            console.log(result);
            //show success toast
            const successToast = new ShowToastEvent({
                title: "Success",
                message: "Lead record was created successfully",
                variant: "success"
            });
            this.dispatchEvent(successToast);
            this.cancelLead();
        })
        .catch(error => {
            console.error(error);
            const errorMsg = new ShowToastEvent({
                title: "Error",
                message: "Lead record couldn't be created.",
                variant: "error"
            });
            this.dispatchEvent(errorMsg);
        })
    }

    cancelLead(){
        this.template.querySelector('form.leadform').reset();
    }
}