public class EmailSendTriggerWithTemplateHandler {
    
    public static void emailSendWithTemplate(List<Contact> conList){
        
        List<Messaging.SingleEmailMessage> emailMessages = new  List<Messaging.SingleEmailMessage>();
        
      	EmailTemplate emailTemp = [SELECT Id, Subject, Description, HtmlValue, DeveloperName, Body FROM EmailTemplate WHERE NAME ='ContactInsertAlert'];
        
        
        
        Set<ID> ownerIds = new Set<ID>(); //store ownerIDs in set to use in query caling user details...       
        for(Contact con : conList){
          ownerIds.add(con.ownerId);  
            
        }
        
        
        //query user object to retrieve owner email address
        Map<ID, User> ownerMap = new Map<ID, User>([SELECT Id, Email, FirstName FROM User WHERE ID IN:ownerIds ]);
        
        for(Contact con : conList){
            
        User owner  = ownerMap.get(con.OwnerId);//gives me User details of ownerId from values of Map
            
            //if(owner !=null && owner.Email != null){//optional
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
                
                emailMsg.setTargetObjectId(con.Id);
                emailMsg.setSenderDisplayName('Company Administrator');
                emailMsg.setReplyTo('no-reply@company.com');
                emailMsg.setUseSignature(false);
            	emailMsg.setBccSender(false);
            	emailMsg.setSaveAsActivity(false);
            	emailMsg.setTemplateId(emailTemp.Id);
            	emailMsg.setWhatId(con.AccountId);
            	emailMsg.setToAddresses(new String[] {owner.Email});
            emailMessages.add(emailMsg);
            //}
        }
        Messaging.sendEmail(emailMessages);
    }

}