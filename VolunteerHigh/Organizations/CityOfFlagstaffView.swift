//
//  HandsOnGreaterPhoenixView.swift
//  VolunteerSearch
//
//  Created by Aravind Subramanian on 5/18/26.
//

import Foundation
import SwiftUI

struct Opportunity4: Identifiable, Equatable{
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
}



struct CityOfFlagstaffView : View{
    
    static func contains(name: String) -> Bool {
            return opportunities.contains { $0.opportunityName == name }
    }
    
    
    
    #if false
    static let opportunities = [
        
        Opportunity4(opportunityName:"Full Moon Bike Ride/Hike!", description: "Enjoy outdoor activites? Then this opportunitiy is for you! Enjoy a night out walking on a trail or out and back, and watch the full moon rise. You can meet new people, bike, and hike during this event. You will go on the Karen Cooper FUTS trail, which lasts about 6 miles.\n\n\nAge: 0+\nAny age can participate.\n\nLocation: Frances Short Pond\n\nDate: July 29, 2026\n\nTime: 7:30 PM - 9:30 PM"),
        
        Opportunity4(opportunityName: "Garden Maintenance Volunteer Day - Bonito", description: "Enjoy nature and plants? Then this opportunitiy is for you.\n\n**Note: The Garden Maintenance Volunteer Opportunitiy is available in multiple locations across Flagstaff. Scroll down for more locations.**\n\nGarden Volunteer days are a great way to become directly involved in a community garden, interact with other gardeners, and ensure the gardens continue to thrive in the future. As a volunteer, here are the things you might do:\n\n•Turning compost\n•Weeding\n•Caring for communal plots\n•Hands-on learning expereinces and creative, garden inspired projects.\n\nThis opportunitiy is wonderful if you are looking to build gardening skills, meet new people, or simply spend time giving back to the community.\n\n\nAge: 0+\nAny age can participate.\n\nLocation: Bonito Community Garden Pond\n\nDate: August 04, 2026  \n\nTime: 7:30 PM - 9:30 PM"),
        
        Opportunity4(opportunityName: "Garden Maintenance Volunteer Day - Southside", description: "Enjoy nature and plants? Then this opportunitiy is for you.\n\n**Note: The Garden Maintenance Volunteer Opportunitiy is available in multiple locations across Flagstaff. Scroll down for more locations.**\n\nGarden Volunteer days are a great way to become directly involved in a community garden, interact with other gardeners, and ensure the gardens continue to thrive in the future. As a volunteer, here are the things you might do: \n\n•Turning compost\n•Weeding\n•Caring for communal plots\n•Hands-on learning expereinces and creative, garden inspired projects.\n\nThis opportunitiy is wonderful if you are looking to build gardening skills, meet new people, or simply spend time giving back to the community.\n\n\nAge: 0+\nAny age can participate.\n\nLocation: Southside Community Garden\n\nDate: August 04, 2026  \n\nTime: 4:00 PM - 6:00 PM"),
        
        Opportunity4(opportunityName: "Garden Maintenance Volunteer Day - Hal Jensen", description: "Enjoy nature and plants? Then this opportunitiy is for you.\n\n**Note: The Garden Maintenance Volunteer Opportunitiy is available in multiple locations across Flagstaff. Scroll down for more locations.**\n\nGarden Volunteer days are a great way to become directly involved in a community garden, interact with other gardeners, and ensure the gardens continue to thrive in the future. As a volunteer, here are the things you might do: \n\n•Turning compost\n•Weeding\n•Caring for communal plots\n•Hands-on learning expereinces and creative, garden inspired projects.\n\nThis opportunitiy is wonderful if you are looking to build gardening skills, meet new people, or simply spend time giving back to the community.\n\n\nAge: 0+\nAny age can participate.\n\nLocation: Southside Community Garden\n\nDate: August 21, 2026\n\nTime: 4:00 PM - 6:00 PM"),
        
        Opportunity4(opportunityName: "Invasive Weed Identification, Removal & Reseeding", description: "Volunteers are requested to help manage invasive weeds at Picture Canyon. In addition to helping the enviornment, you will also learn valuable information on gardening skills, such as how to remove weeds, and plant flowers. This event is on every other Wednesday.\n\nAge: 0+\nAny Age can participate.\n\nLocation: Picture Canyon Natural & Cultural Preserve\n\nDates: Every other Wednesday morning.\n\nTime: 7:00 AM - 10:00 AM"),
        
        Opportunity4(opportunityName: "Mushroom Walk!", description: "Join mushroom enthusiasts for the Arizona Watchable Wildlife Experience's afternoon mushroom walk! During this event, you will assist with finding fungi and mushrooms. The event is free, but participation is limited to 20.\n\nAge: 0+\nAny age can participate. \n\nLocation: Location details will be revealed after registration.\n\nDate: August 22, 2026\n\nTimes:\n•9:00 AM - 11:00 AM\n•11:30 AM - 1:30 PM"),
        
        Opportunity4(opportunityName:"Full Moon Hike -- Mars Hill Trail", description: "Enjoy outdoor activites? Then this opportunitiy is for you! Enjoy a night out walking on a trail or out and back, and watch the full moon rise. You can meet new people and hike during this event. You will go on the Mars Hill Trail, which lasts about 3 miles.\n\n\nAge: 0+\nAny age can participate.\n\nLocation: Observatory Mesa - Mars Hill Trail\n\nDate: July 29, 2026\n\nTime: 6:15 PM - 8:15 PM"),
    ]
    #endif

