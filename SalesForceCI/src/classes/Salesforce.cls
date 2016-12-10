global class Salesforce{
   
    global Salesforce()
    {
        
    }
    
    @RemoteAction
    global static sObject[] query(String strQuery){
        return Database.query(strQuery);
    }
    
    @RemoteAction
    global static Database.SaveResult[] create(sObject[] records){
        return Database.insert(records);
    }
    
    @RemoteAction
    global static Database.SaveResult[] save(sObject[] records){
        return Database.update(records);
    }
    
    @RemoteAction
    global static Database.DeleteResult remove(sObject record){
        return Database.delete(record);
    }
    
    @RemoteAction
    global static Database.DeleteResult[] removeItems(sObject[] records){
        return Database.delete(records);
    }
    
    global class Result {
        global Result(Boolean bSuccess, String strMessage) {
            Success = bSuccess;
            Message = strMessage;
        }
        global Boolean Success {get;set;}
        global String Message {get;set;}
    }
}