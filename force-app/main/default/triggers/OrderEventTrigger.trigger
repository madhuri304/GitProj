trigger OrderEventTrigger on Order_Event__e (after insert) {
    List<Task> ts = new List<Task>();
    for(Order_Event__e event : Trigger.New)
    {
      if(event.Has_Shipped__c == true)   
      {
          Task t = new Task();
          t.Priority = 'Medium';
          t.Subject = 'Follow up on shipped order 105';
          t.OwnerId = event.CreatedById;
         ts.add(t);
      }
    }
    insert ts;
}