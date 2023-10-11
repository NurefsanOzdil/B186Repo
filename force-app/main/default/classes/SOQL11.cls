public class SOQL11 {
    
    //Example: Create 6 account records with different names by using loop
                //call the newly created records and update rating fields as 'Hot'
                    //And create 5 other records with Rating "Warm" by using loop
        
        //1) in another method, in the parameter; if you enter "Category1" into parameter;
        //   display records with Rating "Hot"
        
        //2) if you enter "Category2" into the parameter, display records with Rating "Warm"
        //3) If you enter "Category3" into the parameter, display records whose name contains "acc"
        //4) If you enter "Category4" into the parameter, display records whose name not contain "acc"
    
    
    //Create 6 records with different names by using loop
    public static void createSixRecs(String accName){
        
        List<Account> sixAccounts = new List<Account>();
        for(Integer i=201; i<207; i++){
            
            Account acc = new Account();
            acc.Name= i + '. ' + accName;
            acc.Description = i + '. ' + accName + ' is created in Account object';
            sixAccounts.add(acc);//add the account objects into the list above...
        }
        
        insert sixAccounts;
        System.debug(sixAccounts);
        
    }
    
    
    //call the newly created records and update rating fields as 'Hot'
    public static void updateCreatedSixRecs(String accNameToUpdate){
        
            List<Account> accListToUpdate= [SELECT Name, Rating FROM Account WHERE Name LIKE:accNameToUpdate];        
        
        for(Account w : accListToUpdate){
            
            w.Rating= 'Hot';
        }
        update accListToUpdate;
        System.debug(accListToUpdate);
    }
    
    
    
    //And create 5 other records with Rating "Warm" by using loop
    public static void createFiveOtherRecs(){
        List<Account> accList = new List<Account>();
        
        for(Integer i=207; i<212; i++){
            
            Account acc = new Account();
            acc.Name= i + '. Account Additional';
            acc.Rating='Warm';
            accList.add(acc);
        }
        
        database.insert(accList);
        
        System.debug(accList);
        
        
    }
    
    
    
         //1) in another method, in the parameter; if you enter "Category1" into parameter;
        //   display records with Rating "Hot"
        
        //2) if you enter "Category2" into the parameter, display records with Rating "Warm"
        //3) If you enter "Category3" into the parameter, display records whose name contains "Acc"
        //4) If you enter "Category4" into the parameter, display records whose name not contain "Acc"
    
    public static void displayRecordsByCategory(String categoryName){
        
     List<Account> myQuery = new List<Account>();
         
     String accSearchTerm = '%Acc%';   
        
        if(categoryName.equals('Category1')){
            
             myQuery = [SELECT Name, Rating, Industry, CreatedDate FROM Account WHERE Rating='Hot' AND CreatedDate >= YESTERDAY];
            
            
        }else if(categoryName.equals('Category2')){
            
            myQuery = [SELECT Name, Rating, Industry, CreatedDate FROM Account WHERE Rating='Warm' AND CreatedDate >= YESTERDAY];
           
            
        }else if(categoryName.equals('Category3')){
            
          myQuery = [SELECT Name, Rating, Industry, CreatedDate FROM Account WHERE Name LIKE:accSearchTerm AND CreatedDate >= YESTERDAY];
            
        }else if(categoryName.equals('Category4')){
            
            myQuery = [SELECT Name, Rating, Industry, CreatedDate FROM Account WHERE (NOT Name LIKE:accSearchTerm) AND CreatedDate >= YESTERDAY];
        }else{
            
            System.debug('Please enter a valid category!');
        }
        
        //display category name on the console as well:
        System.debug('Category Name is: ' + categoryName);
        
        //when one of the conditions is satisfied, records coming from database will be printed below...
        for(Account acc : myQuery){
             System.debug(acc);
             System.debug('Account Name: ' + acc.Name + ' - '+ ' Account Industry: '+ acc.Industry + ' - ' + ' Account Rating: ' + acc.Rating);
        }


        
        
    }
    
    
}