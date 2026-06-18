//
//  HandsOnGreaterPhoenixView.swift
//  VolunteerSearch
//
//  Created by Aravind Subramanian on 5/18/26.
//

import SwiftUI

struct Opportunity2: Identifiable, Equatable{
    let id: UUID
    var description: String
    var opportunityName: String
    init(opportunityName: String, description: String){
        self.id = UUID()
        self.opportunityName = opportunityName
        self.description = description
    }
}



struct FeedMyStarvingChildrenView : View{
    
    let opportunities = [
        
                        Opportunity2(opportunityName:"FMSC MobilePack", description: "Seeking volunteers to measure and pack dry meals, such as rice, soy, dried vegetables, and vitamins. This opportunitiy takes just two hours of your time!\n\nLocation: Multiple locations, register to find all locations.\n\nTimes: Multiple times, register to view all times.\n\nAge: 5+"),
              
    ]
                        
    @State private var selectedItem: Opportunity2?
    
    var body: some View {
        
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Feed My Starving Children")
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
                            ForEach(opportunities) { opportunity in
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
    FeedMyStarvingChildrenView()
}





