//
//  HandsOnGreaterPhoenixView.swift
//  VolunteerSearch
//
//  Created by Aravind Subramanian on 5/18/26.
//

import SwiftUI

struct Opportunity6: Identifiable, Equatable{
    let id: UUID
    var description: String
    var opportunityName: String
    init(opportunityName: String, description: String){
        self.id = UUID()
        self.opportunityName = opportunityName
        self.description = description
    }
}



struct AZSustainabilityAllianceView : View{
    
    let opportunities = [
        
                        Opportunity6(opportunityName:"", description: ""),
              
    ]
                        
    @State private var selectedItem: Opportunity6?
    
    var body: some View {
        
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Arizona Sustainability Alliance")
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
    AZSustainabilityAllianceView()
}





