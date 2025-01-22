public class PropertyUtility {

    public static void newListedProperties()
    {
        List<Property__c> newPropList = [Select Name,Broker__r.Email__c ,Days_On_Market__c from Property__c where Date_Listed__c =LAST_N_DAYS:30 ];
        System.debug(newPropList);
        for(Property__C Prop : newPropList)
        {
            String propEmail= Prop.Name +':'+ Prop.Broker__r.Email__c;
            System.debug(propEmail);
        }
    }
}