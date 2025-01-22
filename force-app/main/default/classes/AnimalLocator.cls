public class AnimalLocator {
   public static String getAnimalNameById(Integer I)
    {
         HttP http = new HttP();
        HttpRequest req =new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + I);
        req.setMethod('GET');
        Map<String, Object> animal = new Map<String, Object>();
        HTTPResponse res = HTTP.send(req);
        if(res.getStatusCode() == 200)
        {
            Map<String, Object> results = (Map<String, Object>)json.deserializeUntyped(res.getBody());
            animal = (Map<String, Object>) results.get('animal');
        }
         return (String)animal.get('name');    
    }
}