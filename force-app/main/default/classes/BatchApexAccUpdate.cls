public class BatchApexAccUpdate implements Database.Batchable <sObject>, Schedulable {
    
//Example 3: With Batch class update newly inserted 270 records in account object
//          make Active field 'Yes' and put a description....
//QueryLocator
    public Database.QueryLocator start(Database.BatchableContext BC){
        
        String query = 'SELECT Id, Name, Active__c, Description FROM Account WHERE Name LIKE \'Iterable%\'';
        
        return Database.getQueryLocator(query);
    }
        
    public void execute(Database.BatchableContext BC, List<Account> accToUpdate){
        
        for(Account acc : accToUpdate){ //approximately it has 270 records in the list
            
            acc.Active__c = 'YES';
            acc.Description = 'Account has updated';
            System.debug(acc);
        }
        update accToUpdate;
    } 
    
    public void finish(Database.BatchableContext BC){
        
        System.debug('Account records are updated!');
        
    }
    
    
    public void execute(SchedulableContext sc){
        BatchApexAccUpdate baup = new BatchApexAccUpdate();
        Database.executeBatch(baup);
        
    }
}