import { LightningElement,api,wire,track } from 'lwc';
import getContact from '@salesforce/apex/GB_c360DataCloud_Controller.getContact';

export default class c360DataCloud extends LightningElement {
    @api recordId;
    

    @api bgImage;
    @api height;
    @api gradient;
    @api textColor;

    @api AccountLabel;
    @api AccountIcon;

    @api EmailLabel;
    @api EmailIcon;

    @api MobileLabel;
    @api MobileIcon;
    
    @api CustomerSinceLabel;
    @api CustomerSinceIcon;   
    
    @api TotalCustomerValueLabel;
    @api TotalCustomerValueIcon;  

    @api CsatLabel;
    @api CsatIcon; 
    
    @api RatingLabel;
    @api RatingIcon;    
    @api RatingStar;    

    @api ChurnLabel;
    @api ChurnIcon;     

    @api OptInLabel;
    @api MobileOptInIcon;    
    @api EmailOptInIcon;    

    @track contact;
    
    @wire(getContact, {contactId: '$recordId'}) 
    loadContact(result){
      console.log("Result "+ JSON.stringify(result));
      console.log("Result data "+ JSON.stringify(result.data));
        if (result.data) {
          this.contact = result.data;
          this.error = undefined;
        } else if (result.error) {
          this.error = result.error;
          console.log("Error "+ JSON.stringify(result.error));
          this.contact = undefined;
        }
      }

      get cardStyle()
      {
        return "background-image: url('"+this.bgImage+"'), linear-gradient(180deg,"+this.gradient+"); height:"+this.height+";color: "+this.textColor+";";

      }

      get ratingIcons()
      {
        toRet = "<lightning-icon class='my-icons' size='x-small' icon-name='"+this.Attr4Icon2+ "'alternative-text='ID' title='ID'></lightning-icon>";
        for(let i=0; i<this.lstAccounts.length; i=i+20){
          if(this.contact.Rating__c > i)
            {
              toRet = toRet + toRet;
            }
        }
        return toRet;
      }

}