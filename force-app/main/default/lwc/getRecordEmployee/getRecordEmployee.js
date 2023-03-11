import { getFieldValue, getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';

/* APPROACH ==>> 2*/
import NAME_FILED from '@salesforce/schema/Employee__C.Name';
import EMP_NAME_FIELD from '@salesforce/schema/Employee__C.employee_name__c';
import DESIGNATION_FILED from '@salesforce/schema/Employee__C.designation__c';
import GENDER_FILED from '@salesforce/schema/Employee__C.gender__c';
import EMAIL_FILED from '@salesforce/schema/Employee__C.email__c';
import USERNAME_FILED from '@salesforce/schema/Employee__C.username__c';
import PHONE_FILED from '@salesforce/schema/Employee__C.phone_number__c';

export default class GetRecordEmployee extends LightningElement {

    recordId = "a09Do000000QpMNIA0";
    employeeId;
    employeeName;
    designation;
    gender;
    email;
    userName;
    phoneNumber;

    @wire(getRecord, {recordId: '$recordId', layoutTypes : ['Full'], modes : ['View']})
    recordHandler({data, error}){
        if (data) {
            console.log(data);
            /* Approach ==>> 1
            this.employeeId = data.fields.Name.value;
            this.employeeName = data.fields.employee_name__c.value
            this.designation = data.fields.designation__c.value;
            this.gender = data.fields.gender__c.displayValue;
            this.email = data.fields.email__c.value;
            this.userName = data.fields.username__c.value;
            this.phoneNumber = data.fields.phone_number__c.value;*/

            /*Approach ==>> 2 */
            this. employeeId = getFieldValue(data, NAME_FILED);
            this. employeeName = getFieldValue(data, EMP_NAME_FIELD);
            this. designation = getFieldValue(data, DESIGNATION_FILED);
            this. gender = getFieldValue(data, GENDER_FILED);
            this. email = getFieldValue(data, EMAIL_FILED);
            this. userName = getFieldValue(data, USERNAME_FILED);
            this. phoneNumber = getFieldValue(data, PHONE_FILED);
        }
        if (error) {
            console.error(error);
        }
    }

}