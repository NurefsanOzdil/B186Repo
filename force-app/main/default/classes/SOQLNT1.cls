public class SOQLNT1 {
     
    //Example 7: Find the account name, account rating,
	//contact name, contact department, contact title,
	//and case number, case subject => for every contact....          
     
    public void queryMethod(){
        
        //type the query and put the result into the list
        List<Contact> myConts = [SELECT Account.Name, Account.Rating, Contact.Name, Contact.Department, Contact.Title,
            (SELECT CaseNumber, Subject FROM Cases)            
            FROM Contact];

		//Print all the records in different lines on the console...
        for(Contact con : myConts){
            
            System.debug(con);
        }
		//we will not see case details in printed records...
		//and we will not see parent account details (name & rating) on the console
		//we can see the details only from main object (contact)
		//1) No parent detail of contact.... 2) No child detail of contact => only contact       
        
        
        
        
        //How to see parent object details
        for(Contact w : myConts){
            //Now we have parent object detail of contact
            System.debug('Account Name : ' + w.Account.Name + ', Account Rating: ' + w.Account.Rating);
        }//you have to specify parent obj details yo print
    
            
        
        //How to print child query details
        for(Contact cont : myConts){
            //child query returns as a list in main query... list in the list
            for(Case c : cont.Cases){
                System.debug('Case Number : '+ c.CaseNumber + ', Case Subject : ' + c.Subject);
            }
        }
    }    
}