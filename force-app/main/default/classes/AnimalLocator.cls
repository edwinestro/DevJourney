public class AnimalLocator {
    
    public static String getAnimalNameById(Integer Id) {
        String returnedString;
        
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+Id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
                String jsonStr = response.getBody();

            Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(jsonStr);

			Map<String, Object> animal = (Map<String, Object>)results.get('animal');          
            
			returnedString = (String)animal.get('name');            
            
            
        }
        return  returnedString;
    }
}