    static let opportunities: [Opportunity4] = [
        Opportunity4(
            opportunityName: "Fix-it Clinic (1/4)",
            description: "At Fix-it Clinics, we support sustainable consumption and divert waste from landfills by repairing items that would otherwise end up in the trash. Our incredible team of volunteers can help you fix almost anything, including electronics, jewelry, clothing, bicycles, and more! \r\n\r\nLead Volunteers will:\r\n• Use hand tools and small power tools to repair everyday household items such as electronics, bicycles, kitchen appliances, jewelry, clothing, furniture, lamps, and more.\r\n• Wear appropriate personal protective equipment (PPE).\r\n• Ensure workstations are maintained in a clean and organized manner to reduce exposure to chemicals, open electric circuits, and sharp objects or projections.\r\n\r\nOther Volunteers will:\r\n• Assist with the community member check-in process.\r\n• Complete necessary “Fix-It” paperwork, which identifies if an item was fixed or was unrepairable.\r\n• Assist with diagnosing items. \r\n\r\nFix-It Clinics reduce the amount of waste going to the landfill, encourage responsible consumption, teach community members real-world skills, and build connections between Flagstaff residents.\r\n\r\nIf you are looking to bring in items to be repaired, please find more information along with the appointment signup link on the official Fix-It Clinic webpage: https://www.flagstaff.az.gov/3231/Fix-it-Clinic\n\n2026-08-22 | 10:00 AM - 2:00 PM\n\nLocation: Joe C Montoya Community & Senior Center\n\nCategory: Special Event\n\n• Fix-It Clinic Assist - See \"Activity Description\" (14 spots available)\n• Fix-It Clinic Lead - See \"Activity Description\" (10 spots available)",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2026-08-22"
        ),
        Opportunity4(
            opportunityName: "Fix-it Clinic (2/4)",
            description: "At Fix-it Clinics, we support sustainable consumption and divert waste from landfills by repairing items that would otherwise end up in the trash. Our incredible team of volunteers can help you fix almost anything, including electronics, jewelry, clothing, bicycles, and more! \r\n\r\nLead Volunteers will:\r\n• Use hand tools and small power tools to repair everyday household items such as electronics, bicycles, kitchen appliances, jewelry, clothing, furniture, lamps, and more.\r\n• Wear appropriate personal protective equipment (PPE).\r\n• Ensure workstations are maintained in a clean and organized manner to reduce exposure to chemicals, open electric circuits, and sharp objects or projections.\r\n\r\nOther Volunteers will:\r\n• Assist with the community member check-in process.\r\n• Complete necessary “Fix-It” paperwork, which identifies if an item was fixed or was unrepairable.\r\n• Assist with diagnosing items. \r\n\r\nFix-It Clinics reduce the amount of waste going to the landfill, encourage responsible consumption, teach community members real-world skills, and build connections between Flagstaff residents.\r\n\r\nIf you are looking to bring in items to be repaired, please find more information along with the appointment signup link on the official Fix-It Clinic webpage: https://www.flagstaff.az.gov/3231/Fix-it-Clinic\n\n2026-11-07 | 10:00 AM - 2:00 PM\n\nLocation: Joe C Montoya Community & Senior Center\n\nCategory: Special Event\n\n• Fix-It Clinic Assist - See \"Activity Description\" (14 spots available)\n• Fix-It Clinic Lead - See \"Activity Description\" (10 spots available)",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2026-11-07"
        ),
        Opportunity4(
            opportunityName: "Fix-it Clinic (3/4)",
            description: "At Fix-it Clinics, we support sustainable consumption and divert waste from landfills by repairing items that would otherwise end up in the trash. Our incredible team of volunteers can help you fix almost anything, including electronics, jewelry, clothing, bicycles, and more! \r\n\r\nLead Volunteers will:\r\n• Use hand tools and small power tools to repair everyday household items such as electronics, bicycles, kitchen appliances, jewelry, clothing, furniture, lamps, and more.\r\n• Wear appropriate personal protective equipment (PPE).\r\n• Ensure workstations are maintained in a clean and organized manner to reduce exposure to chemicals, open electric circuits, and sharp objects or projections.\r\n\r\nOther Volunteers will:\r\n• Assist with the community member check-in process.\r\n• Complete necessary “Fix-It” paperwork, which identifies if an item was fixed or was unrepairable.\r\n• Assist with diagnosing items. \r\n\r\nFix-It Clinics reduce the amount of waste going to the landfill, encourage responsible consumption, teach community members real-world skills, and build connections between Flagstaff residents.\r\n\r\nIf you are looking to bring in items to be repaired, please find more information along with the appointment signup link on the official Fix-It Clinic webpage: https://www.flagstaff.az.gov/3231/Fix-it-Clinic\n\n2027-02-06 | 10:00 AM - 2:00 PM\n\nLocation: Joe C Montoya Community & Senior Center\n\nCategory: Special Event\n\n• Fix-It Clinic Assist - See \"Activity Description\" (14 spots available)\n• Fix-It Clinic Lead - See \"Activity Description\" (10 spots available)",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2027-02-06"
        ),
        Opportunity4(
            opportunityName: "Fix-it Clinic (4/4)",
            description: "At Fix-it Clinics, we support sustainable consumption and divert waste from landfills by repairing items that would otherwise end up in the trash. Our incredible team of volunteers can help you fix almost anything, including electronics, jewelry, clothing, bicycles, and more! \r\n\r\nLead Volunteers will:\r\n• Use hand tools and small power tools to repair everyday household items such as electronics, bicycles, kitchen appliances, jewelry, clothing, furniture, lamps, and more.\r\n• Wear appropriate personal protective equipment (PPE).\r\n• Ensure workstations are maintained in a clean and organized manner to reduce exposure to chemicals, open electric circuits, and sharp objects or projections.\r\n\r\nOther Volunteers will:\r\n• Assist with the community member check-in process.\r\n• Complete necessary “Fix-It” paperwork, which identifies if an item was fixed or was unrepairable.\r\n• Assist with diagnosing items. \r\n\r\nFix-It Clinics reduce the amount of waste going to the landfill, encourage responsible consumption, teach community members real-world skills, and build connections between Flagstaff residents.\r\n\r\nIf you are looking to bring in items to be repaired, please find more information along with the appointment signup link on the official Fix-It Clinic webpage: https://www.flagstaff.az.gov/3231/Fix-it-Clinic\n\n2027-05-08 | 10:00 AM - 2:00 PM\n\nLocation: Joe C Montoya Community & Senior Center\n\nCategory: Special Event\n\n• Fix-It Clinic Assist - See \"Activity Description\" (14 spots available)\n• Fix-It Clinic Lead - See \"Activity Description\" (10 spots available)",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2027-05-08"
        ),
        Opportunity4(
            opportunityName: "Drop-Off Day",
            description: "Drop-Off Day connects residents with safe, free, and convenient disposal and recycling services for household hazardous waste and other hard-to-recycle materials. Through community partnerships, the events divert waste from the landfill, protect public health and the environment, and makes responsible disposal more accessible. We need help from volunteers to help keep the event running smoothly. \r\n\r\nVolunteer position and roles include:\r\n(1) Greeters:\r\n- Count the number of vehicles (using a clicker),  \r\n- Provide directions to community members based on the items they brought. (Example: the e-waste vendor is at the fourth station around the bend.)   \r\n- Provide community members with waste diversion outreach materials.  \r\n- Help answer any questions if time allows. \r\n\r\n(2) Material Collection\r\n- Assist with lifting items out of vehicles and placing them in the correct bin/area, as directed by station lead.\r\n\r\n(3) Traffic Control\r\n- Keep traffic moving safely.\r\n- Direct vehicles to drop-off location.\r\n\r\n(4) Rover/Floater\r\n- Collect small drop-off items from vehicles to reduce traffic.\r\n- Relieve other volunteers for breaks.\n\n2026-10-24 | 10:00 AM - 2:00 PM\n\nLocation: Coconino County Health and Human Services\n\nCategory: Special Event\n\n• Drop-Off Day - Rover/Floater (2 spots available)\n• Drop-Off Day - Material Collection (6 spots available)\n• Drop-Off Day - Traffic Control (3 spots available)\n• Drop-Off Day - Greeter (1 spots available)",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2026-10-24"
        ),
        Opportunity4(
            opportunityName: "Open Spaces Commission meeting",
            description: "This is a regularly-scheduled Open Spaces Commission meeting, to which the public is involved. Click \"Volunteer\" if you're a Commissioner, or click on \"Sign Up\" if you'd like to participate. For more information and for a link to the agenda, visit https://www.flagstaff.az.gov/3327/Open-Spaces-Commission. This meeting is a field visit, and we'll meet at the Thorpe Bark Park and carpool up to Observatory Mesa Natural Preserve.\n\n2026-10-26 | 3:30 PM - 6:00 PM\n\nLocation: Thorpe Park\n\n• ALL Parks, Recreation, Open Space & Events Volunt - Open Spaces Commission meeting (12 spots available)",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2026-10-26"
        ),
        Opportunity4(
            opportunityName: "Garden Maintenance Volunteer Day - Hal Jensen (1/5)",
            description: "7/21/26 has been cancelled due to rain\r\nGarden volunteer days are a great way to become directly involved in your local community garden, interact with other gardeners, and ensure the gardens continue to thrive in further years. Each volunteer day includes a variety of activities that support the overall health of the gardens. These may range from essential maintenance tasks such as turning compost, weeding, and caring for communal plots to hands-on learning experiences and creative, garden inspired projects. Whether you're looking to build gardening skills, meet new people, or simply spend time outdoors giving back to your community, volunteer days provide something for everyone!\n\n2026-06-16 | 4:00 PM - 6:00 PM\n\nLocation: Hal Jensen Recreation Center Garden\n\nCategory: Gardening\n\n• Community Gardens - Garden Volunteer (0 spots available)\n• Community Steward - Maintenance Steward Lead (0 spots available)",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2026-06-16"
        ),
        Opportunity4(
            opportunityName: "Garden Maintenance Volunteer Day - Hal Jensen (2/5)",
            description: "7/21/26 has been cancelled due to rain\r\nGarden volunteer days are a great way to become directly involved in your local community garden, interact with other gardeners, and ensure the gardens continue to thrive in further years. Each volunteer day includes a variety of activities that support the overall health of the gardens. These may range from essential maintenance tasks such as turning compost, weeding, and caring for communal plots to hands-on learning experiences and creative, garden inspired projects. Whether you're looking to build gardening skills, meet new people, or simply spend time outdoors giving back to your community, volunteer days provide something for everyone!\n\n2026-07-21 | 4:00 PM - 6:00 PM\n\nLocation: Hal Jensen Recreation Center Garden\n\nCategory: Gardening\n\n• Community Gardens - Garden Volunteer (0 spots available)\n• Community Steward - Maintenance Steward Lead (0 spots available)",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2026-07-21"
        ),
        Opportunity4(
            opportunityName: "Garden Maintenance Volunteer Day - Hal Jensen (3/5)",
            description: "7/21/26 has been cancelled due to rain\r\nGarden volunteer days are a great way to become directly involved in your local community garden, interact with other gardeners, and ensure the gardens continue to thrive in further years. Each volunteer day includes a variety of activities that support the overall health of the gardens. These may range from essential maintenance tasks such as turning compost, weeding, and caring for communal plots to hands-on learning experiences and creative, garden inspired projects. Whether you're looking to build gardening skills, meet new people, or simply spend time outdoors giving back to your community, volunteer days provide something for everyone!\n\n2026-08-18 | 4:00 PM - 6:00 PM\n\nLocation: Hal Jensen Recreation Center Garden\n\nCategory: Gardening\n\n• Community Gardens - Garden Volunteer (0 spots available)\n• Community Steward - Maintenance Steward Lead (0 spots available)",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2026-08-18"
        ),
        Opportunity4(
            opportunityName: "Garden Maintenance Volunteer Day - Hal Jensen (4/5)",
            description: "7/21/26 has been cancelled due to rain\r\nGarden volunteer days are a great way to become directly involved in your local community garden, interact with other gardeners, and ensure the gardens continue to thrive in further years. Each volunteer day includes a variety of activities that support the overall health of the gardens. These may range from essential maintenance tasks such as turning compost, weeding, and caring for communal plots to hands-on learning experiences and creative, garden inspired projects. Whether you're looking to build gardening skills, meet new people, or simply spend time outdoors giving back to your community, volunteer days provide something for everyone!\n\n2026-09-15 | 4:00 PM - 6:00 PM\n\nLocation: Hal Jensen Recreation Center Garden\n\nCategory: Gardening\n\n• Community Gardens - Garden Volunteer (0 spots available)\n• Community Steward - Maintenance Steward Lead (0 spots available)",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2026-09-15"
        ),
        Opportunity4(
            opportunityName: "Garden Maintenance Volunteer Day - Hal Jensen (5/5)",
            description: "7/21/26 has been cancelled due to rain\r\nGarden volunteer days are a great way to become directly involved in your local community garden, interact with other gardeners, and ensure the gardens continue to thrive in further years. Each volunteer day includes a variety of activities that support the overall health of the gardens. These may range from essential maintenance tasks such as turning compost, weeding, and caring for communal plots to hands-on learning experiences and creative, garden inspired projects. Whether you're looking to build gardening skills, meet new people, or simply spend time outdoors giving back to your community, volunteer days provide something for everyone!\n\n2026-10-20 | 4:00 PM - 6:00 PM\n\nLocation: Hal Jensen Recreation Center Garden\n\nCategory: Gardening\n\n• Community Gardens - Garden Volunteer (0 spots available)\n• Community Steward - Maintenance Steward Lead (0 spots available)",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2026-10-20"
        ),
        Opportunity4(
            opportunityName: "Tourism Service Day - Fall",
            description: "Join the City of Flagstaff, Discover Flagstaff, and the Sustainability Office for our Fall 2026 Tourism Service Day! Meet at the Milligan House (323 W Aspen Ave) to check in, receive supplies, and attend a brief safety talk before walking to the site to begin our clean-up. Supplies will be provided, please come prepared with sun protection, water, close toed shoes, and anything else you need to have a successful event. After the clean-up, join us for a thank you lunch provided by Discover Flagstaff!\n\n2026-10-21 | 10:00 AM - 11:30 AM\n\nLocation: Milligan House (323 W Aspen Ave)\n\nCategory: Trash Clean-Up\n\n• ALL Flagstaff Volunteers - Tourism Service Day Cleanup Volunteers (48 spots available)",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2026-10-21"
        ),
        Opportunity4(
            opportunityName: "Honoring Our Ancenstral Roots through Food",
            description: "Volunteers are needed to assist with set-up, event support, and clean-up!\r\n\r\nThe City of Flagstaff will host an Indigenous Peoples Day celebration on Monday, Oct. 12, 2026. The event, titled “Honoring Our Ancestral Roots Through Food”, will take place from 9 a.m. to 2:30 p.m. and will feature Phefelia Nez, a Food for Life Instructor. The event will also include a spotlight on Hosava Kretzmann, an athlete who has qualified for the 2028 U.S. Olympic Marathon Trials, and other presentations. \r\n\r\nThe event is free and open to the public. Lunch will be served to attendees. The event will be held at the Elks Lodge (2101 N San Francisco St.) and an event schedule will be posted on the City’s website. A limited number of vendor spots are available for $40 per space. \r\n\r\nFor any related questions or for additional information on vendor spots, please contact Rose Toehe, City of Flagstaff Indigenous Affairs Administrator at Rose.Toehe@flagstaffaz.gov. \n\n2026-10-12 | 8:00 AM - 3:00 PM\n\nLocation: Elks Lodge\n\n• ALL Flagstaff Volunteers - Set-Up (2 spots available)\n• ALL Flagstaff Volunteers - Event Assistants (3 spots available)\n• ALL Flagstaff Volunteers - Clean Up (4 spots available)",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2026-10-12"
        ),
        Opportunity4(
            opportunityName: "Full Moon Hike",
            description: "PROSE - Open Space hosts a full moon walk (and sometimes bike ride) on one of our beautiful Open Space properties--a different spot each month. We start about a half-hour before the moon rises, walk on either a loop trail or out-and-back, and watch the full moon rise. Come check out your open spaces, and meet new people! Check each month for specific starting time, meeting place, and what trail we'll walk/ride for that full moon. Wear sturdy shoes, dress for the weather, and bring a red-light flashlight and hiking poles, but we'll have extras! This month, we'll walk the McMillan Mesa Loop Trail, starting at the buffalo statue at Buffalo Park, and hiking counter-clockwise (down toward Jay Lively, cross Forest Ave, join the Sunset Trail toward BASIS school, then onto the McMillan Mesa Loop trail back to Buffalo Park. It is about 2.5 miles with one uphill but mostly flat.\n\n2026-10-25 | 4:45 PM - 7:00 PM\n\nLocation: McMillan Mesa Natural Area\n\nCategory: Full  Moon Hike Winter\n\n• ALL Flagstaff Volunteers - Help keeping the group together (1 spots available)",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2026-10-25"
        ),
        Opportunity4(
            opportunityName: "Garden Maintenance Volunteer Day - Southside (1/5)",
            description: "Garden volunteer days are a great way to become directly involved in your local community garden, interact with other gardeners, and ensure the gardens continue to thrive in further years. Each volunteer day includes a variety of activities that support the overall health of the gardens. These may range from essential maintenance tasks such as turning compost, weeding, and caring for communal plots to hands-on learning experiences and creative, garden inspired projects. Whether you're looking to build gardening skills, meet new people, or simply spend time outdoors giving back to your community, volunteer days provide something for everyone!\n\n2026-06-09 | 4:00 PM - 6:00 PM\n\nLocation: Southside Community Garden\n\nCategory: Gardening\n\n• Community Gardens - Garden Volunteer (0 spots available)\n• Community Steward - Maintenance Steward Lead (0 spots available)",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2026-06-09"
        ),
        Opportunity4(
            opportunityName: "Garden Maintenance Volunteer Day - Southside (2/5)",
            description: "Garden volunteer days are a great way to become directly involved in your local community garden, interact with other gardeners, and ensure the gardens continue to thrive in further years. Each volunteer day includes a variety of activities that support the overall health of the gardens. These may range from essential maintenance tasks such as turning compost, weeding, and caring for communal plots to hands-on learning experiences and creative, garden inspired projects. Whether you're looking to build gardening skills, meet new people, or simply spend time outdoors giving back to your community, volunteer days provide something for everyone!\n\n2026-07-14 | 4:00 PM - 6:00 PM\n\nLocation: Southside Community Garden\n\nCategory: Gardening\n\n• Community Gardens - Garden Volunteer (0 spots available)\n• Community Steward - Maintenance Steward Lead (0 spots available)",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2026-07-14"
        ),
        Opportunity4(
            opportunityName: "Garden Maintenance Volunteer Day - Southside (3/5)",
            description: "Garden volunteer days are a great way to become directly involved in your local community garden, interact with other gardeners, and ensure the gardens continue to thrive in further years. Each volunteer day includes a variety of activities that support the overall health of the gardens. These may range from essential maintenance tasks such as turning compost, weeding, and caring for communal plots to hands-on learning experiences and creative, garden inspired projects. Whether you're looking to build gardening skills, meet new people, or simply spend time outdoors giving back to your community, volunteer days provide something for everyone!\n\n2026-08-11 | 4:00 PM - 6:00 PM\n\nLocation: Southside Community Garden\n\nCategory: Gardening\n\n• Community Gardens - Garden Volunteer (0 spots available)\n• Community Steward - Maintenance Steward Lead (0 spots available)",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2026-08-11"
        ),
        Opportunity4(
            opportunityName: "Garden Maintenance Volunteer Day - Southside (4/5)",
            description: "Garden volunteer days are a great way to become directly involved in your local community garden, interact with other gardeners, and ensure the gardens continue to thrive in further years. Each volunteer day includes a variety of activities that support the overall health of the gardens. These may range from essential maintenance tasks such as turning compost, weeding, and caring for communal plots to hands-on learning experiences and creative, garden inspired projects. Whether you're looking to build gardening skills, meet new people, or simply spend time outdoors giving back to your community, volunteer days provide something for everyone!\n\n2026-09-08 | 4:00 PM - 6:00 PM\n\nLocation: Southside Community Garden\n\nCategory: Gardening\n\n• Community Gardens - Garden Volunteer (0 spots available)\n• Community Steward - Maintenance Steward Lead (0 spots available)",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2026-09-08"
        ),
        Opportunity4(
            opportunityName: "Garden Maintenance Volunteer Day - Southside (5/5)",
            description: "Garden volunteer days are a great way to become directly involved in your local community garden, interact with other gardeners, and ensure the gardens continue to thrive in further years. Each volunteer day includes a variety of activities that support the overall health of the gardens. These may range from essential maintenance tasks such as turning compost, weeding, and caring for communal plots to hands-on learning experiences and creative, garden inspired projects. Whether you're looking to build gardening skills, meet new people, or simply spend time outdoors giving back to your community, volunteer days provide something for everyone!\n\n2026-10-13 | 4:00 PM - 6:00 PM\n\nLocation: Southside Community Garden\n\nCategory: Gardening\n\n• Community Gardens - Garden Volunteer (0 spots available)\n• Community Steward - Maintenance Steward Lead (0 spots available)",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2026-10-13"
        ),
        Opportunity4(
            opportunityName: "Open Space Working Group meeting",
            description: "Come meet with Open Space Stewards, and get updates on Flagstaff Open Space's projects at Picture Canyon, McMillan Mesa, and Observatory Mesa Natural Preserves!\n\n2026-10-14 | 10:30 AM - 12:00 PM\n\nLocation: White Dove Coffee Shop\n\nCategory: Stewardship",
            link: "https://volunteer.flagstaffaz.gov/Calendar",
            date: "2026-10-14"
        )
    ]
                        
