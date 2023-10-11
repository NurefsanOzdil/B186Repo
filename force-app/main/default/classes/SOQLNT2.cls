public class SOQLNT2 {
    
    //Example 8: Find the account name, account rating, 
        //and contact name, contact department, contact title, 
        //and Opportunity Name, Opportunity Amount for every contact.
       
    public static void queryMethod2(){
        
      List<Contact> conList = [SELECT Account.Name, Account.Rating,
            Contact.Name, Contact.Department, Contact.Title,
            (SELECT Opportunity.ContactID, Opportunity.Name, Opportunity.Amount FROM Opportunities)
            FROM Contact];
        
        //How to see main object details (contact)
        //How to see parent object details(account)
        for(Contact w : conList){
            
            System.debug(w + ' => Account Name :' + w.Account.Name + ', Account Rating : ' + w.Account.Rating);
        }
        
        
        //How to see child query details
        for(Contact con : conList){
            //to access inner list of child query: we create inner loop...
            for(Opportunity opp : con.Opportunities){
                
                System.debug('Opportunity Name: ' + opp.Name + ', Opportunity Amount: '+ opp.Amount + ', Contact ID: ' + con.ID + ' OR ' + opp.ContactId);
            }
            
        }
          
    }

}