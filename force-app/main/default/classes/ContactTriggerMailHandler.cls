public class ContactTriggerMailHandler {
    
    public static void sendEmailNotification(List<Contact> conList){
        
        List<Messaging.Email> emailList = new List<Messaging.Email>(); //multiple email can be sent
        
        for(Contact con : conList){
            
            if(con.Email != null){
                 		
                //lets create an email structure
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage(); //click on compose
                
                String[] toAddress = new String[]{con.Email};
                    emailMsg.setToAddresses(toAddress); //put target address in email object
                
                String emailSubj = 'Welcome dear ' + con.FirstName;
                    emailMsg.setSubject(emailSubj);
                
                String displayName = 'Mathias Talha';
                   emailMsg.setSenderDisplayName(displayName);
                
                String bodyContent = 'Hi, ' + con.FirstName + ',<br/>' +
                    'Welcome to the Salesforce Ecosystem! <br/>'+
                    'Study hard in your Salesforce journey! <br/>'+
                    'Happy learning my friends in B186 :100: :sunglasses: <br/>' + 
                    'Thank you! <br/><br/>';
                    
                   emailMsg.setHtmlBody(bodyContent);
                emailList.add(emailMsg);
                
            }
            
        }
        Messaging.sendEmail(emailList);
        
    }

}

//-------------