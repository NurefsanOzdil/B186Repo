public class SOQL4 {
    
    
//Example 10: Fetch Industry and average number of employees per Industry
//print the results on the console in the same line and different lines...
    public void queryAggregate(){
        
        
       AggregateResult[] result = [SELECT Industry, AVG(NumberOfEmployees)avg FROM Account GROUP BY Industry];
        System.debug(result);
       Object avgValueOfBiotech = result[2].get('avg');
        System.debug('Avg Value of Biotechnology : ' + avgValueOfBiotech );
        
        //1.way: Recommended.
        //i) General practice is typing less code inside the loop parenthesis
        //ii) If you put query inside the loop parenthesis, you cannot use the result out of the loop...
        
        //to print in different lines
    for(AggregateResult res : result){
        
        System.debug(res.get('Industry') + ' - ' + res.get('avg'));
        
    }
        
        //2. Way:
        for(AggregateResult w : [SELECT Industry, AVG(NumberOfEmployees)avg FROM Account GROUP BY Industry]){
            
             System.debug(w.get('Industry') + ' - ' + w.get('avg'));
        }
        //in this second way: we have narrow scope and limiting the reusability of query result...
        
        
    }
      
}
/*
(AggregateResult:{Industry=null, expr0=999.0}, 
AggregateResult:{Industry=Apparel, expr0=9000.0}, 
AggregateResult:{Industry=Biotechnology, expr0=265.0}, 
AggregateResult:{Industry=Construction, expr0=2680.0}, 
AggregateResult:{Industry=Consulting, expr0=120.0}, 
AggregateResult:{Industry=Education, expr0=39000.0}, 
AggregateResult:{Industry=Electronics, expr0=1000.0}, 
AggregateResult:{Industry=Energy, expr0=57333.333333333336}, 
AggregateResult:{Industry=Hospitality, expr0=5600.0})
*/
/*
(AggregateResult:{Industry=null, avg=999.0}, 
AggregateResult:{Industry=Apparel, avg=9000.0}, 
AggregateResult:{Industry=Biotechnology, avg=265.0}, 
AggregateResult:{Industry=Construction, avg=2680.0}, 
AggregateResult:{Industry=Consulting, avg=120.0}, 
AggregateResult:{Industry=Education, avg=39000.0}, 
AggregateResult:{Industry=Electronics, avg=1000.0},
AggregateResult:{Industry=Energy, avg=57333.333333333336}, 
AggregateResult:{Industry=Hospitality, avg=5600.0})
*/