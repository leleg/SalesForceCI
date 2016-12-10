trigger OnAgentInsertUpdateDelete on Agent__c (after insert, after update , after delete) {
   Triggers__c newInstance = Triggers__c.getValues('AgentTriggers.updateComissionOnAgent');
   if(newInstance != null && newInstance.get('Active__c') == true)
     AgentTriggers.updateComissionOnAgent();
}