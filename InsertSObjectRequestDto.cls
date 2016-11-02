public class InsertSObjectRequestDto {
    
    private String objectType; 
    private String recordId; 
    private Map<String, Object> fieldMap; 
    
    public String getObjectType() {
        return objectType;
    }
    
    public void setObjectType(String inputObjectType) {
        objectType = inputObjectType;
    }
    
    public String getRecordId() {
        return recordId;
    }
    
    public void setRecordId(String inputRecordId) {
        recordId = inputRecordId;
    }
    
    public Map<String, Object> getFieldMap() {
        return fieldMap;
    }
    
    public void setFieldMap(Map<String, Object> inputFieldMap) {
        fieldMap = inputFieldMap;
    }

}