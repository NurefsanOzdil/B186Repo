trigger LeadTriggerNT on Lead (before insert) {
    //Example 1: When user creates a lead record; 
    //before creating the record; lead rating should be assigned 'Cold'

    //the records you want to insert will be in Trigger.new list format
    //to do something with thoe records, we use loops everytime...
    
    for(Lead w : Trigger.new){
        
        w.Rating = 'Cold';
    }
    
    System.debug('hello trigger, here we are!');
}