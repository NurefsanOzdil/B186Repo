trigger LeadTriggerNT05 on Lead (before delete) {
    
    //Example 6: if industry is education, do not allow any user to delete lead record....
    
    
    
    if(Trigger.isBefore && Trigger.isDelete){
            
        for(Lead w : Trigger.old){ //in before delete, we use Trigger.old to iterate records..
        
            if(w.Industry == 'Education'){
                w.addError('You can not delete the record when industry is education!');
            }    
        
                }

        
        
    }
    
   
   
}