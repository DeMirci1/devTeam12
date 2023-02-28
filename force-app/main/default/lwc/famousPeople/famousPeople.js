import { LightningElement } from 'lwc';

export default class FamousPeople extends LightningElement {
    contacts = [

        {name : 'Jeff Bezos', 
        title : 'Executive Chairman', 
        company : 'Amazon', 
        state : 'United States'},
        
        {name : 'Sundar Pichai', 
        title : 'Chief Executive Officer', 
        company : 'Google', 
        state : 'United States'},
        
        {name : 'Tim Cook', 
        title : 'Chief Executive Officer', 
        company : 'Apple', 
        state : 'United States'},
        
        {name : 'Mark Zuckerberg', 
        title : 'Chief Executive Officer', 
        company : 'Facebook', 
        state : 'United States'}
        ];   

}