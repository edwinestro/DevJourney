public class ParkServiceMock1  implements HttpCalloutMock {
    
    public HTTPResponse respond(HTTPRequest request) {
        // Create a mock HTTP response
        HTTPResponse res = new HTTPResponse();
        res.setStatusCode(200);
        res.setBody('{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}');
        return res;
    }

}