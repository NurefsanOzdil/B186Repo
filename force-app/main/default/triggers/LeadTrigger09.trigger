trigger LeadTrigger09 on Lead (after unDelete) {
    
    if(Trigger.isAfter&&Trigger.isUndelete){
        
        for(Lead w:Trigger.new){
            System.debug('The reord is restored. Lead Name:' +w.FirstName + ' ' + w.LastName);
        }
    }
      

}