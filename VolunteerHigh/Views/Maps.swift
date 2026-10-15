//
//  Maps.swift
//  VolunteerSearch
//
//  Created by Aravind Subramanian on 6/20/26.
//

import SwiftUI
import MapKit

struct VolunteerLocation: Identifiable, Hashable {
    let id: String
    let name: String
    let coordinate: CLLocationCoordinate2D

    static func == (lhs: VolunteerLocation, rhs: VolunteerLocation) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

private struct OpportunityMapCandidate {
    let id: String
    let name: String
    let locationQuery: String
    let fallbackCoordinate: CLLocationCoordinate2D
}

struct Maps: View {
    
    private static let phoenixFallback = CLLocationCoordinate2D(
        latitude: 33.4484,
        longitude: -112.0740
    )
    private static let flagstaffFallback = CLLocationCoordinate2D(
        latitude: 35.1983,
        longitude: -111.6513
    )
    private static let arizonaFallback = CLLocationCoordinate2D(
        latitude: 34.2744,
        longitude: -111.6602
    )
    private static let mesaFallback = CLLocationCoordinate2D(
        latitude: 33.4152,
        longitude: -111.8315
    )
    private static let klamathFallsFallback = CLLocationCoordinate2D(
        latitude: 42.2249,
        longitude: -121.7817
    )

    private static let opportunityCandidates: [OpportunityMapCandidate] = {
        var candidates: [OpportunityMapCandidate] = []

        candidates += HandsOnGreaterPhoenixView.opportunities.enumerated().map { index, opportunity in
            makeCandidate(
                organization: "handsOn",
                index: index,
                name: opportunity.opportunityName,
                description: opportunity.description,
                fallbackQuery: "Phoenix, Arizona",
                fallbackCoordinate: phoenixFallback
            )
        }

        candidates += CityOfFlagstaffView.opportunities.enumerated().map { index, opportunity in
            makeCandidate(
                organization: "flagstaff",
                index: index,
                name: opportunity.opportunityName,
                description: opportunity.description,
                fallbackQuery: "Flagstaff, Arizona",
                fallbackCoordinate: flagstaffFallback
            )
        }

        candidates += ArizonaStateParksandTrailsView.opportunities.enumerated().map { index, opportunity in
            makeCandidate(
                organization: "stateParks",
                index: index,
                name: opportunity.opportunityName,
                description: opportunity.description,
                fallbackQuery: "\(opportunity.opportunityName), Arizona",
                fallbackCoordinate: arizonaFallback
            )
        }

        candidates += JuniorAchievementOfArizonaView.opportunities.enumerated().map { index, opportunity in
            makeCandidate(
                organization: "juniorAchievement",
                index: index,
                name: opportunity.opportunityName,
                description: opportunity.description,
                fallbackQuery: "Junior Achievement of Arizona, Tempe, Arizona",
                fallbackCoordinate: phoenixFallback
            )
        }

        candidates += FeedMyStarvingChildrenView.opportunities.enumerated().map { index, opportunity in
            makeCandidate(
                organization: "feedMyStarvingChildren",
                index: index,
                name: opportunity.opportunityName,
                description: opportunity.description,
                fallbackQuery: "Feed My Starving Children, Mesa, Arizona",
                fallbackCoordinate: mesaFallback
            )
        }

        candidates += AZSustainabilityAllianceView.opportunities.enumerated().compactMap { index, opportunity in
            guard !opportunity.opportunityName.isEmpty else { return nil }
            return makeCandidate(
                organization: "sustainabilityAlliance",
                index: index,
                name: opportunity.opportunityName,
                description: opportunity.description,
                fallbackQuery: "Phoenix, Arizona",
                fallbackCoordinate: phoenixFallback
            )
        }

        candidates += BureauOfLandManagementView.opportunities.enumerated().map { index, opportunity in
            makeCandidate(
                organization: "bureauOfLandManagement",
                index: index,
                name: opportunity.opportunityName,
                description: opportunity.description,
                fallbackQuery: "Wood River Wetland, Oregon",
                fallbackCoordinate: klamathFallsFallback
            )
        }

        candidates += LostOurHomesPetRescueView.opportunities.enumerated().map { index, opportunity in
            makeCandidate(
                organization: "lostOurHomes",
                index: index,
                name: opportunity.opportunityName,
                description: opportunity.description,
                fallbackQuery: "2323 S Hardy Dr, Tempe, AZ 85282",
                fallbackCoordinate: phoenixFallback
            )
        }

        return candidates
    }()

    @State private var coordinates: [VolunteerLocation] = []
    @State private var isLoadingOpportunities = true
    
    @State private var address = ""
    @State private var camera: MapCameraPosition = .automatic
    @State private var travelTime = ""
    @State private var selected: VolunteerLocation?
    @State private var navigated = false

