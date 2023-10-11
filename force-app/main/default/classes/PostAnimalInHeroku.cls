public class PostAnimalInHeroku {
    //to create animal in heroku send POST request
    public static void postAnimals(){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
       	request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;');
        request.setBody('{"name" : "king in the north"}');
        
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 201){
            
            System.debug(response.getBody());
            
        }else{
            
            System.debug('There is an unexpected issue: ' + response.getStatus() + ' - ' + response.getStatusCode());
        }
    }

}