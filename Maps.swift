//
//  Maps.swift
//  VolunteerSearch
//
//  Created by Aravind Subramanian on 6/20/26.
//

import SwiftUI
import MapKit

struct VolunteerLocation: Identifiable, Hashable {
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    var id: String {
        "\(name)-\(coordinate.latitude)-\(coordinate.longitude)"
    }
    
    static func == (lhs: VolunteerLocation, rhs: VolunteerLocation) -> Bool {
        lhs.id == rhs.id
    }
}

struct Maps: View {
    
    let coordinates = [
        VolunteerLocation(name: "TopGolf Competition - Gilbert", coordinate: CLLocationCoordinate2D(latitude: 33.320189, longitude: -111.74155)),
        VolunteerLocation(name: "Grief Peer Support Group Facilitators for Kids & Caregivers", coordinate: CLLocationCoordinate2D(latitude: 33.679308, longitude: -112.225847)),
        VolunteerLocation(name: "Heart of Isaac Community Center - Food Distribution", coordinate: CLLocationCoordinate2D(latitude: 33.464236, longitude: -112.126860)),
        VolunteerLocation(name: "From the Ground Up: Volunteer Day at the Ranch", coordinate: CLLocationCoordinate2D(latitude: 33.372848, longitude: -112.036277)),
        VolunteerLocation(name: "August 2026 Monthly Park Cleanup and Stinknet Removal - Kiwanis Park", coordinate: CLLocationCoordinate2D(latitude: 33.366737, longitude: -111.935198)),
        VolunteerLocation(name: "Chef's Night Off at HomeBase", coordinate: CLLocationCoordinate2D(latitude: 33.497095, longitude: -112.061546)),
        VolunteerLocation(name: "August 2026 #TrashTag Cleanup and Stinknet Removal - Tempe Town Lake", coordinate: CLLocationCoordinate2D(latitude: 33.432562, longitude: -111.921013)),
        VolunteerLocation(name: "Thrift Shop Assistants at Hope's Closet", coordinate: CLLocationCoordinate2D(latitude: 33.451498, longitude: -112.356531)),
        VolunteerLocation(name: "Administrative Tasks - Tempe Office", coordinate: CLLocationCoordinate2D(latitude: 33.393317, longitude: -111.948852)),
        VolunteerLocation(name: "Lost Our Homes Pet Rescue", coordinate: CLLocationCoordinate2D(latitude: 33.403296, longitude: -111.951717)),
        VolunteerLocation(name: "Full Moon Bike Ride/Hike!", coordinate: CLLocationCoordinate2D(latitude: 35.206000, longitude: -111.655000)),
        VolunteerLocation(name: "Garden Maintenance Volunteer Day - Bonito", coordinate: CLLocationCoordinate2D(latitude: 35.204000, longitude: -111.653150)),
        VolunteerLocation(name: "Garden Maintenance Volunteer Day - Southside", coordinate: CLLocationCoordinate2D(latitude: 35.188051, longitude: -111.646597)),
        VolunteerLocation(name: "Invasive Weed Identification, Removal & Reseeding", coordinate: CLLocationCoordinate2D(latitude: 35.227632, longitude: -111.557224)),
        VolunteerLocation(name: "Full Moon Hike - Mars Hill Trail", coordinate: CLLocationCoordinate2D(latitude: 35.209960, longitude: -111.680370)),
        VolunteerLocation(name: "Jerome State Historic Park", coordinate: CLLocationCoordinate2D(latitude: 34.753647, longitude: -112.111248)),
        VolunteerLocation(name: "Picacho Peak State Park", coordinate: CLLocationCoordinate2D(latitude: 32.646409, longitude: -111.394838)),
        VolunteerLocation(name: "Rockin' River Ranch State Park", coordinate: CLLocationCoordinate2D(latitude: 34.503340, longitude: -111.830419)),
        VolunteerLocation(name: "Catalina State Park", coordinate: CLLocationCoordinate2D(latitude: 32.418141, longitude: -110.935255)),
        VolunteerLocation(name: "Red Rock State Park", coordinate: CLLocationCoordinate2D(latitude: 34.839628, longitude: -111.780522)),
        VolunteerLocation(name: "Volunteer Opportunity", coordinate: CLLocationCoordinate2D(latitude: 33.363980, longitude: -111.954203))
    ]
    
