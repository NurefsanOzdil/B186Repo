public class SOQL1 {
    //Example 7: Find the account name, account rating,
//contact name, contact department, contact title,
//and case number, case subject for every contact.... 

    public void queryMethod(){
        //type the query to call records and put into a variable...
      List<Contact> myContacts = [SELECT Name FROM Contact];
        
    }

}