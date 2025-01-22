trigger UAccountTrigger on Account (before insert) 
{

     if(Trigger.isInsert && Trigger.isBefore)
     {
        for(Account a : Trigger.new)
        {
            if(a.Rating =='Hot' && a.Type ==null)
            {
                a.addError('Type should not Null when Rating is Hot');
            }
        }
     }
}