public class Amend {

    public class RatePlanChargeTier {
        
        public integer Tier;
        public double Price;
        public double StartingUnit;
        public double EndingUnit;
        public String PriceFormat;
        public boolean isOveragePrice;
        
    }
    public class RatePlanChargeData {
        
        public List<RatePlanChargeTier> RatePlanChargeTier = new List<RatePlanChargeTier>();
    }
    
    public class RatePlanData {
        public List<RatePlanChargeData> RatePlanChargeData = new List<RatePlanChargeData>(); 
    }
}