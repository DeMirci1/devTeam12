import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import CASE_OBJECT from '@salesforce/schema/Case';

export default class GetObjectInfoCase extends LightningElement {

    caseCustumerSupportRtId;
    caseEnquiryRtId;
    
    @wire(getObjectInfo, {objectApiName: CASE_OBJECT})
    objectInfoHandler({data, error}){
        if (data) {
            console.log(data);
            this.caseCustumerSupportRtId = data.defaultRecordTypeId;
            const rtids = data.recordTypeInfos;
            this.caseEnquiryRtId = Object.keys(rtids).find(rtid => rtids[rtid].name==="Enquiry");         
        }
        if (error) {
            console.log(error);
            
        }    
    }
}