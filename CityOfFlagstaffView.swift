//
//  HandsOnGreaterPhoenixView.swift
//  VolunteerSearch
//
//  Created by Aravind Subramanian on 5/18/26.
//

import SwiftUI

struct Opportunity4: Identifiable, Equatable{
    let id: UUID
    var description: String
    var opportunityName: String
    init(opportunityName: String, description: String){
        self.id = UUID()
        self.opportunityName = opportunityName
        self.description = description
    }
}



struct CityOfFlagstaffView : View{
    
    static func contains(name: String) -> Bool {
            return opportunities.contains { $0.opportunityName == name }
    }
    
    static let opportunities = [
        
        Opportunity4(opportunityName:"Full Moon Bike Ride/Hike!", description: "Enjoy outdoor activites? Then this opportunitiy is for you! Enjoy a night out walking on a trail or out and back, and watch the full moon rise. You can meet new people, bike, and hike during this event. You will go on the Karen Cooper FUTS trail, which lasts about 6 miles.\n\n\nAge: 0+\nAny age can participate.\n\nLocation: Frances Short Pond\n\nDate: July 29, 2026\n\nTime: 7:30 PM - 9:30 PM"),
        
        Opportunity4(opportunityName: "Garden Maintenance Volunteer Day - Bonito", description: "Enjoy nature and plants? Then this opportunitiy is for you.\n\n**Note: The Garden Maintenance Volunteer Opportunitiy is available in multiple locations across Flagstaff. Scroll down for more locations.**\n\nGarden Volunteer days are a great way to become directly involved in a community garden, interact with other gardeners, and ensure the gardens continue to thrive in the future. As a volunteer, here are the things you might do:\n\n•Turning compost\n•Weeding\n•Caring for communal plots\n•Hands-on learning expereinces and creative, garden inspired projects.\n\nThis opportunitiy is wonderful if you are looking to build gardening skills, meet new people, or simply spend time giving back to the community.\n\n\nAge: 0+\nAny age can participate.\n\nLocation: Bonito Community Garden Pond\n\nDate: August 04, 2026  \n\nTime: 7:30 PM - 9:30 PM"),
        
        Opportunity4(opportunityName: "Garden Maintenance Volunteer Day - Southside", description: "Enjoy nature and plants? Then this opportunitiy is for you.\n\n**Note: The Garden Maintenance Volunteer Opportunitiy is available in multiple locations across Flagstaff. Scroll down for more locations.**\n\nGarden Volunteer days are a great way to become directly involved in a community garden, interact with other gardeners, and ensure the gardens continue to thrive in the future. As a volunteer, here are the things you might do: \n\n•Turning compost\n•Weeding\n•Caring for communal plots\n•Hands-on learning expereinces and creative, garden inspired projects.\n\nThis opportunitiy is wonderful if you are looking to build gardening skills, meet new people, or simply spend time giving back to the community.\n\n\nAge: 0+\nAny age can participate.\n\nLocation: Southside Community Garden\n\nDate: August 04, 2026  \n\nTime: 4:00 PM - 6:00 PM"),
        
        Opportunity4(opportunityName: "Garden Maintenance Volunteer Day - Hal Jensen", description: "Enjoy nature and plants? Then this opportunitiy is for you.\n\n**Note: The Garden Maintenance Volunteer Opportunitiy is available in multiple locations across Flagstaff. Scroll down for more locations.**\n\nGarden Volunteer days are a great way to become directly involved in a community garden, interact with other gardeners, and ensure the gardens continue to thrive in the future. As a volunteer, here are the things you might do: \n\n•Turning compost\n•Weeding\n•Caring for communal plots\n•Hands-on learning expereinces and creative, garden inspired projects.\n\nThis opportunitiy is wonderful if you are looking to build gardening skills, meet new people, or simply spend time giving back to the community.\n\n\nAge: 0+\nAny age can participate.\n\nLocation: Southside Community Garden\n\nDate: August 21, 2026\n\nTime: 4:00 PM - 6:00 PM"),
        
        Opportunity4(opportunityName: "Invasive Weed Identification, Removal & Reseeding", description: "Volunteers are requested to help manage invasive weeds at Picture Canyon. In addition to helping the enviornment, you will also learn valuable information on gardening skills, such as how to remove weeds, and plant flowers. This event is on every other Wednesday.\n\nAge: 0+\nAny Age can participate.\n\nLocation: Picture Canyon Natural & Cultural Preserve\n\nDates: Every other Wednesday morning.\n\nTime: 7:00 AM - 10:00 AM"),
        
        Opportunity4(opportunityName: "Mushroom Walk!", description: "Join mushroom enthusiasts for the Arizona Watchable Wildlife Experience's afternoon mushroom walk! During this event, you will assist with finding fungi and mushrooms. The event is free, but participation is limited to 20.\n\nAge: 0+\nAny age can participate. \n\nLocation: Location details will be revealed after registration.\n\nDate: August 22, 2026\n\nTimes:\n•9:00 AM - 11:00 AM\n•11:30 AM - 1:30 PM"),
        
        Opportunity4(opportunityName:"Full Moon Hike -- Mars Hill Trail", description: "Enjoy outdoor activites? Then this opportunitiy is for you! Enjoy a night out walking on a trail or out and back, and watch the full moon rise. You can meet new people and hike during this event. You will go on the Mars Hill Trail, which lasts about 3 miles.\n\n\nAge: 0+\nAny age can participate.\n\nLocation: Observatory Mesa - Mars Hill Trail\n\nDate: July 29, 2026\n\nTime: 6:15 PM - 8:15 PM"),
    ]
                        
    @State private var selectedItem: Opportunity4?
    
    var body: some View {
        
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                Text("City of Flagstaff")
                    .bold()
                    .font(.largeTitle)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            
            
            
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .leading, spacing: 12){
                    Text("Opportunities Near You  \(Image(systemName:"mappin.and.ellipse"))")                        .font(.title2)
                        .foregroundStyle(Color.blue.gradient)
                        
                    
                    ScrollView{
                        VStack(alignment: .leading, spacing: 10){
                            ForEach(CityOfFlagstaffView.opportunities) { opportunity in
                                Button(action: {
                                    selectedItem = opportunity
                                }) {
                                    Text(opportunity.opportunityName)
                                        .padding(30)
                                        .font(.system(size: 14, weight: .bold, design: .default))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(selectedItem?.id == opportunity.id ? Color.blue.opacity(0.2): Color.clear)
                                        .cornerRadius(8)
                                        .lineLimit(nil)
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    Divider()
                    
                }
                
                .padding()
                .frame(maxWidth: .infinity, alignment: .topLeading)
                Divider()
                
                VStack {
                    ScrollView{
                        if let item = selectedItem {
                            Text(item.opportunityName)
                                .padding()
                                .font(.title2)
                                .bold()
                            Text(item.description)
                                .padding()
                                .multilineTextAlignment(.leading)
                                .font(.title3)
                                .font(.custom("NotoSans-Regular", size: 16))
                        }
                        
                        else{
                            Text("Select an opportunity to view more details")
                                .padding()
                                .foregroundColor(.gray)
                        }
                    }
                    
                    
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

        
            
            
#Preview {
    CityOfFlagstaffView()
}





