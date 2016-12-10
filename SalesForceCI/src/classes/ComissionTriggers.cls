public with sharing class ComissionTriggers{
     
    public static void updateComissionOfAgent()
    {
        List<Comission__c> lstNewComissions = null;
        
        if(Trigger.isAfter && ( Trigger.isInsert || Trigger.isUpdate))
        { 
            lstNewComissions =  Trigger.new;
        }
        else if(Trigger.isAfter &&  Trigger.isDelete)
        {
            lstNewComissions =  Trigger.old;
        }
        if(lstNewComissions !=null && lstNewComissions.size()>0)
        {
            List<Agent__c> lstAgents= null;
            if(lstNewComissions[0].Client__c ==null)
                return;
                
            lstAgents=  [select Id, Comission__c from Agent__c where Id = :lstNewComissions[0].Client__c];
           
            if(lstAgents!=null && lstAgents.size()>0)   
            {
                List<Comission__c> lstComission = [select Id, Comission__c from Comission__c where Client__c = :lstAgents[0].Id];
                double comision = 0.0;
                for(Comission__c currentCom : lstComission)
                {
                    if(currentCom.Comission__c !=null)
                        comision += currentCom.Comission__c;
                }
                lstAgents[0].Comission__c = comision;
                update lstAgents[0];
            }            
        }
    }
}