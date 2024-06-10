import { LightningElement,api,wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import getProductInformation from '@salesforce/apex/CC_ProductInformation.getProductInformation';

export default class LwcCustomerInformation extends LightningElement {
    @api recordId;
    productInfo;

    @wire(getRecord, { recordId: '$recordId', fields: CONTACT_FIELDS })
    contact;

    @wire(getProductInformation, { product: '$contact.data.fields.Product__c.value', country: '$contact.data.fields.Home_Country__c.value' })
    wiredProductInfo({ error, data }) {
        if (data) {
            this.productInfo = data;
        } else if (error) {
            console.error(error);
        }
    }
}