public class SOSL {
    
    //Example 4: If any account name contains 'un' in naming 
    //give me the account name, contact firstname&lastname and opportunity name
    
    public static void Sosl01(){
        //we will use list in the list: bcs many object return at the same time without hierarchy
        //when we have list in the list in SOSL, we use Object data type or sObject data type
        //bcs Account, Contact, Opportunity are salesforce objects...
       List<   List<sObject>    > myList = [FIND '*un*' IN NAME FIELDS RETURNING Account(Name), Contact(FirstName, LastName), Opportunity(Name)];
        
        
			System.debug(myList);
        for(List<sObject> w : myList){
            
            System.debug(w); //display the object lists in different lines...
            
            //display account-contact-opportunity records in different lines....
            for(sObject obj  : w){
                System.debug(obj);
            }
        }
     
    }

    
    public static void Sosl02(){
        
         //Example 5: If any account, contact or opportunity has "United" and "88" in name, email and phone fields...
    List<List<Object>> result = [FIND '"un*" OR "88"' IN ALL FIELDS RETURNING Account(Name, Phone), Contact(Name, MobilePhone, Email), Opportunity(Name)];
    
    for(List<Object> objects : result){
        
        for(Object obj : objects){
            
            System.debug(obj);
            
       		 }	
        
   		 }   
        
    }
    
   
}