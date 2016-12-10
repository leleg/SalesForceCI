public without sharing class FriendsController
{
    public List<Friend__c> ListFriends {get; set;}
    public Friend__c ShowFriend {get; set;}
    public FriendsController()
    {  
            ListFriends = [select id, Name,Last_Name__c, Address__c,Mobile_Number__c,Salute__c from Friend__c];
            ShowFriend = new Friend__c();
    }

    @RemoteAction
    public static List<Friend__c> AllFriendsDetails(string str)
    {
        string result = 'true';
        List<Friend__c> ListFriends = [select id, Name,Last_Name__c, Address__c,Mobile_Number__c,Salute__c from Friend__c];
        return ListFriends;
    }

    public void SetShowRecord() 
    {
        String BaseURL = URL.getSalesforceBaseUrl().toExternalForm();
        new PageReference(BaseURL+'/apex/Friends_Detail').setRedirect(false);
        BaseURL+='/apex/AccountDetails';
        System.debug('ShowFriend:'+ShowFriend);
        //return (new PageReference(BaseURL));
    }
}