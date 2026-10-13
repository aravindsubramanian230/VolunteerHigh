//
//  HandsOnGreaterPhoenixView.swift
//  VolunteerSearch
//
//  Created by Aravind Subramanian on 5/18/26.
//

import SwiftUI

struct Opportunity7: Identifiable, Equatable{
    let id: UUID
    var description: String
    var opportunityName: String
    init(opportunityName: String, description: String){
        self.id = UUID()
        self.opportunityName = opportunityName
        self.description = description
    }
}



struct ArizonaStateParksandTrailsView : View{
    
    static func contains(name: String) -> Bool {
            return opportunities.contains { $0.opportunityName == name }
    }
    
    
    static let opportunities = [
        
                    Opportunity7(opportunityName:"Fort Verde State Historic Park", description: "Seeking volunteers for the following positions:\n\n•Special Event Ambassador: Assist with various event duties throughout the year during many fun events.\n\n•Front Desk/Visitor Services - Greet park visitors at the park's first point of contact and collect park entry fees, assist in the Visitor Center with retail sales, and provide general park information.\n\n•Interpretive Services - Assist park staff in communicating information relating to the history of Fort Verde State Historic Park, the town of Camp Verde, and surrounding areas."),
                        
                        Opportunity7(opportunityName: "Jerome State Historic Park", description: "Seeking volunteers for the following positions:\n\n•Interpretive Services - Assist park staff in communicating information relating to Jerome State Historic Park, the Douglas family, mining, geology, and the town of Jerome.\n\n•Visitor Services - Welcome guests, assist in the Park Store with retail sales, and provide general park information."),
                        
                        Opportunity7(opportunityName: "Picacho Peak State Park", description: "Seeking volunteers for the following positions: \n\n•Trail Maintenance - General trail maintenance and litter removal\n\n•Visitor Services - Welcome guests, assist in the Visitor Center with retail sales, and provide general park information"),
                        
                        Opportunity7(opportunityName: "Rockin' River Ranch State Park", description: "Seeking volunteers for the following positions: \n\n•Trail Ambassador - Welcome and guide guests along our beautiful trail system.\n\n•Visitor Services - Greet park visitors at the park's first point of contact and collect park entry fees, assist in the Visitor Center with retail sales, and provide general park information."),
                        
                        Opportunity7(opportunityName: "Red Rock State Park", description: "Seeking volunteers for the following positions:\n\n•Entry Station Attendant - Greet park visitors at the park's first point of contact and collect park entry fees. Must be friendly, patient, and willing to answer basic visitor questions about the park and surrounding Sedona area. Volunteer shifts are typically 3.5 hours (afternoon shift) or 4 hours (morning shift) but shorter shifts on a weekly or every other week basis may be considered."),
                        
                        Opportunity7(opportunityName: "Catalina State Park", description: "Seeking volunteers for the following positions:\n\n•Visitor Services - Welcome guests, assist in the Park Store with retail sales, and provide general park information.")
              
    ]
                        
    @State private var selectedItem: Opportunity7?
    
    var body: some View {
        
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Arizona State Parks and Trails")
                    .bold()
                    .font(.largeTitle)
                    .padding(.top, 10)
                    .padding(.bottom, 0.1)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                
                Text("Note: The following opportunities require an application, which can be done through this link:\n                                 https://azstateparks.com/Open-Volunteer-Positions\n                                         Apply to learn more about dates and times.")
                    .font(.callout  )
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 0.1)
                    .padding(.bottom, 10)
                    
            }
            .frame(maxWidth: .infinity)
            
            
            
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .leading, spacing: 12){
                    Text("Opportunities Near You  \(Image(systemName:"mappin.and.ellipse"))")                        .font(.title2)
                        .foregroundStyle(Color.blue.gradient)
                        
                    
                    ScrollView{
                        VStack(alignment: .leading, spacing: 10){
                            ForEach(ArizonaStateParksandTrailsView.opportunities) { opportunity in
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
    ArizonaStateParksandTrailsView()
}





