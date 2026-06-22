//
//  HandsOnGreaterPhoenixView.swift
//  VolunteerSearch
//
//  Created by Aravind Subramanian on 5/18/26.
//

import SwiftUI

struct Opportunity: Identifiable, Equatable{
    let id: UUID
    var description: String
    var opportunityName: String
    init(opportunityName: String, description: String){
        self.id = UUID()
        self.opportunityName = opportunityName
        self.description = description
    }
}



    
struct HandsOnGreaterPhoenixView: View {
    
    
    static func contains(name: String) -> Bool {
            return opportunities.contains { $0.opportunityName == name }
        }
    
     static let opportunities = [
        
                        Opportunity(opportunityName:"TopGolf Competition - Gilbert", description: "Volunteers are needed for event support.\nIn addition, cheer and support the athletes at the Gilbert TopGolf Competition! \n\n\n" + "Time: 8:45 AM- 1:00 PM\n\n" + "Date: Saturday, August 1, 2026" + "\n\nLocation: 1689 S Santan Village Pkwy, Gilbert, AZ 85295" + "\n\nAge: 8+" + "\n\nInterests: Sports & Recreation"),
                         
                         Opportunity(opportunityName:"Maggie's Place Spruce Up", description: "Maggie's Place provides safe housing and community for homeless pregnant women. \nWork alongside the moms residing at The Michael House in Glendale to help clean and maintain their home." + "\n\n\n" + "Time: 10:00 AM - 12:00 PM" + "\n\nDate: Saturday, August 1, 2026" + "\n\nLocation: Details about location will be provided after registration\n\n" + "Age: 12+ \nThe minimum age for this volunteer opportunity is 12 with a parent or guardian. Any volunteer UNDER the age of 16 MUST be accompanied by a parent/gaurdian. Volunteers 16 and 17 MUST bring a Youth Waiver signed by a parent or guardian, to each project." + "\n\nInterests: Family Services"),
                        
                        Opportunity(opportunityName: "Grief Peer Support Group Facilitators for Kids & Caregivers", description: "Seeking volunteers who enjoy helping grieving kids and families and can facilitate a peer support group. \nNote: Training and orientations are required (Provided).\nThis opportunity is great for students who want to explore the mental health field or individuals who have lost a loved one and want to support others.\n\n\n" + "Time: 5:30 PM - 8:15 PM" + "\n\nDate: Tuesday, August 4, 2026\n\n" + "Location: 21505 N 78th Ave #120, Peoria, AZ 85382" + "\n\nAge: 14+ \nThe minimum age to volunteer is 14, however, an adult is required. Any volunteers 18+ don't need a parent /guardian." + "\n\nInterests: Mental Health, colleges"),
                        
                        Opportunity(opportunityName: "Heart of Isaac Community Center - Food Distribution", description: "Seeking for volunteers to support families in communities. Help to create a safe and welcoming place where families can quickly access food." + "\n\n\n" + "Time: 8:00 AM - 11:00 AM" + "\n\nDate: Thursday, August 6, 2026" + "\n\nLocation: Heart of Isaac, 1403 N 32nd Avenue, Phoenix, AZ, 85009" + "\n\nAge: 18+" + "\n\nInterests: Help the homeless, passionate about helping others"),
                        
                        
                        Opportunity(opportunityName: "From the Ground Up: Volunteeer Day at the Ranch", description: "Interested in helping animals? Then this opportunitiy is for you! Seeking for volunteers who enjoy the outdoors and want to make an impact on the ranch and the horses who call it home. Volunteers will work together on multiple hands-on projects, such as: Fence repairs, stall cleaning and refreshing, barn organization, and general facility beautification. Voluunteers wil help to create a safer and more welcoming environment for horses and animals. In addition, no experience is needed! Connect with nature and be part of something meaningful." + "\n\n\n" + "Time: 7:00 AM - 9:30 AM" + "\n\nDate: Saturday, August 8, 2026" + "\nAugust 22, 2026" + "\n\nLocation: Wildcat Ranch Phoenix, AZ, 85042" + "\n\nAge: 12+\nThe minimum age to volunteer for this opportunity is 12, however, an adult is required. Any volunteers 18+ don't need a parent/guardian" + "\n\nInterests: Animals, outdoors"),
                        
                        
                        Opportunity(opportunityName: "August 2026 Monthly Park Cleanup and Stinknet Removal - Kiwanis Park", description: "Join Keep Tempe Beautiful to clean up Kiwanis Park and remove invasive stinknet. Volunteers will help to remove trash, litter, and stinknet. In addition, volunteers can also do shifts anywhere from 1 hour - 2 hours. Volunteers can also expect to help with event setup, teardwon, event raffles, parking lot attendence, taking photos, and more." + "\n\n\n" + "Time: 7:00 AM - 9:00 AM" + "\n\nDate: Saturday, August 15, 2026" + "\n\nLocation: Kiwanis Park (6111 S All America Way, Tempe, AZ 85283); More location details will be provided upon registration." + "\n\nAge: There is NO MINIMUM AGE TO VOLUNTEER!!!"),
                        
                        Opportunity(opportunityName: "Chef's Night Off at HomeBase", description: "Enjoy cooking? Then this opportunitiy is for you. Seeking for volutneers who want to help prepare and serve dinner for homeless youth and young adults. In addition, volunteers will also help pack lunches that willl be distributed to homeless youth and young adults. Volunteers must wear closed-toed shoes to every project, and long hair should be pulled back." + "\n\n\n" + "Time: 4:00 PM - 6:00 PM" + "\n\nDate: Monday, August 10, 2026" + "\n\nLocation: HomeBase Youth Services, Phoenix, AZ, 85014" + "\n\n11+ \nThe minimum age for this opportunitiy is 11+, however, a parent/guardian is required. Ages 16-17 can volunteer without a parent or guardian, but they MUST bring a youth waiver signed by a parent/guardian." + "\n\nInterests: Cooking, Helping the homeless"),
                                                
                        Opportunity(opportunityName: "Rise and Dine at HomeBase", description: "Seeking for volunteers who  will provide a warm, wholesome breakfast for homeless youth and young adults at HomeBase Youth Services. Sere up pancakes, bacon, eggs and toast with a smile! Volunteers must wear closed-toe shoes, and long hair must be pulled back." + "\n\n\n" + "Location: HomeBase Youth Services, Phoenix, AZ, 85014" + "\nDate: Saturday, August 15, 2026" + "Time: 8:00 AM - 10:00 AM" + "\n\nAge: 11+ \nThe minimum age for this opportunitiy is 11+, however, a parent/guardian is required. Ages 16-17 can volunteer without a parent or guardian, but they MUST bring a youth waiver." + "\n\nInterests: Cooking, Helping the homeless"),
                        
                        Opportunity(opportunityName: "Afternoon Sort and Pack at St. Mary's Food Bank-Phoenix", description: "Seeking for volunteers to sort, pack, and distribute food that will go to other nonprofits and families in crisis. Volunteers MUST wear closed toe shoes, short/long sleeved shirts, and pants/jeans." + "\n\n\n" + "Location: Full details will be proided after registration." + "\n\nDate: Saturday, August 15, 2026" + "\n\nTime: 12:00 PM - 2:00 PM" + "\n\nAge: 12+ \nThe minimum age for this opportunitiy is 12+, however,a parent/guardian is required. Ages 16-17 can volunteer without a parent or guardian, but they MUST bring a youth waiver." + "\n\nInterests: Helping the homeless"),

                        
                        Opportunity(opportunityName: "August 2026 #TrashTag Cleanup and Stinknet Removal - Tempe Town Lake", description: "Enjoy helping our enviornment? Join Keep Tempe Beautiful to clean up Tempe Town Lake and remove invasive stinknet. You'll be in the area between the Mill Ave Bridges next to North Shore Beach Tempe, AZ, 85288. While volunteering, you will work on Trash and litter removal, along with stinknet removal. You can spend anywhere from 1 hour shifts to even 3 hour shifts. Volunteers can also expect to help with event setup, teardwon, event raffles, parking lot attendence, taking photos, and more." + "\n\n\n" + "Location: Tempe, AZ, 85288; Further details about location will be provided after registering." + "\nDate: Monday, August 24, 2026" + "\n\nTime: 4:00 PM - 6:00 PM" + "\n\nAge: 14+ \nThe minimum age to volunteer for this opportunitiy is 14, however, a parent/guardian is required. Ages 16-17 can volunteer without a parent or guardian, but they MUST bring a youth waiver." + "\n\nInterests: Helping the environment, Cleaning"),
                        
                        Opportunity(opportunityName: "Thrift Shop Assistants at Hope's Closet", description: "Hope's Closet is a New Life Center's social enterprise thrift store, and are seeking for volunteers who can collect and sort clothing donations, move items to the sales floor, and organize clothing racks." + "\n\n\n" + "Location: Hope's Closet, Goodyear, AZ, 85338" + "\n\nDate: Saturday, August 22, 2026" + "\n\nTime: 10:00 AM - 12:00 PM" + "\n\nAge: 14+ \nThe minimum age to volunteer for this opportunitiy is 14, however, a parent/guardian is required. Ages 16 to 17 can volunteer without a parent.guardian, but they MUST bring a youth waiver." + "\n\nInterests: Cleaning, Helping the community"),
                        
                        Opportunity(opportunityName: "Pizza Maing with St. Vincent de Paul", description: "Do you enjoy cooking? Help prepare 150 pizzas for Friday night dinner service at St. Vincent de Paul. Volunteers will help roll out dough, spread out the sauce, layer on toppings, and get the pizzas into the ovens to cook. Please wear closed-toe shoes, mid-thigh length shorts or pants, and sleeved skirts. Hairnets, gloves, and aprons will be provided, but pizza making ccan get messy, so ensure to dress accordingly!" + "\n\n\n" + "Location: Full details will be provided after registration." + "\n\nDate: August 28, 2026" + "\n\nTime: 1:00 PM - 3:00 PM" + "Age 12+ \nThe minimum age for this opportunity is 12, however, a parent or guardian is required. Ages 16 to 17 can volunteer without a parent.guardian, but they MUST bring a youth waiver." + "\n\nInterests: Cooking, helping the homeless")]
    
    @State private var selectedItem: Opportunity?
    
    var body: some View {
        
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                Text("HandsOn Greater Phoenix")
                    .bold()
                    .font(.largeTitle)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            
            
            
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .leading, spacing: 12){
                    Text("Opportunities Near You  \( Image(systemName: "mappin.and.ellipse"))")
                        .font(.title2)
                        .foregroundStyle(Color.blue.gradient)
                        
                    
                    ScrollView{
                        VStack(alignment: .leading, spacing: 10){
                            ForEach(HandsOnGreaterPhoenixView.opportunities) { opportunity in
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
    HandsOnGreaterPhoenixView()
}





