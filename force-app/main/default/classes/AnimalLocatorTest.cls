@isTest
private class AnimalLocatorTest {
    @isTest static  void getAnimalNameById() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        // Call method to test
        String animalname = AnimalLocator.getAnimalNameById(1);
        
    }
}