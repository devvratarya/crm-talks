/**
 * Created by darya on 7/20/2018.
 */
 
public with sharing class classCheckPC{
 
    public Map<Account,List<Opportunity>> accountOpportunitiesMap {get; set;}
 
    public classCheckPC(){
        accountOpportunitiesMap = (Map<Account,List<Opportunity>>) Cache.Session.get(classInitiatePC.class,'accountOpty');
 
    }
}