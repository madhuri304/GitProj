trigger CloudNewsTrigger on Cloud_News__e (after insert) {
    List<Case> cases = new List<Case>();
    Group queue = [Select Id from Group where Name = 'Regional Dispatch' AND Type='Queue'];
System.debug('Queue Debug'+queue);
    for(Cloud_News__e event : Trigger.New)
    {
        if(event.Urgent__C == true)
        {
            Case cs = new Case();
            cs.Priority = 'High';
            cs.Subject = 'News team Dispatch to' + event.Location__C;
            cs.OwnerId = queue.Id;
            cases.add(cs);            
        }
    }
    insert cases;
 }