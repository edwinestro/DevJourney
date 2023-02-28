public class AccountUtils {
    
    public AccountUtils(){
        
    }
    public static List<Account>  accountsByState(String bs){
        
        List<Account> accts = [SELECT ID, Name from Account where BillingState =:bs];
            return accts;
        
    }

}