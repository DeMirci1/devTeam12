import { LightningElement } from 'lwc';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FILED from '@salesforce/schema/Account.AnnualRevenue';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';

export default class LightningRecordViewFormAccount extends LightningElement {
    recordId = "001Do000003DzZwIAK";
    objectName = ACCOUNT_OBJECT;   
    fields = {
        Name: NAME_FIELD,
        Type: TYPE_FIELD,
        Industry: INDUSTRY_FIELD,
        AnnualRevenue: REVENUE_FILED,
        Phone: PHONE_FIELD

    }; 
}