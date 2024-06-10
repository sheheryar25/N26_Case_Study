public class CC_ProductInformation {
    @AuraEnabled(cacheable=true)
    public static String getProductInformation(String product, String country) {
        Product_Information__mdt productInfo = [
            SELECT Product_Information__c
            FROM Product_Information__mdt
            WHERE Product__c = :product AND Home_Country__c = :country
            LIMIT 1
        ];
        
        if (productInfo != null) {
            return productInfo.Product_Information__c;
        } else {
            return 'No product information found.';
        }
    }
}