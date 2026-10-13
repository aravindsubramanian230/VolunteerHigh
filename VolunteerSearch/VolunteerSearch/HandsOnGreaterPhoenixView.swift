//
//  HandsOnGreaterPhoenixView.swift
//  VolunteerSearch
//
//  Created by Aravind Subramanian on 5/18/26.
//

import Foundation
import SwiftUI

struct Opportunity: Identifiable, Equatable{
    let id: UUID
    var description: String
    var opportunityName: String
    var link: String?
    var date: String?

    init(
        opportunityName: String,
        description: String,
        link: String? = nil,
        date: String? = nil
    ) {
        self.id = UUID()
        self.opportunityName = opportunityName
        self.description = description
        self.link = link
        self.date = date
    }

    init(opportunityName: String, description: String, _ url: String, _ date: String) {
        self.id = UUID()
        self.opportunityName = opportunityName
        self.description = description + "\n\n" + url + "\n\n" + date
    }
}



    
struct HandsOnGreaterPhoenixView: View {
    
    
    
    static func contains(name: String) -> Bool {
            return opportunities.contains { $0.opportunityName == name }
        }
    
    #if false
     private static let baseOpportunities = [
        
                        
        
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
    
    private static let featuredOpportunities = baseOpportunities + [
           Opportunity(opportunityName: "Tree Planting at Fairview Neighborhood (Referral)", description:"We’ll be planting 50 trees on Saturday, October 10th in the Fairview Neighborhood in Phoenix, and we’d love to have you join us! \n\nOur tree plantings are volunteer powered, and your time and energy truly make a difference! By joining us, you’ll help bring more shade, reduce heat, and create lasting environmental benefits for our community.\n\nWhat to Expect\n\n\t\nVolunteers will assist with planting trees alongside Trees Matter staff and team leads\n\n\t\nNo prior experience is necessary\n\n\t\nThis is a residential planting, so volunteers should expect to walk between planting locations\n\n\t\nRestroom access will be at the discretion of the residents\n\n\t\nTraining and tools will be provided on-site\n\n\t\nWe will provide water and snacks\n\n\t\nFree Trees Matter t-shirt for new volunteers\n\n \n\nImportant Details\n\n\t\nDate: Saturday, October 10th\n\n\t\nLocation: Fairview Neighborhood - 2121 N 15th Ave, Phoenix\n\n\t\nEvent Time: 6:45 AM - 11:00 AM\n\n2026-10-10 | 6:45 AM - 11:00 AM\n\nLocation: Phoenix, AZ, 85007\n\nVolunteers still needed: 10", "https://www.handsonphoenix.org/opportunity/a0CUi00009PrEGLMA3",
                       "date : 2026-10-10")
          ]

    private static func importedOpportunity(
        _ name: String,
        date: String,
        details: String,
        link: String
    ) -> Opportunity {
        Opportunity(
            opportunityName: name,
            description: "\(details)\n\nDate: \(date)\n\n\(link)"
        )
    }

    private static let importedOpportunities = [
        importedOpportunity("Community Garden Workers with Keep Phoenix Beautiful", date: "2026-10-10", details: "Maintain Pierson Street Garden through planting, composting, painting, mulching, cleanup, and other garden tasks. Ages 7+ with a parent or guardian. 8:00 AM–10:00 AM, Phoenix, AZ 85015. Volunteers still needed: 0.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008mZ5ujMAC"),
        importedOpportunity("Nature Nurturers at Escalante Community Garden", date: "2026-10-10", details: "Help weed, plant, prune, and harvest at Escalante Community Garden. Ages 8+ with a parent or guardian. 8:00 AM–11:00 AM, Tempe, AZ 85281. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000082pJoXMAU"),
        importedOpportunity("Furry Friends at Forever Loved Pet Sanctuary", date: "2026-10-10", details: "Feed, clean, groom, walk, and socialize senior dogs awaiting adoption. Ages 16+. 8:30 AM–10:00 AM, Scottsdale, AZ 85254. Volunteers still needed: 0.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008lD5KVMA0"),
        importedOpportunity("Classroom Prep Pros at Southwest Autism Research & Resource Center", date: "2026-10-10", details: "Prepare classroom materials, organize supplies, complete prep projects, and clean classrooms. Ages 13+ with a parent or guardian. 9:00 AM–12:00 PM, Phoenix, AZ 85006. Volunteers still needed: 0.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008mYocDMAS"),
        importedOpportunity(
            "Afternoon Sort and Pack at St. Mary's Food Bank - Phoenix",
            date: "2026-10-10",
            details: """
            Bring your helping hands to sort, pack, and distribute food that will go to other nonprofits and families in crisis at St. Mary's Food Bank Alliance. You will have a blast meeting new people while working the assembly line!

            St. Mary's Food Bank is always in need of donations. Items such as cereal, canned goods, packages of bottled water, sports drinks, as well as dog and cat food are greatly appreciated. Feel free to bring donations with you to the project.

            Due to health codes and safety reasons, a volunteer dress code is in effect. Volunteers MUST wear:

            • Closed Toe Shoes (sneakers or boots only)

            • Shirts need to be short or long sleeved (No tank tops, spaghetti straps, sleeveless, midriff or low-cut tops)

            • Pants, jeans preferred. Shorts are okay at a respectable length. (Must be no shorter than 7” above the knee).

            The minimum age for this volunteer opportunity is 12 with a parent or guardian. All Volunteers under the age of 16 must be accompanied by a parent/guardian. Volunteers ages 16 and 17 who aren't attending a project with a parent/guardian MUST bring a Youth Waiver signed by a parent or guardian, to each project.

            To speed up the check-in process all volunteers can create an account by clicking the link below.

            Upon arrival, volunteers first need to check in with the Volunteer Leader listed below and sign our check-in sheet, then sign in on St. Mary's tablets to acknowledge the waiver and designate the company/organization you are associated with (HandsOn Greater Phoenix).

            http://stmarysfoodbank.volunteerhub.com/

            • Create account.

            • Affiliate yourself with HandsOn Greater Phoenix under company name (list is not alphabetized)

            • Sign up for the shift.

            • Please note that all volunteers will need to be affiliated with group name to sign up and view the shift.

            New volunteers under 18 attending the project without an adult must complete this waiver of liability for St. Mary's Food Bank Alliance and bring it with them to the project.

            If you would like to register your child, please email the opportunity coordinator listed below and ask to reserve a guest slot. Please note, volunteers 13 years or older can create their own HandsOn account and sign up for opportunities directly (activation fee is not applicable for those under the age of 16).

            2026-10-10 | 12:00 PM - 2:00 PM

            Location: Phoenix, AZ, 85009

            Volunteers still needed: 6
            """,
            link: "https://www.handsonphoenix.org/opportunity/a0CUi00008WyIMvMAN"
        ),
        importedOpportunity("Pick Your Time - 10-Minute Opportunity! Chilled Water Station Stewards Roosevelt", date: "2026-10-11", details: "Independently inspect and clean the Roosevelt Mini Park chilled-water station during a flexible weekly visit. Ages 16+. Phoenix, AZ 85003. Volunteers still needed: 0.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009JXuGoMAL"),
        importedOpportunity("Pick Your Time - 10-Minute Opportunity! Chilled Water Station Stewards Desert West", date: "2026-10-11", details: "Independently inspect and clean the Desert West Park chilled-water stations during a flexible weekly visit. Ages 16+. Phoenix, AZ 85035. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009JWwDTMA1"),
        importedOpportunity("Pick Your Time - 10-Minute Opportunity! Chilled Water Station Stewards - Lindo Park", date: "2026-10-11", details: "Independently inspect and clean the Lindo Park chilled-water station during a flexible weekly visit. Ages 16+. Phoenix, AZ 85041. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009JWx5gMAD"),
        importedOpportunity("Morning Kitchen Crew at St. Vincent de Paul", date: "2026-10-12", details: "Help prepare and clean up while the kitchen creates more than 4,000 meals. Ages 9+ with a parent or guardian. 6:30 AM–9:00 AM, Phoenix, AZ 85003. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009CujWxMAJ"),
        importedOpportunity("42nd Annual Native American Connections Parade & Open House (Referral)", date: "2026-10-12", details: "Support parade registration, hospitality, route monitoring, the NAC float, judging, or the art show. 7:00 AM–2:00 PM, Phoenix, AZ 85004. Volunteers still needed: 30.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000099Dk6YMAS"),
        importedOpportunity("Pick Your Time - 10-Minute Opportunity! Chilled Water Station Stewards - Grant Park", date: "2026-10-12", details: "Independently inspect and clean the Grant Park chilled-water station. Ages 16+. Phoenix, AZ 85003. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009JXwtiMAD"),
        importedOpportunity("Pick Your Time - 10-Minute Opportunity! Chilled Water Station Stewards - Cave Creek", date: "2026-10-12", details: "Independently inspect and clean the Cave Creek–Larkspur Park chilled-water station. Ages 16+. Phoenix, AZ 85029. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009JX3HOMA1"),
        importedOpportunity("Morning Kitchen Crew at St. Vincent de Paul", date: "2026-10-13", details: "Help prepare and clean up while the kitchen creates more than 4,000 meals. Ages 9+ with a parent or guardian. 6:30 AM–9:00 AM, Phoenix, AZ 85003. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009CujWyMAJ"),
        importedOpportunity("Volunteer Opportunity: October 2026 Independent Sector National Summit (Referral)", date: "2026-10-13", details: "Support a national nonprofit and philanthropy conference while attending sessions and building professional connections. 7:00 AM–6:00 PM, Phoenix, AZ 85004. Volunteers still needed: 19.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000093n81NMAQ"),
        importedOpportunity("Morning Kitchen Crew at St. Vincent de Paul", date: "2026-10-14", details: "Help prepare and clean up while the kitchen creates more than 4,000 meals. Ages 9+ with a parent or guardian. 6:30 AM–9:00 AM, Phoenix, AZ 85003. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009CujWzMAJ"),
        importedOpportunity("Volunteer Opportunity: October 2026 Independent Sector National Summit (Referral)", date: "2026-10-14", details: "Support a national nonprofit and philanthropy conference while attending sessions and building professional connections. 7:00 AM–6:00 PM, Phoenix, AZ 85004. Volunteers still needed: 19.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000093krBJMAY"),
        importedOpportunity("Picking and Packing Support with Arizona Diaper Bank", date: "2026-10-14", details: "Pick, pack, organize, and label diaper orders for families and partner agencies. Ages 10+ with a parent or guardian. 9:00 AM–12:00 PM, Phoenix, AZ 85043. Volunteers still needed: 5.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008q2mUjMAI"),
        importedOpportunity("Morning Kitchen Crew at St. Vincent de Paul", date: "2026-10-15", details: "Help prepare and clean up while the kitchen creates more than 4,000 meals. Ages 9+ with a parent or guardian. 6:30 AM–9:00 AM, Phoenix, AZ 85003. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009CujX0MAJ"),
        importedOpportunity("Volunteer Opportunity: October 2026 Independent Sector National Summit (Referral)", date: "2026-10-15", details: "Support a national nonprofit and philanthropy conference while attending sessions and building professional connections. 7:00 AM–6:00 PM, Phoenix, AZ 85004. Volunteers still needed: 20.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000093ntLKMAY"),
        importedOpportunity("El Rancho Del Sol Community Garden (Referral)", date: "2026-10-15", details: "Help water, weed, plant, harvest, compost, and maintain the community garden. 8:00 AM–10:00 AM, Mesa, AZ 85203. Volunteers still needed: 10.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000093rC80MAE"),
        importedOpportunity("Morning Kitchen Crew at St. Vincent de Paul", date: "2026-10-16", details: "Help prepare and clean up while the kitchen creates more than 4,000 meals. Ages 9+ with a parent or guardian. 6:30 AM–9:00 AM, Phoenix, AZ 85003. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009CujX1MAJ"),
        importedOpportunity("Volunteer Opportunity: October 2026 Independent Sector National Summit (Referral)", date: "2026-10-16", details: "Support a national nonprofit and philanthropy conference while attending sessions and building professional connections. 7:00 AM–6:00 PM, Phoenix, AZ 85004. Volunteers still needed: 19.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000093oMf6MAE"),
        importedOpportunity("Lunch Service at St. Vincent de Paul - Phoenix Dining Room", date: "2026-10-16", details: "Welcome guests and help set up, serve meals, bus tables, wash dishes, clean, and distribute supplies. Ages 16+. 10:00 AM–1:30 PM, Phoenix, AZ 85007. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009OpIv7MAF"),
        importedOpportunity("Site Beautification at YWCA", date: "2026-10-16", details: "Organize, label, declutter, assemble kits, or decorate YWCA's Glendale location. Ages 18+. 10:30 AM–12:30 PM, Glendale, AZ 85302. Volunteers still needed: 6.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000092h8UPMAY"),
        importedOpportunity("Evening Meal Service at St. Vincent de Paul - Phoenix Dining Room", date: "2026-10-16", details: "Welcome guests and help set up, serve meals, bus tables, wash dishes, clean, and distribute supplies. Ages 16+. 3:00 PM–6:00 PM, Phoenix, AZ 85007. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009Oq6DbMAJ"),
        importedOpportunity("SRP Shade Tree Distribution at South Mountain Community College (Referral)", date: "2026-10-17", details: "Unload and distribute shade trees, manage traffic, verify passes, check out guests, or support workshops. 6:00 AM–2:00 PM, Phoenix, AZ 85042. Volunteers still needed: 10.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009V20yPMAR"),
        importedOpportunity("The People's Garden (Referral)", date: "2026-10-17", details: "Water, weed, plant, harvest, compost, clean, and beautify The People's Garden. 7:00 AM–10:00 AM, Phoenix, AZ 85004. Volunteers still needed: 10.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000092hXprMAE"),
        importedOpportunity("From the Ground Up: Volunteer Day at the Ranch (Referral)", date: "2026-10-17", details: "Help with fence repairs, stall cleaning, barn organization, and ranch beautification. 7:00 AM–10:00 AM, Phoenix, AZ 85042. Volunteers still needed: 49.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008obuVNMAY"),
        importedOpportunity("Heart of Isaac - Parent University @ ASU West Campus (Referral)", date: "2026-10-17", details: "Welcome and check in families, guide attendees, answer questions, and support event activities. 7:30 AM–2:00 PM, Glendale, AZ 85306. Volunteers still needed: 15.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008wMtDqMAK"),
        importedOpportunity("October 2026 Monthly Park Cleanup and Stinknet Removal – Papago Park (Referral)", date: "2026-10-17", details: "Remove trash, litter, and invasive stinknet at Papago Park. No minimum age. 8:00 AM–11:00 AM, Tempe, AZ 85281. Volunteers still needed: 20.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00006oVcdqMAC"),
        importedOpportunity("Shopper Support with Harvest Compassion Center - Maryvale", date: "2026-10-17", details: "Welcome guests, assist with shopping, and keep the center clean and organized. Ages 6+ with a parent or guardian. 8:00 AM–12:00 PM, Phoenix, AZ 85033. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008sSQveMAG"),
        importedOpportunity("Sort and Pack at St. Mary's Food Bank - Phoenix", date: "2026-10-17", details: "Sort, pack, and distribute food for nonprofits and families in crisis. Ages 12+ with a parent or guardian. 8:00 AM–10:00 AM, Phoenix, AZ 85009. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008Wws80MAB"),
        importedOpportunity("Yard Games with Civitan House", date: "2026-10-17", details: "Play outdoor yard games with adults with developmental disabilities. Ages 8+ with a parent or guardian. 9:00 AM–11:00 AM, Phoenix, AZ 85015. Volunteers still needed: 7.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009TXehMMAT"),
        importedOpportunity("Medical Sort and Pack at Project C.U.R.E.", date: "2026-10-17", details: "Sort and pack medical supplies for hospitals, clinics, and orphanages worldwide. Ages 14+ with a parent or guardian. 9:00 AM–12:00 PM, Phoenix, AZ 85009. Volunteers still needed: 8.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008kwiWnMAI"),
        importedOpportunity("Community Crafters at HandsOn Greater Phoenix", date: "2026-10-17", details: "Create craft projects benefiting local nonprofit partners. Ages 6+. 10:00 AM–11:30 AM, Mesa, AZ 85204. Volunteers still needed: 3.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008pLyRNMA0"),
        importedOpportunity("Spirits of Mexico Festival - East Valley Edition 2026 (Referral)", date: "2026-10-17", details: "Support the Spirits of Mexico Festival in Downtown Chandler. Volunteers under 18 need guardian permission. 4:00 PM–10:00 PM, Chandler, AZ 85225. Volunteers still needed: 15.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009TZ0hPMAT"),
        importedOpportunity("Pick Your Time - 10-Minute Opportunity! Chilled Water Station Stewards Desert West", date: "2026-10-18", details: "Independently inspect and clean the Desert West Park chilled-water stations. Ages 16+. Phoenix, AZ 85035. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009JWwDUMA1"),
        importedOpportunity("Pick Your Time - 10-Minute Opportunity! Chilled Water Station Stewards - Lindo Park", date: "2026-10-18", details: "Independently inspect and clean the Lindo Park chilled-water station. Ages 16+. Phoenix, AZ 85041. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009JWx5hMAD"),
        importedOpportunity("Morning Kitchen Crew at St. Vincent de Paul", date: "2026-10-19", details: "Help prepare and clean up while the kitchen creates more than 4,000 meals. Ages 9+ with a parent or guardian. 6:30 AM–9:00 AM, Phoenix, AZ 85003. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009CujX2MAJ"),
        importedOpportunity("Pick Your Time - 10-Minute Opportunity! Chilled Water Station Stewards - Grant Park", date: "2026-10-19", details: "Independently inspect and clean the Grant Park chilled-water station. Ages 16+. Phoenix, AZ 85003. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009JXwtjMAD"),
        importedOpportunity("Pick Your Time - 10-Minute Opportunity! Chilled Water Station Stewards - Cave Creek", date: "2026-10-19", details: "Independently inspect and clean the Cave Creek–Larkspur Park chilled-water station. Ages 16+. Phoenix, AZ 85029. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009JX3HPMA1"),
        importedOpportunity("Morning Kitchen Crew at St. Vincent de Paul", date: "2026-10-20", details: "Help prepare and clean up while the kitchen creates more than 4,000 meals. Ages 9+ with a parent or guardian. 6:30 AM–9:00 AM, Phoenix, AZ 85003. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009CujX3MAJ"),
        importedOpportunity("HeARTsy (Peoria) Art Class Volunteer Adaptive Adults (Referral)", date: "2026-10-20", details: "Provide patient one-on-one assistance to adults with disabilities during an art class. Ages 16+ with a parent or guardian. 10:30 AM–12:30 PM, Peoria, AZ 85345. Volunteers still needed: 5.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000099zzMiMAI"),
        importedOpportunity("HeARTsy (Peoria) Art Class Volunteer - Senior Citizens (Referral)", date: "2026-10-20", details: "Assist senior artists, including participants with Alzheimer's, dementia, or Parkinson's disease. Ages 16+ with a parent or guardian. 12:45 PM–2:45 PM, Peoria, AZ 85345. Volunteers still needed: 5.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009A2hVQMAZ"),
        importedOpportunity("Morning Kitchen Crew at St. Vincent de Paul", date: "2026-10-21", details: "Help prepare and clean up while the kitchen creates more than 4,000 meals. Ages 9+ with a parent or guardian. 6:30 AM–9:00 AM, Phoenix, AZ 85003. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009CujX4MAJ"),
        importedOpportunity("HeARTsy (Phoenix) Art Class Volunteer - Adaptive Adults (Referral)", date: "2026-10-21", details: "Provide patient one-on-one assistance to adults with disabilities during an art class. Ages 16+ with a parent or guardian. 9:45 AM–11:45 AM, Phoenix, AZ 85042. Volunteers still needed: 5.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000099wrPPMAY"),
        importedOpportunity("HeARTsy (Phoenix) Art Class Volunteer - Senior Citizens (Referral)", date: "2026-10-21", details: "Assist senior citizens during an art class. 12:00 PM–2:00 PM, Phoenix, AZ 85042. Volunteers still needed: 5.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009A37rVMAR"),
        importedOpportunity("HeARTsy (Tempe) Art Class Volunteer - Adaptive Adults (Referral)", date: "2026-10-21", details: "Provide patient one-on-one assistance to adults with disabilities during an art class. Ages 16+ with a parent or guardian. 6:00 PM–8:00 PM, Tempe, AZ 85281. Volunteers still needed: 5.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009A2k68MAB"),
        importedOpportunity("Morning Kitchen Crew at St. Vincent de Paul", date: "2026-10-22", details: "Help prepare and clean up while the kitchen creates more than 4,000 meals. Ages 9+ with a parent or guardian. 6:30 AM–9:00 AM, Phoenix, AZ 85003. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009CujX5MAJ"),
        importedOpportunity("Morning Kitchen Crew at St. Vincent de Paul", date: "2026-10-23", details: "Help prepare and clean up while the kitchen creates more than 4,000 meals. Ages 9+ with a parent or guardian. 6:30 AM–9:00 AM, Phoenix, AZ 85003. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009CujX6MAJ"),
        importedOpportunity("Garden Volunteers at Mesa Urban Farm", date: "2026-10-23", details: "Fertilize, compost, plant, and harvest produce for St. Vincent de Paul's Mesa Dining Room. Ages 8+ with a parent or guardian. 7:00 AM–10:00 AM, Mesa, AZ 85210. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008lDYuNMAW"),
        importedOpportunity("Fall Games 2026 (Referral)", date: "2026-10-23", details: "Support Special Olympics Arizona competitions and cheer on athletes. 8:00 AM–5:00 PM, Surprise, AZ 85388. Volunteers still needed: 100.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008EGUZ5MAP"),
        importedOpportunity("HeARTsy (Phoenix) Art Class Volunteer - Adaptive Adults (Referral)", date: "2026-10-23", details: "Provide patient one-on-one assistance to adults with disabilities during an art class. Ages 16+ with a parent or guardian. 9:45 AM–11:45 AM, Phoenix, AZ 85042. Volunteers still needed: 5.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009A40f1MAB"),
        importedOpportunity("Lunch Service at St. Vincent de Paul - Phoenix Dining Room", date: "2026-10-23", details: "Welcome guests and help set up, serve meals, bus tables, wash dishes, clean, and distribute supplies. Ages 16+. 10:00 AM–1:30 PM, Phoenix, AZ 85007. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009OoPlOMAV"),
        importedOpportunity("Pizza Making with St. Vincent de Paul", date: "2026-10-23", details: "Prepare 150 pizzas for Friday dinner service. Ages 12+ with a parent or guardian. 12:45 PM–3:30 PM, Phoenix, AZ 85003. Volunteers still needed: 0.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008mT9BbMAK"),
        importedOpportunity("Evening Meal Service at St. Vincent de Paul - Phoenix Dining Room", date: "2026-10-23", details: "Welcome guests and help set up, serve meals, bus tables, wash dishes, clean, and distribute supplies. Ages 16+. 3:00 PM–6:00 PM, Phoenix, AZ 85007. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009Op9aTMAR"),
        importedOpportunity("BINGO! at Osborn Pointe", date: "2026-10-23", details: "Run Bingo, call numbers, and distribute prizes for supportive-housing residents. Ages 12+ with an adult. 3:00 PM–4:00 PM, Phoenix, AZ 85012. Volunteers still needed: 2.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000093l3iVMAQ"),
        importedOpportunity("Fall Games 2026 (Referral)", date: "2026-10-24", details: "Support Special Olympics Arizona competitions and cheer on athletes. 7:30 AM–4:00 PM, Surprise, AZ 85388. Volunteers still needed: 100.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008EGUZ6MAP"),
        importedOpportunity("Rise and Dine at HomeBase", date: "2026-10-24", details: "Prepare and serve breakfast for homeless youth and young adults. Ages 11+ with a parent or guardian. 8:00 AM–10:00 AM, Phoenix, AZ 85014. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008lQL0UMAW"),
        importedOpportunity("Thrift Shop Assistants at Hope's Closet", date: "2026-10-24", details: "Sort clothing donations, move items to the sales floor, and organize racks. Ages 14+. 10:00 AM–12:00 PM, Goodyear, AZ 85338. Volunteers still needed: 6.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008lSukuMAC"),
        importedOpportunity("Pick Your Time - 10-Minute Opportunity! Chilled Water Station Stewards Desert West", date: "2026-10-25", details: "Independently inspect and clean the Desert West Park chilled-water stations. Ages 16+. Phoenix, AZ 85035. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009JWwDVMA1"),
        importedOpportunity("Pick Your Time - 10-Minute Opportunity! Chilled Water Station Stewards - Lindo Park", date: "2026-10-25", details: "Independently inspect and clean the Lindo Park chilled-water station. Ages 16+. Phoenix, AZ 85041. Volunteers still needed: 0.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009JWx5iMAD"),
        importedOpportunity("Morning Kitchen Crew at St. Vincent de Paul", date: "2026-10-26", details: "Help prepare and clean up while the kitchen creates more than 4,000 meals. Ages 9+ with a parent or guardian. 6:30 AM–9:00 AM, Phoenix, AZ 85003. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009CujX7MAJ"),
        importedOpportunity("Pick Your Time - 10-Minute Opportunity! Chilled Water Station Stewards - Grant Park", date: "2026-10-26", details: "Independently inspect and clean the Grant Park chilled-water station. Ages 16+. Phoenix, AZ 85003. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009JXwtkMAD"),
        importedOpportunity("Pick Your Time - 10-Minute Opportunity! Chilled Water Station Stewards - Cave Creek", date: "2026-10-26", details: "Independently inspect and clean the Cave Creek–Larkspur Park chilled-water station. Ages 16+. Phoenix, AZ 85029. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009JX3HQMA1"),
        importedOpportunity("Chef's Night Off at HomeBase", date: "2026-10-26", details: "Prepare and serve dinner and pack lunches for homeless youth and young adults. Ages 11+ with a parent or guardian. 4:00 PM–6:00 PM, Phoenix, AZ 85014. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008qx81EMAQ"),
        importedOpportunity("Morning Kitchen Crew at St. Vincent de Paul", date: "2026-10-27", details: "Help prepare and clean up while the kitchen creates more than 4,000 meals. Ages 9+ with a parent or guardian. 6:30 AM–9:00 AM, Phoenix, AZ 85003. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009CujX8MAJ"),
        importedOpportunity("Morning Kitchen Crew at St. Vincent de Paul", date: "2026-10-28", details: "Help prepare and clean up while the kitchen creates more than 4,000 meals. Ages 9+ with a parent or guardian. 6:30 AM–9:00 AM, Phoenix, AZ 85003. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009CujX9MAJ"),
        importedOpportunity("Morning Kitchen Crew at St. Vincent de Paul", date: "2026-10-29", details: "Help prepare and clean up while the kitchen creates more than 4,000 meals. Ages 9+ with a parent or guardian. 6:30 AM–9:00 AM, Phoenix, AZ 85003. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009CujXAMAZ"),
        importedOpportunity("Coronado Area Bowling Competition in Tucson (Referral)", date: "2026-10-29", details: "Support Special Olympics Arizona competition operations and cheer on athletes. 9:30 AM–12:30 PM, Tucson, AZ 85704. Volunteers still needed: 20.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008EF2GoMAL"),
        importedOpportunity("Morning Kitchen Crew at St. Vincent de Paul", date: "2026-10-30", details: "Help prepare and clean up while the kitchen creates more than 4,000 meals. Ages 9+ with a parent or guardian. 6:30 AM–9:00 AM, Phoenix, AZ 85003. Volunteers still needed: 2.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009CujXBMAZ"),
        importedOpportunity("Lunch Service at St. Vincent de Paul - Phoenix Dining Room", date: "2026-10-30", details: "Welcome guests and help set up, serve meals, bus tables, wash dishes, clean, and distribute supplies. Ages 16+. 10:00 AM–1:30 PM, Phoenix, AZ 85007. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009OrAOfMAN"),
        importedOpportunity("Evening Meal Service at St. Vincent de Paul - Phoenix Dining Room", date: "2026-10-30", details: "Welcome guests and help set up, serve meals, bus tables, wash dishes, clean, and distribute supplies. Ages 16+. 3:00 PM–6:00 PM, Phoenix, AZ 85007. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009OqflRMAR"),
        importedOpportunity("From the Ground Up: Volunteer Day at the Ranch (Referral)", date: "2026-10-31", details: "Help with fence repairs, stall cleaning, barn organization, and ranch beautification. 7:00 AM–10:00 AM, Phoenix, AZ 85042. Volunteers still needed: 50.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008oZje7MAC"),
        importedOpportunity("G.A.I.N. Trick-o-Treat on 13th St (Referral)", date: "2026-10-31", details: "Set up lights, monitor the bounce house, and distribute candy at a neighborhood block party. 4:00 PM–9:00 PM, Phoenix, AZ 85020. Volunteers still needed: 20.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009JXoktMAD"),
        importedOpportunity("Coronado Area Bowling Competition in Tucson (Referral)", date: "2026-11-02", details: "Support Special Olympics Arizona competition operations and cheer on athletes. 9:30 AM–12:30 PM, Tucson, AZ 85704. Volunteers still needed: 10.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008EF2GpMAL"),
        importedOpportunity("Grant Writer (Referral)", date: "2026-11-03", details: "Research funders, draft proposals, and manage a fundraising calendar for a long-term volunteer commitment. 9:00 AM–2:00 PM, Phoenix, AZ 85018. Volunteers still needed: 5.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00007TSrxLMAT"),
        importedOpportunity("BINGO! with St. Vincent de Paul", date: "2026-11-04", details: "Run Bingo, call numbers, and distribute prizes at the Washington Street Shelter. Ages 18+. 4:00 PM–5:00 PM, Phoenix, AZ 85034. Volunteers still needed: 4.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008jtNMwMAM"),
        importedOpportunity("El Rancho Del Sol Community Garden - Mesa (Referral)", date: "2026-11-05", details: "Help water, weed, plant, harvest, compost, and maintain the community garden. 8:00 AM–10:00 AM, Mesa, AZ 85203. Volunteers still needed: 10.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000092itd1MAA"),
        importedOpportunity("El Rancho Del Sol Community Garden (Referral)", date: "2026-11-05", details: "Help water, weed, plant, harvest, compost, and maintain the community garden. 8:00 AM–10:00 AM, Mesa, AZ 85203. Volunteers still needed: 10.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000093rC81MAE"),
        importedOpportunity("Coronado Area Bowling Competition in Tucson (Referral)", date: "2026-11-05", details: "Support Special Olympics Arizona competition operations and cheer on athletes. 9:30 AM–12:30 PM, Tucson, AZ 85704. Volunteers still needed: 20.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008EF2GqMAL"),
        importedOpportunity("Kid Connection at The Salvation Army", date: "2026-11-05", details: "Spend time doing crafts, reading, playing games, and participating in sports with children at an emergency family shelter. Ages 18+. 4:45 PM–6:00 PM, Phoenix, AZ 85008. Volunteers still needed: 2.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008mWoabMAC"),
        importedOpportunity("Surprise Smoke Alarm Walk (Referral)", date: "2026-11-06", details: "Install free smoke alarms and provide fire-safety education in high-risk homes. 8:00 AM–12:00 PM, Surprise, AZ 85378. Volunteers still needed: 100.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009NlHdYMAV"),
        importedOpportunity("Coronado Area Bowling Competition in Tucson (Referral)", date: "2026-11-06", details: "Support Special Olympics Arizona competition operations and cheer on athletes. 8:30 AM–11:30 AM, Tucson, AZ 85704. Volunteers still needed: 20.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008EF2GrMAL"),
        importedOpportunity("Coronado Area Bowling Competition in Tucson (Referral)", date: "2026-11-06", details: "Support Special Olympics Arizona competition operations and cheer on athletes. 11:30 AM–2:30 PM, Tucson, AZ 85704. Volunteers still needed: 20.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008EF2GsMAL"),
        importedOpportunity("Arizona Fall Festival - Multiple Shifts! (Referral)", date: "2026-11-07", details: "Help with setup, beverage garden operations, general support, or zero-waste efforts at Arizona Fall Fest. 6:00 AM–5:00 PM, Phoenix, AZ 85004. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008ydQqsMAE"),
        importedOpportunity("Coronado Area Bowling Competition in Tucson (Referral)", date: "2026-11-07", details: "Support Special Olympics Arizona competition operations and cheer on athletes. 8:00 AM–11:00 AM, Tucson, AZ 85704. Volunteers still needed: 20.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008EF2GtMAL"),
        importedOpportunity("Coronado Area Bowling Competition in Tucson (Referral)", date: "2026-11-07", details: "Support Special Olympics Arizona competition operations and cheer on athletes. 11:00 AM–2:00 PM, Tucson, AZ 85704. Volunteers still needed: 20.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008EF2GuMAL"),
        importedOpportunity("Food Box Distribution with Creighton Community Foundation", date: "2026-11-07", details: "Distribute food boxes to families through a mobile delivery line at Excelencia School. No minimum age with a parent or guardian. 8:00 AM–12:00 PM, Phoenix, AZ 85006. Volunteers still needed: 0.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008mYrbgMAC"),
        importedOpportunity("Garden Volunteers with St. Vincent de Paul (Main Campus)", date: "2026-11-07", details: "Fertilize, compost, plant, and harvest produce for community meals. Ages 8+ with a parent or guardian. 8:00 AM–11:00 AM, Phoenix, AZ 85003. Volunteers still needed: 15.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008qwjfZMAQ"),
        importedOpportunity("Mountain Area Golf Competition in Prescott (Referral)", date: "2026-11-07", details: "Support Special Olympics Arizona competition operations and cheer on athletes. 9:30 AM–4:00 PM, Prescott, AZ 86301. Volunteers still needed: 10.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008EFZz2MAH"),
        importedOpportunity("Mountain Area Golf Competition in Prescott (Referral)", date: "2026-11-07", details: "Support Special Olympics Arizona competition operations and cheer on athletes. 10:00 AM–1:00 PM, Prescott, AZ 86301. Volunteers still needed: 15.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008EFZz3MAH"),
        importedOpportunity("Maggie's Place Spruce Up", date: "2026-11-07", details: "Work alongside residents to clean and maintain The Michael House. Ages 12+ with a parent or guardian. 10:00 AM–12:00 PM, Glendale, AZ 85302. Volunteers still needed: 3.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008mVanWMAS"),
        importedOpportunity("Valley Area Golf Competition in Phoenix (Referral)", date: "2026-11-07", details: "Support Special Olympics Arizona competition operations and cheer on athletes. 11:00 AM–2:00 PM, Phoenix, AZ 85007. Volunteers still needed: 12.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008EE7FGMA1"),
        importedOpportunity("New Way Academy's Fall Kickoff (Referral)", date: "2026-11-07", details: "Run activity stations including cake walk, Bingo, face painting, concessions, and inflatables. Background check required. 11:00 AM–2:00 PM, Phoenix, AZ 85008. Volunteers still needed: 10.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009A4RaaMAF"),
        importedOpportunity("Picking and Packing Support with Arizona Diaper Bank", date: "2026-11-11", details: "Pick, pack, organize, and label diaper orders for families and partner agencies. Ages 10+ with a parent or guardian. 9:00 AM–12:00 PM, Phoenix, AZ 85043. Volunteers still needed: 6.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008q2Bt7MAE"),
        importedOpportunity("Valley Area Softball Competition (Referral)", date: "2026-11-12", details: "Support Special Olympics Arizona competition operations and cheer on athletes. 8:30 AM–2:15 PM, Peoria, AZ 85345. Volunteers still needed: 18.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008EF7tCMAT"),
        importedOpportunity("Game Night at MANA House", date: "2026-11-12", details: "Facilitate Bingo for homeless and formerly homeless veterans. Ages 18+. 6:00 PM–7:30 PM, Phoenix, AZ 85009. Volunteers still needed: 3.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008ju63BMAQ"),
        importedOpportunity("Community Market (Referral)", date: "2026-11-13", details: "Assemble food packages and deliver food boxes to community members' cars. 9:00 AM–1:00 PM, Glendale, AZ 85302. Volunteers still needed: 10.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008E7r38MAB"),
        importedOpportunity("Chef's Night Off at HomeBase Surprise", date: "2026-11-13", details: "Prepare and serve dinner and pack lunches for homeless youth and young adults. Ages 11+ with a parent or guardian. 3:00 PM–5:00 PM, Surprise, AZ 85378. Volunteers still needed: 1.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000093DennMAC"),
        importedOpportunity("Community Garden Workers with Keep Phoenix Beautiful", date: "2026-11-14", details: "Maintain Pierson Street Garden through planting, composting, painting, mulching, cleanup, and other garden tasks. Ages 7+ with a parent or guardian. 8:00 AM–10:00 AM, Phoenix, AZ 85015. Volunteers still needed: 0.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008mZ6cIMAS"),
        importedOpportunity("Nature Nurturers at Escalante Community Garden", date: "2026-11-14", details: "Help weed, plant, prune, and harvest at Escalante Community Garden. Ages 8+ with a parent or guardian. 8:00 AM–11:00 AM, Tempe, AZ 85281. Volunteers still needed: 9.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009UHv2UMAT"),
        importedOpportunity("Community Crafters at HandsOn Greater Phoenix", date: "2026-11-14", details: "Create craft projects benefiting local nonprofit partners. Ages 6+. 10:00 AM–11:30 AM, Mesa, AZ 85204. Volunteers still needed: 11.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008pOAETMA4"),
        importedOpportunity("Afternoon Sort and Pack at St. Mary's Food Bank - Phoenix", date: "2026-11-14", details: "Sort, pack, and distribute food for nonprofits and families in crisis. Ages 12+ with a parent or guardian. 12:00 PM–2:00 PM, Phoenix, AZ 85009. Volunteers still needed: 10.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008WyK29MAF"),
        importedOpportunity("HeARTsy (Peoria) Art Class Volunteer Adaptive Adults (Referral)", date: "2026-11-17", details: "Provide patient one-on-one assistance to adults with disabilities during an art class. Ages 16+ with a parent or guardian. 10:30 AM–12:30 PM, Peoria, AZ 85345. Volunteers still needed: 5.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000099zdeeMAA"),
        importedOpportunity("HeARTsy (Peoria) Art Class Volunteer - Senior Citizens (Referral)", date: "2026-11-17", details: "Assist senior artists, including participants with Alzheimer's, dementia, or Parkinson's disease. Ages 16+ with a parent or guardian. 12:45 PM–2:45 PM, Peoria, AZ 85345. Volunteers still needed: 5.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009A1ns9MAB"),
        importedOpportunity("HeARTsy (Phoenix) Art Class Volunteer - Adaptive Adults (Referral)", date: "2026-11-18", details: "Provide patient one-on-one assistance to adults with disabilities during an art class. Ages 16+ with a parent or guardian. 9:45 AM–11:45 AM, Phoenix, AZ 85042. Volunteers still needed: 5.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000099qLxrMAE"),
        importedOpportunity("HeARTsy (Phoenix) Art Class Volunteer - Senior Citizens (Referral)", date: "2026-11-18", details: "Assist senior citizens during an art class. 12:00 PM–2:00 PM, Phoenix, AZ 85042. Volunteers still needed: 5.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009A3MHpMAN"),
        importedOpportunity("HeARTsy (Tempe) Art Class Volunteer - Adaptive Adults (Referral)", date: "2026-11-18", details: "Provide patient one-on-one assistance to adults with disabilities during an art class. Ages 16+ with a parent or guardian. 6:00 PM–8:00 PM, Tempe, AZ 85281. Volunteers still needed: 5.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009A2cqAMAR"),
        importedOpportunity("El Rancho Del Sol Community Garden (Referral)", date: "2026-11-19", details: "Help water, weed, plant, harvest, compost, and maintain the community garden. 8:00 AM–10:00 AM, Mesa, AZ 85203. Volunteers still needed: 10.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000093rC82MAE"),
        importedOpportunity("HeARTsy (Phoenix) Art Class Volunteer - Adaptive Adults (Referral)", date: "2026-11-19", details: "Provide patient one-on-one assistance to adults with disabilities during an art class. Ages 16+ with a parent or guardian. 9:45 AM–11:45 AM, Phoenix, AZ 85042. Volunteers still needed: 5.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009A3yWwMAJ"),
        importedOpportunity("Site Beautification at YWCA", date: "2026-11-20", details: "Organize, label, declutter, assemble kits, or decorate YWCA's Glendale location. Ages 18+. 10:30 AM–12:30 PM, Glendale, AZ 85302. Volunteers still needed: 6.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000092exPYMAY"),
        importedOpportunity("From the Ground Up: Volunteer Day at the Ranch (Referral)", date: "2026-11-21", details: "Help with fence repairs, stall cleaning, barn organization, and ranch beautification. 7:00 AM–10:00 AM, Phoenix, AZ 85042. Volunteers still needed: 50.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008oZRu7MAG"),
        importedOpportunity("Coronado Area Softball Competition in Tucson (Referral)", date: "2026-11-21", details: "Support Special Olympics Arizona competition operations and cheer on athletes. Lunch is provided. 8:00 AM–2:00 PM, Tucson, AZ 85713. Volunteers still needed: 20.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008EEiPNMA1"),
        importedOpportunity("Maricopa Smoke Alarm Walk (Referral)", date: "2026-11-21", details: "Install free smoke alarms and provide fire-safety education in high-risk homes. 8:00 AM–12:00 PM, Maricopa, AZ 85138. Volunteers still needed: 100.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008xqimzMAA"),
        importedOpportunity("November 2026 Monthly Park Cleanup and Stinknet Removal – LoPiano Park East (Referral)", date: "2026-11-21", details: "Remove trash, litter, and invasive stinknet at LoPiano Park East. No minimum age. 8:00 AM–11:00 AM, Tempe, AZ 85281. Volunteers still needed: 20.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00006oUtMSMA0"),
        importedOpportunity("Sort and Pack at St. Mary's Food Bank - Phoenix", date: "2026-11-21", details: "Sort, pack, and distribute food for nonprofits and families in crisis. Ages 12+ with a parent or guardian. 8:00 AM–10:00 AM, Phoenix, AZ 85009. Volunteers still needed: 7.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008WwhZNMAZ"),
        importedOpportunity("Furry Friends at Forever Loved Pet Sanctuary", date: "2026-11-21", details: "Feed, clean, groom, walk, and socialize senior dogs awaiting adoption. Ages 16+. 8:30 AM–10:00 AM, Scottsdale, AZ 85254. Volunteers still needed: 2.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008lVZDlMAO"),
        importedOpportunity("The People's Garden (Referral)", date: "2026-11-21", details: "Water, weed, plant, harvest, compost, clean, and beautify The People's Garden. 9:00 AM–12:00 PM, Phoenix, AZ 85004. Volunteers still needed: 10.", link: "https://www.handsonphoenix.org/opportunity/a0CUi000092jIHgMAM"),
        importedOpportunity("2026 Family Volunteer Day at HandsOn Greater Phoenix", date: "2026-11-21", details: "Complete construction and craft projects including murals, dog beds, blankets, gift wrapping, cleanup, and stencil cutting. Ages 6+. 9:00 AM–12:00 PM, Phoenix, AZ 85008. Volunteers still needed: 48.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009TZHqHMAX"),
        importedOpportunity("Yard Games with Civitan House", date: "2026-11-21", details: "Play outdoor yard games with adults with developmental disabilities. Ages 8+ with a parent or guardian. 9:00 AM–11:00 AM, Phoenix, AZ 85015. Volunteers still needed: 9.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00009TUPgtMAH"),
        importedOpportunity("Medical Sort and Pack at Project C.U.R.E.", date: "2026-11-21", details: "Sort and pack medical supplies for hospitals, clinics, and orphanages worldwide. Ages 14+ with a parent or guardian. 9:00 AM–12:00 PM, Phoenix, AZ 85009. Volunteers still needed: 9.", link: "https://www.handsonphoenix.org/opportunity/a0CUi00008l05qTMAQ")
    ]

    static let opportunities = featuredOpportunities + importedOpportunities
    #endif

    private struct ScrapedData: Decodable {
        let handsOnGreaterPhoenix: HandsOnData
    }

    private struct HandsOnData: Decodable {
        let opportunities: [ScrapedOpportunity]
    }

    private struct ScrapedOpportunity: Decodable {
        let name: String
        let description: String
        let link: String
        let date: String
        let time: String?
        let location: String?
        let type: String?
        let volunteers_Needed: Int?
    }

    static let opportunities: [Opportunity] = {
        guard let url = Bundle.main.url(
            forResource: "HandsOnGreaterPhoenix",
            withExtension: "json"
        ),
        let data = try? Data(contentsOf: url),
        let scrapedData = try? JSONDecoder().decode([ScrapedOpportunity].self, from: data) else {
            return []
        }

        return scrapedData.map { opportunity in
            Opportunity(
                opportunityName: opportunity.name,
                description: """
                \(opportunity.description)
                
                Date: \(opportunity.date)
                Time: \(opportunity.time ?? "Unknown")
                Location: \(opportunity.location ?? "Unknown")
                Volunteers needed: \(opportunity.volunteers_Needed ?? 0) 
                """,
                link: opportunity.link,
                date: opportunity.date
            )
        }
    }()
    
    
    @State private var selectedItem: Opportunity?
    @State private var searchText = ""
    
    private var searchedOpportunities: [Opportunity] {
        
        guard !searchText.isEmpty else {
            return Self.opportunities
        }
        
        return Self.opportunities.filter { opportunity in
            opportunity.opportunityName.localizedCaseInsensitiveContains(searchText) || opportunity.description.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                Text("HandsOn Greater Phoenix")
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle((Color(red: 232/255, green: 169/255, blue: 57/255)))
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .background(Color(red: 4/255, green: 28/255, blue: 69/255))
            
            
            
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .leading, spacing: 12){
                    Text("Opportunities Near You  \( Image(systemName: "mappin.and.ellipse"))")
                        .font(.title2)
                        .foregroundStyle(Color.blue.gradient)
                    
                    TextField("Search Opportunities...", text: $searchText)
                        .textFieldStyle(.roundedBorder)
                    
                        
                    
                    ScrollView{
                        VStack(alignment: .leading, spacing: 10){
                            ForEach(searchedOpportunities) { opportunity in
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
                .background(Color(red: 4/255, green: 28/255, blue: 69/255))
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
                            
                            HStack(spacing: 12){
                                if let orglink = item.link {
                                    if let website = URL(string: orglink) {
                                        Link("View Opportunity", destination: website)
                                            .padding()
                                            .background(Color.blue)
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                            
                                        
                                    }
                                }
                                
                                Link("Email HandsOn Greater Phoenix", destination: URL(string: "mailto:info@handsonphoenix.org")!)
                                    .padding()
                                    .controlSize(.large)
                                    .buttonStyle(.borderedProminent)
                                    
                            }
                            .padding(.leading, 15)

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
                .background(Color(red: 4/255, green: 28/255, blue: 69/255))
            }
        }
    }
}

        
            
            
#Preview {
    HandsOnGreaterPhoenixView()
}
