public class CC_ContactCostAPI {
    @AuraEnabled
    public static Map<String, Object> getContactCostInfo(String uuid) {
        Contact contact = [SELECT Id, Home_Country__c, Subscription_Type__c FROM Contact WHERE UUID__c = :uuid LIMIT 1];
        if (contact == null) {
            throw new AuraHandledException('Contact not found');
        }

        ContactCostInfo__c costInfo = [
            SELECT Cost_Per_Month__c, ATM_Fee__c, Card_Replacement_Cost__c 
            FROM ContactCostInfo__c 
            WHERE Country__c = :contact.Home_Country__c AND Subscription_Type__c = :contact.Subscription_Type__c 
            LIMIT 1
        ];
        Map<String, Object> response = new Map<String, Object>();
        response.put('CostPerMonth', costInfo.Cost_Per_Month__c);
        response.put('ATMFee', costInfo.ATM_Fee__c);
        response.put('CardReplacementCost', costInfo.Card_Replacement_Cost__c);
        
        return response;
    }
}