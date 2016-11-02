public class GenericWebCalloutService {
    
    public static HttpResponse makeCallout(HttpRequest webRequest) {
        Http httpObj = new Http();
        
        HttpResponse webResponse = null;
        try {
            webResponse = httpObj.send(webRequest);
        } catch (Exception e) {
            System.debug('First exception during callout. Retrying if necessary. Exception: [' + e + ']');
            if (e instanceof CalloutException) {
                webRequest.setTimeout(10000);
                try {
                    webResponse = httpObj.send(webRequest);
                } catch(Exception e2) {
                    System.debug('Unhandled exception. Creating Error Record. Exception: [' + e + ']');
                    createCalloutRecord(webRequest, webResponse, e2.getMessage());
                }
            }
            createCalloutRecord(webRequest, webResponse, e.getMessage());
        }
        
        createCalloutRecord(webRequest, webResponse, webResponse.getStatus());
        return webResponse;
    }
    
    public static void createCalloutRecord(HttpRequest webRequest, HttpResponse webResponse, String errorText) {
        Web_Callout__c callout = new Web_Callout__c(
            Endpoint_URL__c = webRequest.getEndpoint(),
            HTTP_Method__c = webRequest.getMethod(),
            HTTP_Return_Code__c  = webResponse == null ? null : webResponse.getStatusCode(),
            Request_JSON__c = webRequest.getBody(),
            Error_Text__c = errorText
        );
        insert callout;
    }
    
    
    
}