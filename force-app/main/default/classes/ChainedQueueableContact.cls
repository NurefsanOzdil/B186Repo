public class ChainedQueueableContact implements Queueable{
    //Create 20 contact records in this class
    public void execute(QueueableContext context){
        List<Contact> conList = new List<Contact>();
        
        for(Integer i=1; i<21; i++){
            Contact con = new Contact();
            
            con.LastName = 'Chained Queueable x' + i;
            con.FirstName = 'Session ' + i;
            
            conList.add(con);
            
        }
        insert conList;
        
        System.debug('Number of Inserted Contacts : ' + conList.size());
        for(Contact c : conList){
            
            System.debug('Inserted Contact: ' + c);
        }
        
    }
    
    
}