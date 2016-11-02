public class InsertSObjectService {
    
    
    @future(callout=true)
    public static void insertContactRecord(String firstName, String lastName) {
        HttpRequest webRequest = buildRequestObject();
        webRequest.setBody(buildJson(firstName, lastName));
        HttpResponse webResponse = GenericWebCalloutService.makeCallout(webRequest);
        List<UpsertSObjectResponseDto> upsertResult = (List<UpsertSObjectResponseDto>) JSON.deserialize(webResponse.getBody(), List<UpsertSObjectResponseDto>.class);
        System.debug('Web Response: [' + upsertResult + ']');
    }
    
    private static HttpRequest buildRequestObject() {
        HttpRequest webRequest = new HttpRequest();
        webRequest.setEndpoint('callout:Secret_Phrase/rest/v1/Controller/insertSobject');
        webRequest.setTimeout(2000);
        webRequest.setMethod('POST');
        webRequest.setHeader('Content-Type', 'application/json');
        return webRequest;
    }
    
    private static String buildJson(String firstName, String lastName) {
        Map<String, Object> fieldMap = new Map<String, Object>();
        fieldMap.put('FirstName', firstName);
        fieldMap.put('LastName', lastName);
        InsertSObjectRequestDto requestDto = new InsertSObjectRequestDto();
        requestDto.setFieldMap(fieldmap);
        requestDto.setObjectType('Contact');
        requestDto.setRecordId(null); //insert, so no recordId
        return JSON.serialize(requestDto);
    }

}