    @State private var address = ""
    @State private var camera: MapCameraPosition = .automatic
    @State private var travelTime = ""
    @State private var selected: VolunteerLocation?
    @State private var navigated = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0) {
                HStack(spacing: 42) {
                    NavigationLink {
                        MainScreen()
                    } label: {
                        Image("VolunteerHighLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 518, height: 100)
                            .offset(x : -160)
                    }
                    .buttonStyle(.plain)
                .focusable(false)
                    
                    Spacer()
                    
                    NavigationLink {
                        QuestView()
                    } label: {
                        Text("Quest AI")
                    }
                    .buttonStyle(.plain)
                    .focusable(false)
                    
                    Text("Maps")
                    
                    NavigationLink {
                        AboutView()
                    } label: {
                        Text("About")
                    }
                    .buttonStyle(.plain)
                    .focusable(false)
                    
                    NavigationLink {
                        FAQView()
                    } label: {
                        Text("FAQ's")
                    }
                    .buttonStyle(.plain)
                    .focusable(false)
                }
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.white)
                .padding(.trailing, 160)
                .padding(.leading, 0)
                .frame(maxWidth: .infinity)
                .frame(height: 72)
                .background(Color.black)
                
                ZStack(alignment: .topLeading) {
                Map(position: $camera, selection: $selected) {
                    ForEach(coordinates) { location in
                        let marker = (selected == location) ? location.name : ""
                        Marker(marker, coordinate: location.coordinate)
                            .tag(location)
                    }
                    .annotationTitles(.visible)
                }
                .mapControls {
                    MapUserLocationButton()
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    TextField("Address", text: $address)
                        .textFieldStyle(.roundedBorder)
                        .controlSize(.large)
                        .frame(height: 40)
                    
                    Button("Find Nearest Opportunity") {
                        let req = MKLocalSearch.Request()
                        req.naturalLanguageQuery = address
                        
                        MKLocalSearch(request: req).start { res, _ in
                            guard let userItem = res?.mapItems.first else { return }
                            let userCoord = userItem.location.coordinate
                            guard let closest = coordinates.min(by: {
                                MKMapPoint($0.coordinate).distance(to: MKMapPoint(userCoord)) < MKMapPoint($1.coordinate).distance(to: MKMapPoint(userCoord))
                            }) else {
                                return
                            }
                            
                            DispatchQueue.main.async {
                                selected = closest
                                camera = .region(MKCoordinateRegion(center: closest.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))
                            }
                            
                            let dirReq = MKDirections.Request()
                            dirReq.source = res?.mapItems.first
                            dirReq.destination = MKMapItem(
                                location: CLLocation(latitude: closest.coordinate.latitude, longitude: closest.coordinate.longitude),
                                address: MKAddress(fullAddress: closest.name, shortAddress: closest.name)
                            )
                            dirReq.transportType = .automobile
                            
                            MKDirections(request: dirReq).calculate { routeRes, _ in
                                if let time = routeRes?.routes.first?.expectedTravelTime {
                                    DispatchQueue.main.async {
                                        travelTime = "\(closest.name): \(Int(time / 60)) minutes away"
                                    }
                                }
                            }
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    
                    if !travelTime.isEmpty {
                        Text(travelTime)
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(.leading, 4)
                    }
                }
                .frame(width: 320)
                .padding(.leading, 20)
                .padding(.top, 87)
                .background(Color.clear)
            }
            .sheet(item: $selected) { location in
                VStack(spacing: 15) {
                    Text(location.name)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                    
                    Button("Click to View Organization") {
                        navigated = true
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .presentationDetents([.height(150)])
            }
            .frame(minWidth: 1000, minHeight: 1000)
            .toolbarBackgroundVisibility(.hidden, for: .windowToolbar)
            
            
            .navigationDestination(isPresented: $navigated) {
                if let location =  selected {
                    if HandsOnGreaterPhoenixView.contains(name: location.name){
                        HandsOnGreaterPhoenixView()
                    }
                    else if ArizonaStateParksandTrailsView.contains(name: location.name) {
                        ArizonaStateParksandTrailsView()
                    }
                    else if AZSustainabilityAllianceView.contains(name: location.name) {
                        AZSustainabilityAllianceView()
                    }
                    else if BureauOfLandManagementView.contains(name: location.name) {
                        BureauOfLandManagementView()
                    }
                    else if CityOfFlagstaffView.contains(name: location.name) {
                        CityOfFlagstaffView()
                    }
                    else if FeedMyStarvingChildrenView.contains(name: location.name) {
                        FeedMyStarvingChildrenView()
                    }
                    else if LostOurHomesPetRescueView.contains(name: location.name) {
                        LostOurHomesPetRescueView()
                    }
                    else {
                        EmptyView()
                    }

                    
                }
        
                
            }
            }
        }
    }
}

extension CLLocationCoordinate2D: @retroactive Hashable, @retroactive Equatable, @retroactive Identifiable {
    public var id: String {
        "\(latitude)-\(longitude)"
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
    
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}

#Preview {
    Maps()
}
