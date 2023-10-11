public class GetOpportunitiesSchedulable implements Schedulable{
    
    
    public void execute(SchedulableContext context){
        
        //type query to call opportunitites whose close date is passed....
        //close data will be in the past, ana isclosed checkbox will be unchecked.
        
        
       List<Opportunity> oppList = [SELECT ID, Name, CloseDate, IsClosed, OwnerId FROM Opportunity WHERE IsClosed = false AND CloseDate < TODAY];
        TaskClass.createTaskForOpp(oppList);
        //we send opportunity records in a list to other class 
        //in other class task will be created...
        
    }

}