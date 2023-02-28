import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import EMP_OBJECT from '@salesforce/schema/Employee__c';
import EMPLOYEE_NAME_FIELD from '@salesforce/schema/Employee__c.employee_name__c';
import DESIGNATION_FIELD from '@salesforce/schema/Employee__c.designation__c';
import EMAIL_FIELD from '@salesforce/schema/Employee__c.email__c';
import USERNAME_FIELD from '@salesforce/schema/Employee__c.username__c';
import PHONE_FIELD from '@salesforce/schema/Employee__c.phone_number__c';
import GENDER_FIELD from '@salesforce/schema/Employee__c.gender__c';

export default class LightningRecordEditFormEmp extends LightningElement {
    objectName = EMP_OBJECT;
    fields = {
        employeeName: EMPLOYEE_NAME_FIELD,
        designation: DESIGNATION_FIELD,
        email: EMAIL_FIELD,
        username: USERNAME_FIELD,
        phone: PHONE_FIELD,
        gender: GENDER_FIELD
    };

    successHandler(){
        const successToast = new ShowToastEvent({
            title: "Success",
            message: "Employee has been saved successfully",
            variant: "success"
        })
        this.dispatchEvent(successToast);
    }
}