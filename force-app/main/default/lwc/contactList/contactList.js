import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import {reduceErrors} from 'c/ldsUtils';
export default class ContactList extends LightningElement {
    @wire(getContacts) contacts;

    get errors() {
        return (this.contacts.error) ?
            reduceErrors(this.contacts.error) : [];
    }



}
