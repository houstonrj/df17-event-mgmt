/**
* Copyright (c) 2017, Salesforce.org
* @author Laura Meerkatz
* @date 2017
* @description Query to pull a demo pool of sessions to use in recommendations. If this were a real implementation,
* you'd want a more generic query builder that would allow you to pass parameters in instead of hard-coding values
* like location.
*/

public with sharing class Recommendations_SessionDemoData {
    public static Location defaultLocation = Location.newInstance(37.7831029,-122.4040588);

    // returns a list of eligible sessions
    // in a production scenario this should also be abstracted out
    public static List<Session__c> getSessionsEligibleForRecommendations() {
        return [
            SELECT Id, Name, Location__c,
                Number_of_Attendees__c, Maximum_Attendees__c
            FROM Session__c
            WHERE Include_in_Recommendations__c = true
            ORDER BY CreatedDate DESC
            LIMIT 200
        ];
    }


}