public class SOQLNT3 {
     //Example 9: Type query to see minimum and maximum number of employees,
		// and average number of employees for account object
	
    
    public static void queryAgg(){
        
      AggregateResult[] result  = [SELECT MIN(NumberOfEmployees), MAX(NumberOfEmployees), AVG(NumberOfEmployees) FROM Account];
        System.debug(result); //(AggregateResult:{expr0=120, expr1=145000, expr2=20247.0})
        
        
        //get minimum value
       Object minValue = result[0].get('expr0');
        System.debug('Minimum Value: ' + minValue);
        
        //get the max value
        Object maxValue = result[0].get('expr1');
        System.debug('Maximum Value: ' + maxValue);
        
        //get the avg value
		Object avgValue = result[0].get('expr2');
        System.debug('Average Value: '+ avgValue);
        
    }
    	
}

//Note that any query that includes an aggregate function returns its results in an array of AggregateResult objects. 
//AggregateResult is a read-only sObject and is only used for query results.