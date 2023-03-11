import getTopOpportunities from '@salesforce/apex/OpportunityCtrl.getTopOpportunities';
import { LightningElement,wire } from 'lwc';

const COLUMNS = [
    {label:"Opportunity Name", fieldName: "Name", type: "text"},
    {label:"Opportunity Type", fieldName: "Type", type: "text"},
    {label: "Amount", fieldName: "Amount", type: "currency"}
    
];

export default class WiredApex2 extends LightningElement {
    stageName = "closed Won";

    @wire(getTopOpportunities, {stage: '$stageName'})
    opps;
}