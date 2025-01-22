public class ContactUtility {

   public static void viewContacts()
   {
       List<Contact> listOfcontacts=[Select FirstName,LastName from Contact];
       for(Contact con : listOfcontacts)
       {
           String Fullname='First Name: '+ con.FirstName + ', Last Name: '+ con.LastName;
           System.debug(Fullname);
       }
   }
}