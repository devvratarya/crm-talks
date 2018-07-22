/**
 * Created by darya on 7/11/2018.
 */
 
public with sharing class classInitiatePC implements Cache.CacheBuilder{
    //public Map<Id,Account> accountMap;
    public Map<Account,List<Opportunity>> accountOpportunitiesMap {get; set;}
 
    public Object doLoad(String name) {
        List<Account> accounts= [SELECT Id, Name, BillingCountry, (SELECT Id, Name, Amount,CloseDate, Account.Name FROM Opportunities) FROM Account WHERE BillingCountry='Germany'];
        Map<Account,List<Opportunity>> accountOpty = new Map<Account, List<Opportunity>>();
        for( Account account : accounts )
        {
            if( !account.Opportunities.isEmpty() )
            {
                accountOpty.put(account,account.Opportunities);
            }
        }
        return accountOpty;
    }
 
    public classInitiatePC(){
 
    }
 
    public PageReference getAccountOpportunitiesFromCache(){
        accountOpportunitiesMap = (Map<Account,List<Opportunity>>) Cache.Session.get(classInitiatePC.class,'accountOpty');
        return null;
    }
 
    public PageReference gotoNextPage(){
        PageReference pageRef = new PageReference('/apex/CheckPlatformCacheVariable');
        return pageRef;
    }
 
}