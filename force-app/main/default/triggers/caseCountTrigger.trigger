trigger caseCountTrigger on Case (before insert) {

     Account a;
     List<Case> cc;
     for(Case c: Trigger.New)
     {
        cc=[Select Origin,OwnerId,AccountId from Case];
         System.debug('Case Record is:'+c);
     }
}