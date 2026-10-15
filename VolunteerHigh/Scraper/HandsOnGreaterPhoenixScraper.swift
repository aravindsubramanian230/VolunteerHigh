//
//  HandsOnGreaterPhoenixScraper.swift
//  VolunteerSearch
//
//

import Foundation

let websiteURL = URL(string: "https://www.handsonphoenix.org/calendar")

let requestURL = URL(string: "https://www.handsonphoenix.org/search/getOpportunitiesCalendar")

let parameters = "searchResultBlockId=373&searchvo_startfrom=2026-09-27&searchvo_endfrom=2026-11-08"


func fetchWebsite() async throws {
    
    guard let websiteURL = websiteURL else {
        print("Error. Please check code.")
        return
    }

    let (data, response) = try await URLSession.shared.data(from: websiteURL)
                                                            
    let html = String(data: data, encoding: .utf8)
    
    //print(html)
    
    guard let requestURL = requestURL else{
        print("Error. Please check code.")
        return
    }
    
    var request = URLRequest(url: requestURL)
    
    request.httpMethod = "POST"
    
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    
    request.httpBody = parameters.data(using: .utf8)
    
    let (postData, postResponse) = try await URLSession.shared.data(for: request)
    
    let json = String(data: postData, encoding: .utf8)
    
    let parsed = try JSONSerialization.jsonObject(with: postData) as? [String: Any]
    
    var updatedOpportunities : [[String: Any]] = []
    
    if let opportunities = parsed?["items"] as? [[String: Any]] {
        for day in opportunities {
            
            
            if let occurrences = day["occurrences"] as? [[String: Any]] { //Need b/c it shows that occurrences contains the actual volunteer opportunities not items directly.
                for opportunity in occurrences {
                    let name = opportunity["opportunityName"] as? String ?? "Unknown"
                    let type = opportunity["opportunityType"] as? String ?? "Unknown"
                    let description = opportunity["description"] as? String ?? "Unknown"
                    let startTime = opportunity["startTime"] as? String ?? "Unknown"
                    let startDate = opportunity["startDateTimeISO"] as? String ?? "Unknown"
                    let volunteers_needed = opportunity["volunteersStillNeeded"] as? Int ?? 0
                    let zipCode = opportunity["locationZipCode"] as? String ?? "Unknown"
                    let link = opportunity["opportunityLink"] as? String ?? "Unknown"
                    
                    let updatedOpportunity: [String: Any] = [
                        "name": name,
                        "type": type,
                        "description": description,
                        "time": startTime,
                        "date": startDate,
                        "volunteers_Needed": volunteers_needed,
                        "location": zipCode,
                        "link": link
                    ]
                    
                    updatedOpportunities.append(updatedOpportunity)
                    
                    print("Name: " + name)
                    print("Type: " + type)
                    print("Description: " + description)
                    print("Time: " + startTime)
                    print("Date: " + startDate)
                    print("Volunteers Needed: \(volunteers_needed)")
                    print("Location: " + zipCode)
                    print("Link: " + link)
                

                }
            }
        }
        
        let jsonData = try JSONSerialization.data(withJSONObject: updatedOpportunities, options: [.prettyPrinted])
        let fileURL = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("HandsOnGreaterPhoenix.json")
        
        try jsonData.write(to: fileURL)
        
        print("Succcess! Saved \(updatedOpportunities.count) opprtunities.") //Helps with for debugging.
        print("FILE LOCATION: \(fileURL.path)") //To find location of JSON file.
    }
        


    
}










