@istest
public Class AmendTest{
    @istest
    public static void Method1(){
        Amend am = new Amend();
        Amend.RatePlanChargeTier ARP = new  Amend.RatePlanChargeTier();
        ARP.Tier = 2;
        ARP.PriceFormat='USD';
        Amend.RatePlanChargeData ARPCHDATA = new Amend.RatePlanChargeData();
        
        List<Amend.RatePlanChargeTier> RatePlanChargeTierdata= new List<Amend.RatePlanChargeTier>();
        RatePlanChargeTierdata.add(ARP);
        ARPCHDATA.RatePlanChargeTier = RatePlanChargeTierdata;
        
        List<Amend.RatePlanChargeData> Amrpchdatalist = new List<Amend.RatePlanChargeData>();
        Amrpchdatalist.add(ARPCHDATA);
        Amend.RatePlanData AmRPdata = new Amend.RatePlanData();
        
        AmRPdata.RatePlanChargeData = Amrpchdatalist;
        
         
        System.debug('AmRPdata '+AmRPdata); 
        System.debug('Json data'+JSON.serialize(AmRPdata));
    }
}