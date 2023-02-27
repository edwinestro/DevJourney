public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
public static List<Contact> getContacts() {
    throw new AuraHandledException('Forced error');
}


    @AuraEnabled(cacheable=true)
    public static List<Contact> findContacts(String searchKey) {
        String key = '%' + searchKey + '%';
        return [
            SELECT Id, Name, Title, Phone, Email
            FROM Contact
            WHERE Name LIKE :key 
            WITH SECURITY_ENFORCED
            LIMIT 10
        ];
    }

    @AuraEnabled(cacheable=true)
    public static Contact getSingleContact() {
        return [
            SELECT Id, Name, Title, Phone, Email
            FROM Contact
            WITH SECURITY_ENFORCED
            LIMIT 1
        ];
    }

    @AuraEnabled
    public static void updateContacts(List<Contact> contactsForUpdate) {
        try {
            update contactsForUpdate;
        } catch (DMLException e) {
            throw new AuraHandledException('Error updating contacts: ' + e.getMessage());
        }
    }

    @AuraEnabled
    public static void updateContact(
        Id recordId,
        String firstName,
        String lastName
    ) {
        Contact contact = new Contact(
            Id = recordId,
            FirstName = firstName,
            LastName = lastName
        );
        update contact;
    }
}
