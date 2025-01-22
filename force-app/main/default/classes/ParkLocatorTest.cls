@isTest
private class ParkLocatorTest {
    @isTest static void testCallout(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String country = 'United states';
        List<String> expectedParks = new List<String>{'Yosemite','GrandCanyon South','GrandCanyon North'};
        System.assertEquals(expectedParks, ParkLocator.country(country));
    }
    
}