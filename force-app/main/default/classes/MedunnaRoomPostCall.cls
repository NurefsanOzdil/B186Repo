public class MedunnaRoomPostCall {
    
    public static void postRoom(){
        //use Room wrapper class and fill out the data
        Room room = new Room();//create instance from wrapper class and fill the data
        room.description = 'MTK The Second Creates a room for Session';
        room.price = 399;
        room.roomNumber= 455587333;
        room.roomType = 'DELUXE';
        room.status = true;
        
       String apexToJson = JSON.serialize(room); //apex to json: serialize
            
            
            
            //create a POST request structure in APEX
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://medunna.com/api/rooms');
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtdGtheWE2MSIsImF1dGgiOiJST0xFX0FETUlOIiwiZXhwIjoxNjk2NjAyNDIzfQ.zxZf9QTjrHk2fhRaQakXXT5jcKIS2hJunx2eriALK2nLAz0-UUUHGieYbS_H64aqe8e2f0jehIMeboope-nj-w');
        request.setHeader('Content-Type', 'application/json'); //body type 
        request.setBody(apexToJson); //body is defined by using wrapper class
        
       HttpResponse response = http.send(request);
       
        System.debug('Status code :' + response.getStatusCode());
        System.debug('Status: ' + response.getStatus());
        
        System.assert(response.getStatusCode() ==201, 'Status code does not match!');
        //assertion is used to make sure result is successful, otherwise gives a message
        
    }
    
    
    
    
    //wrapper class : keeps containers for the data I want to send in POST request
    public class Room{
        
        public String description;
        public Integer price;
        public Integer roomNumber;
        public String roomType;
        public Boolean status;
        
    }
    
    
    
    //defining body directly in string container
    public static void RoomPostRequest2(){
        
        String data = '{"roomNumber": 418978888, "roomType": "DAYCARE", "status": true, "price": 899.99, "description": "Last Mohican"}';
        
         Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://medunna.com/api/rooms');
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtdGtheWE2MSIsImF1dGgiOiJST0xFX0FETUlOIiwiZXhwIjoxNjk2NjAyNDIzfQ.zxZf9QTjrHk2fhRaQakXXT5jcKIS2hJunx2eriALK2nLAz0-UUUHGieYbS_H64aqe8e2f0jehIMeboope-nj-w');
        request.setHeader('Content-Type', 'application/json'); //body type 
        request.setBody(data); //body is defined by using wrapper class
        
       HttpResponse response = http.send(request);
       
        System.debug('Status code :' + response.getStatusCode());
        System.debug('Status: ' + response.getStatus());
        
        System.assert(response.getStatusCode() ==201, 'Status code does not match!');
        
    }

}