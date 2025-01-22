public class AccountUtility {

     public static void viewAnnualRevenue()
     {
         List<Account> accountsList = [select Name,AnnualRevenue from Account];
         for(Account Acc : accountsList)
         {
             String acctRev= Acc.Name +':'+ Acc.AnnualRevenue;
             System.debug(acctRev);
         }
     }
}