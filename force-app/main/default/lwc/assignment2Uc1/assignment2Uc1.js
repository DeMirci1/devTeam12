import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import OPP_OBJECT from '@salesforce/schema/Opportunity';


export default class assignment2Uc1 extends LightningElement {
    oppName;
    typeOptions=[];
    stageOptions=[];
    selectedStage;
    selectedType;
    DefaultRecordTypeId;

    @wire(getObjectInfo, {objectApiName: OPP_OBJECT})
    opportunityInfo({data, error}){
        if (data) {
            console.log(data);
            this.DefaultRecordTypeId = data.defaultRecordTypeId;
        }
        if (error) {
            console.error(error);
        }
    }

    @wire(getPicklistValuesByRecordType, {objectApiName:OPP_OBJECT, recordTypeId: '$DefaultRecordTypeId'})
    picklistHandler({data,error}){
        if(data){
            console.log(data);
            this.stageOptions=data.picklistFieldValues.StageName.values;
            this.typeOptions=data.picklistFieldValues.Type.values;
        }
        if(error){
            console.error(error);
        }
    }
    changeHandler(event){
        if(event.target.label==="Select Stage Name"){
            this.selectedStage=event.target.value;
        }else if(event.target.label==="Select Opportunity Type"){
            this.selectedType=event.target.value;
        }else{
            this.oppName=event.target.value;
        }     
    }       

}