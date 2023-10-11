public class RoomPutAndDeleteCallOut {
    
    public static void updateRoom(){
        
    String roomToUpdate = '{ "id": 77038, "roomNumber": 418978888, "roomType": "TWIN", "status": true, "price": 99.99,"description": "Brave Heart"}';
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://medunna.com/api/rooms');
        request.setMethod('PUT');
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtdGtheWE2MSIsImF1dGgiOiJST0xFX0FETUlOIiwiZXhwIjoxNjk2NjAyNDIzfQ.zxZf9QTjrHk2fhRaQakXXT5jcKIS2hJunx2eriALK2nLAz0-UUUHGieYbS_H64aqe8e2f0jehIMeboope-nj-w');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(roomToUpdate);
        
        HttpResponse response = http.send(request);
       
        System.debug('Status code :' + response.getStatusCode());
        System.debug('Status: ' + response.getStatus());
        
        System.assert(response.getStatusCode() == 200, 'Status code does not match!');
    }

    
    
    
    
    //DELETE THE ROOM YOU CREATED
    public static void deleteRoomRequest(Integer roomId){ //get Id by method parameter
     
       	Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://medunna.com/api/rooms/'+roomId); //Id will be concatenated when we enter in method parenthesis.
        request.setMethod('DELETE');
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtdGtheWE2MSIsImF1dGgiOiJST0xFX0FETUlOIiwiZXhwIjoxNjk2NjAyNDIzfQ.zxZf9QTjrHk2fhRaQakXXT5jcKIS2hJunx2eriALK2nLAz0-UUUHGieYbS_H64aqe8e2f0jehIMeboope-nj-w');
        
       HttpResponse response = http.send(request);
        
         System.debug('Status code :' + response.getStatusCode());
        System.debug('Status: ' + response.getStatus());
        
        System.assert(response.getStatusCode() == 204, 'Status code does not match!');
    }
    
    
}