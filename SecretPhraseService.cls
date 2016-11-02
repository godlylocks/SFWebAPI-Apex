public class SecretPhraseService {
    
    @future(callout=true)
    public static void makeCallout() {
        identifySecretPhrase();        
    }
    
    private static void identifySecretPhrase() {
        HttpRequest webRequest = buildRequestObject();
        GenericWebCalloutService.makeCallout(webRequest);
        
    }
    
    private static HttpRequest buildRequestObject() {
        HttpRequest webRequest = new HttpRequest();
        webRequest.setEndpoint('callout:Secret_Phrase/rest/v1/SimpleController/secretPhrase');
        webRequest.setTimeout(2000);
        webRequest.setMethod('GET');
        webRequest.setHeader('Content-Type', 'application/json');
        return webRequest;
    }

}