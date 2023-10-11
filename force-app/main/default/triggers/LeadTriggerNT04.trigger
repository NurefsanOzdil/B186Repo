trigger LeadTriggerNT04 on Lead (before insert, before update) {

    //Example 5: when a lead record is about to be created or updated, 
    //and if industry is empty, populate an error message...:
    //Message: Industry can not be empty!
    
    for(Lead w : Trigger.new){
        
        if(String.isBlank(w.Industry)){
            
            w.Industry.addError('Industry can not be empty!');
        }
        
    }
    
}

//NOTE: addError() method is used to populate an error message when we an operation on UI part....
//This is giving us a validation rule mechanism...