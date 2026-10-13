//
//  HandsOnGreaterPhoenixView.swift
//  VolunteerSearch
//
//  Created by Aravind Subramanian on 5/18/26.
//

import SwiftUI
import PDFKit
import AppKit


struct Opportunity3: Identifiable, Equatable{
    let id: UUID
    var description: String
    var opportunityName: String
    init(opportunityName: String, description: String){
        self.id = UUID()
        self.opportunityName = opportunityName
        self.description = description
    }
}



struct JuniorAchievementOfArizonaView : View{
    
    static func contains(name: String) -> Bool {
            return opportunities.contains { $0.opportunityName == name }
    }
    
    static let opportunities = [
        
        Opportunity3(opportunityName:"Administrative Tasks-Tempe Office", description: "Help Junior Achievement with various tasks while helping students. This opportunitiy requires a positive attitude and good attention. \n\nDates: Thursdays, but contact taylors@jaaz.org in order to reschedule if needed.\n\nTime: 2:00 PM - 4:00 PM, but contact taylors@jaaz.org to reschedule if needed. \n\nAges: Any age can generally volunteer, but contact taylors@jaaz.org to confirm. \n\n\nLocation:\nJunior Achievement Tempe Office\n636 W. Southern Ave., Tempe, AZ 85282"),
        
        Opportunity3(opportunityName: "JA High School Heroes", description: "JA High School Heroes provides exciting leadership opportunities to high school students. You will help students in elementary schools as well. \n\nAfter participation in this program, you will not only gain leadership, but will also:\n •Identify qualities of a leader and recognize the role of civic leadership in a community.\n•Use strong presentation skills to communicate effectively.\n•Recognize and use techniques that further teamwork and achieve group goals.\n•Use a problem-solving technique to solve personal and professional problems.\n• Apply critical-thinking skills to work-based problems.\n•Recognize that decisions have consequences.\n•Recognize the value of constructive feedback and the growth mind-set.\n•Develop a personal action plan. \n\nDate: Contact taylors@jaaz.org for more information on upcoming dates. \n\nTime: Contact taylors@jaaz.org for more information on upcoming times.\n\nLocation: Contact taylors@jaaz.org for more information on upcoming location.")
        
    ]
    
    @State private var selectedItem: Opportunity3?
    
    var body: some View {
        
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Junior Achievement of Arizona")
                    .bold()
                    .font(.largeTitle)
                    .padding(.top, 16)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("                                               Fill out the Youth Consent here:\n https://drive.google.com/file/d/1bXq56e-_GomNSrz1bKU4tejfmIB1fouD/view?usp=sharing")
                    .font(.callout)
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
                            ForEach(JuniorAchievementOfArizonaView.opportunities) { opportunity in
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
        JuniorAchievementOfArizonaView()
    }
    
    
    


