public class ContactAndLeadSearch {

    public static List<List<sObject>> searchContactsAndLeads(String InputStr){
        
        List<List<sObject>> SearchResult = [FIND :InputStr IN ALL FIELDS RETURNING Contact(firstName,LastName),Lead(FirstName,LastName)];
        
        System.debug(SearchResult);
        return SearchResult;
        
    }
}