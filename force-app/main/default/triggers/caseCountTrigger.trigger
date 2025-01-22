trigger caseCountTrigger on Case (before insert) {
  System.debug('Trigge started:')
     Account a;
     List<Case> cc;
     for(Case c: Trigger.New)
     {
        cc=[Select Origin,OwnerId,AccountId from Case];
         System.debug('Case Record is:'+c);
     }
}