    private static func makeCandidate(
        organization: String,
        index: Int,
        name: String,
        description: String,
        fallbackQuery: String,
        fallbackCoordinate: CLLocationCoordinate2D
    ) -> OpportunityMapCandidate {
        OpportunityMapCandidate(
            id: "\(organization)-\(index)",
            name: name,
            locationQuery: nearestLocation(
                in: description,
                fallback: fallbackQuery
            ),
            fallbackCoordinate: fallbackCoordinate
        )
    }

    private static func nearestLocation(
        in description: String,
        fallback: String
    ) -> String {
        guard let locationRange = description.range(
            of: "Location:",
            options: .caseInsensitive
        ) else {
            return fallback
        }

        let locationText = description[locationRange.upperBound...]
        var locationLines: [String] = []

        for line in locationText.components(separatedBy: .newlines) {
            let trimmedLine = line.trimmingCharacters(in: .whitespacesAndNewlines)

            if trimmedLine.isEmpty {
                if !locationLines.isEmpty {
                    break
                }
                continue
            }

            let lowercasedLine = trimmedLine.lowercased()
            if lowercasedLine.hasPrefix("date:")
                || lowercasedLine.hasPrefix("dates:")
                || lowercasedLine.hasPrefix("time:")
                || lowercasedLine.hasPrefix("times:")
                || lowercasedLine.hasPrefix("category:")
                || lowercasedLine.hasPrefix("volunteers still needed:") {
                break
            }

            locationLines.append(trimmedLine)
            if locationLines.count == 2 {
                break
            }
        }

        let location = locationLines.joined(separator: ", ")
        let unusableLocationPhrases = [
            "multiple locations",
            "register to find",
            "revealed after registration",
            "location details"
        ]

        guard !location.isEmpty,
              !unusableLocationPhrases.contains(where: {
                  location.localizedCaseInsensitiveContains($0)
              }) else {
            return fallback
        }

        return location
    }

    @MainActor
    private func loadOpportunityCoordinates() async {
        guard coordinates.isEmpty else {
            isLoadingOpportunities = false
            return
        }

        let candidatesByLocation = Dictionary(
            grouping: Self.opportunityCandidates,
            by: \.locationQuery
        )

        var resolvedLocations: [VolunteerLocation] = []
        resolvedLocations.reserveCapacity(Self.opportunityCandidates.count)

        for (query, candidates) in candidatesByLocation {
            guard !Task.isCancelled else { return }

            let resolvedCoordinate = await Self.resolveCoordinate(for: query)
            for (index, candidate) in candidates.enumerated() {
                let baseCoordinate = resolvedCoordinate ?? candidate.fallbackCoordinate
                resolvedLocations.append(
                    VolunteerLocation(
                        id: candidate.id,
                        name: candidate.name,
                        coordinate: Self.separatedCoordinate(
                            from: baseCoordinate,
                            index: index,
                            count: candidates.count
                        )
                    )
                )
            }

            coordinates = resolvedLocations
        }

        coordinates.sort { $0.id < $1.id }
        isLoadingOpportunities = false
    }

    private static func separatedCoordinate(
        from coordinate: CLLocationCoordinate2D,
        index: Int,
        count: Int
    ) -> CLLocationCoordinate2D {
        guard count > 1 else { return coordinate }

        let angle = (Double(index) / Double(count)) * 2 * Double.pi
        let ring = Double(index / 12 + 1)
        let radius = 0.00035 * ring

        return CLLocationCoordinate2D(
            latitude: coordinate.latitude + sin(angle) * radius,
            longitude: coordinate.longitude + cos(angle) * radius
        )
    }

    private static func resolveCoordinate(
        for locationQuery: String
    ) async -> CLLocationCoordinate2D? {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = locationQuery
        request.resultTypes = [.address, .pointOfInterest]

        do {
            let response = try await MKLocalSearch(request: request).start()
            return response.mapItems.first?.location.coordinate
        } catch {
            return nil
        }
    }

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
                .task {
                    await loadOpportunityCoordinates()
                }

                if isLoadingOpportunities {
                    ProgressView("Loading opportunity locations…")
                        .padding()
                        .background(.regularMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    TextField("Address", text: $address)
                        .textFieldStyle(.roundedBorder)
                        .controlSize(.large)
                        .frame(height: 40)
                    
                    Button("Find Nearest Opportunity") {
                        let req = MKLocalSearch.Request()
                        req.naturalLanguageQuery = address + ", Arizona"
                        req.resultTypes = [.pointOfInterest, .address]
                        
                        MKLocalSearch(request: req).start { res, error in
                            print("MAPKIT ERROR:", error?.localizedDescription ?? "None", "RESULTS:", res?.mapItems.count ?? 0)
                            guard let userItem = res?.mapItems.first else { travelTime = "Address not found"; return }
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
