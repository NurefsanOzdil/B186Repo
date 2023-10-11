public class AccountProcessor {
    
    public static void countContacts(List<Id> accIds ){ //get Acc IDs as an argument in paramater outside of the class...
        
        //call accounts and child contacts from database whose ID sent into class method externally
        List<Account> accounts = [SELECT Id, Name, Number_Of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN: accIds];
        
        for(Account acc : accounts){
            
          acc.Number_Of_Contacts__c =  acc.Contacts.size(); //calculate number of child contacts in an account and put into related field
        }
        update accounts;
    }
      

}


//EXAMPLE 2: Create an Apex class and method to update Number_Contacts__c field
// enter the ID of accounts to update as an argument in method parameter...
// then create unit test for the operation