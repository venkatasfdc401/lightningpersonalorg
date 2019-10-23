public class AnimalLocator {
    static String animalname;
    public static string getAnimalNameById(integer val) {
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+val);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug('results  '+results );
            for (string animal: results.keyset()) {
                  Map<String, Object> animalvalues = (Map<String, Object>)results.get(animal);
                  for(string strval : animalvalues.keyset()){
                      if(strval=='name'){
                          animalname = string.valueof(animalvalues.get(strval));
                      }
                  }
            }
        }
        return animalname;
    }
}