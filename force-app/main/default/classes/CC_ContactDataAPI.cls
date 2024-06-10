@RestResource(urlMapping='/getContactCostInfo/*')
global class CC_ContactDataAPI {
     @HttpGet
    global static void doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        String uuid = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        
        try {
            Map<String, Object> result = CC_ContactCostAPI.getContactCostInfo(uuid);
            res.statusCode = 200;
            res.responseBody = Blob.valueOf(JSON.serialize(result));
        } catch (Exception e) {
            res.statusCode = 500;
            res.responseBody = Blob.valueOf(JSON.serialize(new Map<String, String>{ 'error' => e.getMessage() }));
        }
    }
}