    @State private var selectedItemID: Opportunity4.ID?
    @State private var searchText = ""
    
    private var searchedOpportunities : [Opportunity4] {
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
                Text("City of Flagstaff")
                    .bold()
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle((Color(red: 232/255, green: 169/255, blue: 57/255)))
            }
            .frame(maxWidth: .infinity)
            .background(Color(red: 4/255, green: 28/255, blue: 69/255))
            
            
            
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .leading, spacing: 12){
                    Text("Opportunities Near You  \(Image(systemName:"mappin.and.ellipse"))")                        .font(.title2)
                        .foregroundStyle(Color.blue.gradient)
                        .background(Color(red: 4/255, green: 28/255, blue: 69/255))
                    
                    TextField("Search Opportunities...", text: $searchText)
                        .textFieldStyle(.roundedBorder)
                    
                        
                    
                    List(
                        searchedOpportunities,
                        selection: $selectedItemID
                    ) { opportunity in
                        Text(opportunity.opportunityName)
                            .padding(30)
                            .font(.system(size: 14, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .contentShape(Rectangle())
                            .tag(opportunity.id)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    Divider()
                    
                    
                }
                
                .padding()
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(Color(red: 4/255, green: 28/255, blue: 69/255))
                Divider()
                
                VStack {
                    ScrollView{
                        if let selectedItemID,
                           let item = CityOfFlagstaffView.opportunities.first(
                               where: { $0.id == selectedItemID }
                           ) {
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
                                
                                Link("Email the City of Flagstaff", destination: URL(string: "mailto:Blake.Commisso@flagstaffaz.gov")!)
                                    .padding()
                                    .buttonStyle(.borderedProminent)
                                    
                            }
                            .padding(.leading, 15)

                        }
                        
                        
                        else{
                            Text("Select an opportunity to view more details")
                                .padding()
                                .foregroundColor(.gray)
                                .background(Color(red: 4/255, green: 28/255, blue: 69/255))
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
    CityOfFlagstaffView()
}





