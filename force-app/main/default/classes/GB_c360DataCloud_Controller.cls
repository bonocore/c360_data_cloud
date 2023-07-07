public with sharing class GB_c360DataCloud_Controller {
    
    @AuraEnabled(cacheable=true scope='global')
    public static Account getPersonAccount(String accountId) {
        System.debug('Get Person Account for id '+accountId);
         
         accountId = accountId.trim();
         if (accountId == '') {
             return null;
         }
         
// select ssot__LastName__c from ssot__Individual__dlm where ssot__Id__c = '0030900001pWnJJAA0' // non serve
         

         // Execute search query
         // select Id, Name, PersonContactId from Account where ID = '0010900001yDDhqAAG'
         // select id from Contact where id in (select PersonContactId from Account where id = '0010900001yDDhqAAG')
         // select UnifiedRecordId__c from IndividualIdentityLink__dlm where SourceRecordId__c = '0030900001pWnJJAA0'
         // select ssot__FirstName__c, ssot__LastName__c,Residence_City__c, ssot__ResidenceCountryId__c, ssot__BirthDate__c,  from UnifiedIndividual__dlm where ssot__id__c = '19937fb637465a6854fc1bda330de8e0'
        
       
        


        return [
            select Id, Name, PersonEmail, BillingCity, BillingState, BillingCountry  from Account where ID = :accountId
        ];



    }

    @AuraEnabled(cacheable=true scope='global')
    public static Contact getContact(String contactId) {
        System.debug('Get Person Contact for id '+contactId);
         
        contactId = contactId.trim();
         if (contactId == '') {
             return null;
         }
        
      
         Contact toRet = Database.query('select Id, Name, SDO_Cust360_Contact_Picture_URL__c, MailingCity, MailingStreet, AccountId,  Account.Name, Email, MobilePhone, SDO_Cust360_CSAT__c, CreatedDate, et4ae5__HasOptedOutOfMobile__c, HasOptedOutOfEmail, Title, Total_Customer_Value__c, Rating__c, SDO_Cust360_ChurnRisk__c from Contact where ID = :contactId');

         System.debug('To Ret '+toRet);
        return toRet;



    }
 
}