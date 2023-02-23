import { LightningElement, track } from 'lwc';

export default class TarckProperties extends LightningElement {
    @track location = {
        city : "Las Vegas",
        country : "USA"
    };

    changeHandler(event){
        this.location.city = event.target.value;
    }
}