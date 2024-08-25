@isTest
private class TestUpdateAdmittedCheckbox {
    // Test method to cover trigger logic
    static testMethod void testUpdateAdmittedCheckbox() {
        // Create a test Applicant record with required fields
        Applicant__c testApplicant = new Applicant__c(
            Name = 'Test Applicant',
            Email__c = 'test@example.com', // Provide a valid email address
            Degree__c = 'Bachelors', // Example degree
            Branch__c = 'Data Science' // Example branch
        );
        
        // Insert the Applicant record and get the ID
        insert testApplicant;
        Id applicantId = testApplicant.Id;
        
        // Create a test Task related to the Applicant
        Task testTask = new Task(
            Subject = 'Test Task',
            WhatId = applicantId, // Use WhatId to relate to Applicant record
            Status = 'Not Started'
        );
        
        // Insert the Task
        insert testTask;
        
        // Change the Task status to 'Completed'
        testTask.Status = 'Completed';
        update testTask;
        
        // Retrieve the updated Applicant record
        testApplicant = [SELECT Id, Admitted__c FROM Applicant__c WHERE Id = :applicantId];
        
        // Verify that the Admitted checkbox is set to true
        System.assertEquals(true, testApplicant.Admitted__c, 'Admitted checkbox should be true');
    }
}