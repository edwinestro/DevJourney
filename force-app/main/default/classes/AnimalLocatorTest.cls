@isTest
public class AnimalLocatorTest {

    public AnimalLocatorTest(){
    }
    @isTest

    public static void testGetAnimalNameById(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        
                Test.startTest();
        String response = AnimalLocator.getAnimalNameById(1);
        Test.stopTest();
        
        System.assertEquals('chicken', response);
        
    }
}