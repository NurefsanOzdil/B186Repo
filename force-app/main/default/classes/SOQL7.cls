public class SOQL7 {
    //Example 13: Call name, rating, num of employees of accoutn records...
    //put a limitation to display records...
    //display records from 2nd to 5th order
    //enter limitation values by method parameters...
    public static void selectRecords(Integer lmt, Integer offs){
        
        List<Account> accList = [SELECT Name, Rating, NumberOfEmployees FROM Account LIMIT:lmt OFFSET:offs];
        
        for(Account acc : accList){
            
            System.debug('Account Name: ' + acc.Name);
            System.debug('Account Rating: ' + acc.Rating);
            System.debug('Number Of Emp: ' +acc.NumberOfEmployees);
            System.debug('---------------------------------------');
        }
        
        
    }
}