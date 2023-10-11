public class SOQL9 {
//Example: Fetch the record from database whose rating is hot and phone number is "+170999666333"  
  public void deleteTheRecord(){
        
       /* List<Account> accList = [SELECT Name, Phone, Rating FROM Account WHERE Rating='Hot' AND Phone='+170999666333'];

			delete accList;
			Database.delete(acc);
       		Database.delete(acc, true);
			Database.delete(acc, false);
			System.debug(accList);   */
        
        //best practice is deleting records one by one...
       
        Account acc = [SELECT ID FROM Account WHERE Rating='Hot' AND Phone='+170999666333' LIMIT 1];
        delete acc;
        System.debug(acc);
        
        
    } 
 public void undeleteTheRecord(){
        
        //when a record is deleted; "isDeleted" field will be "True"
       List<Account> accListToUndelete = [SELECT ID, Name FROM Account WHERE Name='2nd Acc for practice' AND isDeleted=true ALL ROWS ];
        
        undelete accListToUndelete;
        
        System.debug(accListToUndelete);
    }
}