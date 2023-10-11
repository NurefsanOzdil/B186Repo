public class SOQL3 {
//Example 9: Type query to see minimum and maximum number of employees, 
//and average number of employees for account object

    public static void queryAgg(){
        
        /*List<AggregateResult> rslt = [SELECT MIN(NumberOfEmployees), MAX(NumberOfEmployees), AVG(NumberOfEmployees) FROM Account];
        System.debug('LIST: ' + rslt); arrayis faster and use array*/
        
        
        //1. way:
        //AggregateResult is a data type and it is a salesforce object...
     AggregateResult[] result  = [SELECT MIN(NumberOfEmployees), MAX(NumberOfEmployees), AVG(NumberOfEmployees) FROM Account];
        //System.debug(result);
        //(AggregateResult:{expr0=120, expr1=145000, expr2=20247.0} )
        
        //get the minimum value
       Object minValue = result[0].get('expr0'); //120
        System.debug('Minimum Value : ' + minValue); //Minimum Value : 120
       
        //get the maximum value 
      Object maxValue = result[0].get('expr1'); //145000
        //System.debug('Maximum Value : ' + maxValue);
        
        //get the average value
      Object avgValue = result[0].get('expr2');
        //System.debug('Average Value : ' + avgValue);
        
        
        //Note: When we print the result: in object format; fields are displayed as expr0, expr1, expr2 etc. 
        //But we can give "alias" (nickname) for the aggregate functions results...
        //You can use most common "alias" names ...> min, max, avg, sum (alias must be unique in query....)
     
        AggregateResult[] result1  = [SELECT MIN(NumberOfEmployees)min, MAX(NumberOfEmployees)max, AVG(NumberOfEmployees)avg FROM Account];
        
        //System.debug(result1); //(AggregateResult:{min=120, max=145000, avg=20247.0})
        
        //get the minimum value from array
        Object minValue1 = result1[0].get('min');
       // System.debug('Min Value1 : ' + minValue1);
        
        //get the maximum value from array
        Object maxValue1 = result1[0].get('max');
       // System.debug('Max Value1 : ' + maxValue1);
        
        //get the average value from array
        Object avgValue1 = result1[0].get('avg');
        //System.debug('Avg Value1 : ' + avgValue1);
        
    }

    
}

/*
  NOTE: 
Any query that includes an aggregate function returns its results in an array of AggregateResult objects.
AggregateResult is a read-only sObject and is only used for query results.
*/