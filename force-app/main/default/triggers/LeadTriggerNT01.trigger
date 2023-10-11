trigger LeadTriggerNT01 on Lead (before insert) {
    
    //Example 2: When a user is creating a lead record, check the leadsource
    //if it is blank; assign value of 'Other' to lead source...
    
    for(Lead leadRec : Trigger.new){
        
        if(String.isBlank(leadRec.LeadSource)){ //conditionally we will do change in field value before insert operation...
            
            leadRec.LeadSource = 'Other';
            
        }
        
        
    }

}