public class ParkLocator{
    public static List<string> country(string cntry) {
        ParkService.ParksImplPort  Parks= 
            new ParkService.ParksImplPort();
        return Parks.byCountry(cntry);
    }
}