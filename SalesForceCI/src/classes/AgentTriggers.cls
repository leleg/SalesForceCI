public with sharing class AgentTriggers{
     
    public static void updateComissionOnAgent()
    {
        List<Agent__c> lstNewAgents = null;
        
        if(Trigger.isAfter && ( Trigger.isInsert || Trigger.isUpdate))
        { 
            lstNewAgents =  Trigger.new;
        }
        else if(Trigger.isAfter &&  Trigger.isDelete)
        {
            lstNewAgents =  Trigger.old;
        }
        if(lstNewAgents !=null && lstNewAgents.size()>0)
        {
            List<Comission__c> lstComission = null;
            Comission__c childComission = null;
             if(Trigger.isAfter && (Trigger.isUpdate || Trigger.isDelete))
                lstComission =  [select From__c, Client__c, Comission__c from Comission__c where From__c = :lstNewAgents[0].Id];
             
             if(Trigger.isDelete)
             {
                 if(lstComission !=null)
                     delete lstComission;
                 return;   
             }
                
            if(lstComission!=null && lstComission.size()>0)
                childComission = lstComission[0];
            else
            {
                childComission = new Comission__c();
            }

            
             childComission.Name =   lstNewAgents[0].Name + lstNewAgents[0].Last_Name__c;
             childComission.From__c =   lstNewAgents[0].Id;
             childComission.Client__c =   lstNewAgents[0].Agent__c;
             if(lstNewAgents[0].Amount__c!=null)
                 childComission.Comission__c = lstNewAgents[0].Amount__c*0.2;
             if(lstNewAgents[0].Comission__c!=null)
                 childComission.Comission__c += lstNewAgents[0].Comission__c *0.2;
             upsert childComission;
        }
    }
}