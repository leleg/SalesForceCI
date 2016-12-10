trigger OnComissionInsertUpdateDelete on Comission__c(after insert, after update , after delete) {
   Triggers__c newInstance = Triggers__c.getValues('ComissionTriggers.updateComission');
   if(newInstance != null && newInstance.get('Active__c') == true)
     ComissionTriggers.updateComissionOfAgent();
     }