import { getRecord, updateRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import NAME_FIELD from '@salesforce/schema/Employee__c.employee_name__c';
import EMAIL_FIELD from '@salesforce/schema/Employee__c.email__c';
import DESIGNATION_FIELD from '@salesforce/schema/Employee__c.designation__c';

const FIELDS = [NAME_FIELD, EMAIL_FIELD, DESIGNATION_FIELD];

export default class UpdateRecordEmployee extends LightningElement {
    recordId = "a09Do000000QpKnIAK";
    formdata = {};

    @wire(getRecord, {recordId: '$recordId', fields: FIELDS})
    employee;

    changeHandler(event){
        const {name, value} = event.target;
        this.formdata[name] = value;
    }

    updateEmployee(){
        this.formdata["Id"] = this.recordId;
        const recordInput = {
            fields: this.formdata
        };
        updateRecord(recordInput)
            .then(result => {
                const successToast = new ShowToastEvent({
                    title: "Success",
                    message: "Employee has been successfully updated",
                    variant: "success"
                });
                this.dispatchEvent(successToast);
            })
            .cathch(error => {
                console.error(error);
            })
    }
    
}