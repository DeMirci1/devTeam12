import { LightningElement } from 'lwc';

export default class LocalProperties extends LightningElement {
    name; //undefined
    age = 30;
    fullname = "Adam Smith";
    location = {
        city: "Atlanta",
        satate:"Georgia",
        country: "USA",
        zipcode:"30028",    
    };
    fruit = ["Peach", "Apple", "Orange"];
}