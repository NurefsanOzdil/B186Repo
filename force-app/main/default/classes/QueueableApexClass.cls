public class QueueableApexClass implements Queueable {
    
        //Example: Create 100 Account records in database    
    
    public void execute(QueueableContext context){
        //there is only execute method... and type awesome code here...
        List<Account> accList = new List<Account>();
        
        for(Integer i=300; i<401 ; i++){
            
            Account acc = new Account(Name = 'Queueable Apex '+i);
            accList.add(acc);
        }
        insert accList;
        
        for(Account ac : accList){
            System.debug(ac); //display on the console after records are inserted..
        }
    }
}