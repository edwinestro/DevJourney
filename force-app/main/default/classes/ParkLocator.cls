public class ParkLocator {
    //private ParkService.ParksImplPort parkService;
    
    public static String[] country(String country) {
        parkService.ParksImplPort parkSvc = new ParkService.ParksImplPort();
        return parkSvc.byCountry(country);
    }
    
}