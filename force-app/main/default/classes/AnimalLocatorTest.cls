@isTest 
private class AnimalLocatorTest{
    @isTest static void AnimalLocatorMock1(){
        try{
            Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
            String result = AnimalLocator.getAnimalNameById(1);
            String expectedResult = 'fox';
            System.assertEquals(result, expectedResult);
           
        }
        catch(exception e){
          System.debug('The Following exception has occure:' + e.getMessage());  
        }
    }
}