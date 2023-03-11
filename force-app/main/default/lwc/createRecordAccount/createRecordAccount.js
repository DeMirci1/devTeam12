import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';

import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class CreateRecordAccount extends LightningElement {
    industryOptions = [];
    formData = {};

    changeHandler(event){
        const {name, value} = event.target;
        this.formData[name] = value;
        console.log(JSON.stringify(this.formData));
    }
    
    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    accountInfo;

    @wire(getPicklistValues, {fieldApiName: INDUSTRY_FIELD, recordTypeId: '$accountInfo.data.defaultRecordTypeId'})
    picklistHandler({data, error}){
        if (data) {
            this.industryOptions = data.values;
        }
        if (error) {
            console.error(error);
        }
    }
    
    saveAccount(){
        const recordInput = {
            apiName: ACCOUNT_OBJECT.objectApiName,
            fields: this.formdata
        }
        createRecord(recordInput)
            .then(result =>{
                const successToast = new ShowToastEvent({
                    title : "Success",
                    message : "Account Record has been created successfuly!",
                    variant : "success"
                });
                this.dispatchEvent(successToast);
            })
            .catch(error =>{
                console.error(error);
            })
    }
    cancelAccount(){
        this.template.querySelector('form.accountForm').reset();
        this.formData = {};
    }
}