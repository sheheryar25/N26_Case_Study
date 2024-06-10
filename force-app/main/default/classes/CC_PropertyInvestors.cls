public class CC_PropertyInvestors {
    public static Integer GetInvestors(){
        return [SELECT COUNT() FROM ACCOUNT];
    }

}