import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import OPP_OBJECT from '@salesforce/schema/Opportunity';

export default class GetPicklistValuesByRecordTypeOppotunity extends LightningElement {

    defaultRtId;
    stageNameOptions = [];
    leadSourceOptions = [];

    @wire(getObjectInfo, {objectApiName: OPP_OBJECT})
    objectInfoHandler({data, error}){
        if (data) {
            this.defaultRtId = data.defaultRecordTypeId;
        }
        if (error) {
            console.error(error);
        }
    }

    @wire(getPicklistValuesByRecordType, {objectApiName: OPP_OBJECT, recordTypeId: '$defaultRtId'})
    picklistHandler({data,error}){
        if (data) {
            console.log(data);
        }
        if (error) {
            console.error(error);
        }
    }
}