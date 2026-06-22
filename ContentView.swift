import SwiftUI
import AppKit
import CoreText


    
enum Navigation: Hashable {
    case features
    case home
    case handsOn
}

private enum AppFontRegistrar {
    static func registerFonts(_ fontFiles: [String]) {
        for fontFile in fontFiles {
            guard let fontURL = Bundle.main.url(forResource: fontFile, withExtension: nil) else {
                print("Missing font resource: \(fontFile)")
                continue
            }

            var registrationError: Unmanaged<CFError>?
            CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, &registrationError)
        }
    }
}


@main
struct VolunteerSearchApp: App {

        @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

        init() {
            AppFontRegistrar.registerFonts([
                "CormorantGaramond-Regular.ttf",
                "PlayfairDisplay-Regular.ttf"
            ])
        }

        var body: some Scene {

            WindowGroup {

                WelcomePage()

                    .preferredColorScheme(.dark)
                    .toolbarBackground(.black)

            }

        }

    }
    




struct HomeScreen: View {
    var body: some View {
        #if os(iOS)
        ScrollView {
            HStack(spacing: 10) {
                VStack(spacing: 10) {
                    
                    
                    NavigationLink(value: Navigation.handsOn) {
                        HomeScreenComponents(orgName: "HandsOn Greater Phoenix")
                    }
                    .buttonStyle(.plain)
                    
                    HomeScreenComponents(orgName: "Arizona State Parks and Trails")
                    HomeScreenComponents(orgName: "City of Flagstaff")
                    HomeScreenComponents(orgName: "Junior Achievement of Arizona")
                    HomeScreenComponents(orgName: "Feed My Starving Children")
                    HomeScreenComponents(orgName: "Arizona Sustainability Alliance Team")
                    HomeScreenComponents(orgName: "Lost Our Home Pet Rescue")
                    HomeScreenComponents(orgName: "Bureau of Land Management Arizona")
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        #else
        MainScreen()
        #endif
    }
}



        
                



struct MainScreen: View {
    let item1 = HomeScreenComponents(orgName: "HandsOn Greater Phoenix")
    let item2 = HomeScreenComponents(orgName: "Arizona State Parks and Tails")
    let item3 = HomeScreenComponents(orgName: "City of Flagstaff")
    let item4 = HomeScreenComponents(orgName: "Junior Achievement of Arizona")
    let item5 = HomeScreenComponents(orgName: "Feed My Starving Children")
    let item6 = HomeScreenComponents(orgName: "Arizona Sustainability Alliance")
    let item7 = HomeScreenComponents(orgName: "Bureau of Land Management Arizona")
    let item8 = HomeScreenComponents(orgName: "Lost Our Home Pet Rescue")
    let finalNumber = 90.0
    let finalNumber2 = 100.0
    let finalNumber3=92.0
    
    @State private var animateCount = false
    @State private var animationStartDate = Date()
    @State private var isVisible = false
    @State private var isClicked = false
    @State private var scrollLocked = false
    @State private var hasUserScrolled = false
    @State private var showQuestSection = false
    
    
    
    var body: some View{
        
        ScrollViewReader { proxy in
            
            
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
                    
                    NavigationLink {
                        Maps()
                    } label: {
                        Text("Maps")
                    }
                    .buttonStyle(.plain)
                    .focusable(false)
                    
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
                ScrollView(.vertical, showsIndicators: true) {
                    LazyVStack(spacing: 0) {
                        ZStack(alignment: .leading){
                            
                            Image("Image")
                                .resizable()
                                .frame(width: 1474, height: 1149)
                            
                                .ignoresSafeArea(edges: .leading)
                                .ignoresSafeArea(edges: .trailing)
                            
                            
                            HStack{
                                VStack(alignment: .leading, spacing: 16){
                                    Text("Discover Meaningful")
                                        .font(.custom("PlayfairDisplay-Regular", size: 55))
                                        .foregroundStyle(.white)
                                        .bold()
                                        .padding(.top, 385)
                                        .padding(.leading, 30)
                                    
                                    Text("Student Service")
                                        .font(.custom("PlayfairDisplay-Regular", size: 55))
                                        .foregroundColor(Color(red: 74/255, green: 144/255, blue: 226/255))
                                        .foregroundStyle(.white)
                                        .bold()
                                        .padding(.top, -10)
                                        .padding(.leading, 30)
                                    
                                    Text("Together, we can make a lasting\nimpact and build a better tomorrow\nfor those in need")
                                    
                                        .font(.system(size: 18))
                                        .tracking(1)
                                        .padding(.leading, 30)
                                    
                                    
                                    
                                    
                                    Spacer()
                                }
                            }
                            
                            
                            
                            
                            
                            
                            
                            
                        }
                        //.frame(height: 900)
                        // .clipped()
                        
                        VStack(alignment: .leading, spacing: 10){
                            
                            
                            
                            VStack(alignment: .leading, spacing: 16){
                                
                                VStack(alignment: .leading, spacing: 5){
                                    
                                    
                                    Text("The VolunteerHigh Project")
                                        .font(.custom("PlayfairDisplay-Regular", size: 51))
                                        .padding(.top, 60)
                                        .padding(.leading, 205)
                                    
                                    Text("A platform that empowers students to find, explore, and engage in")
                                        .font(.system(size: 18.6))
                                        .padding(.top, 10)
                                        .padding(.bottom, 10)
                                        .padding(.leading, 207)
                                    
                                    Text("meaningful local volunteer opportunities while creating lasting community impact.")
                                        .font(.system(size: 18.6))
                                        .padding(.bottom, 55)
                                        .padding(.leading, 207)
                                        .onScrollVisibilityChange(threshold: 0.8) {
                                            if $0 && !animateCount {
                                                animationStartDate = Date();
                                                animateCount = true
                                            }
                                        }
                                    
                                    
                                    
                                    HStack(alignment: .top) {
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("――――――")
                                                .foregroundStyle(.yellow)
                                            
                                            TimelineView(.animation) { context in
                                                let elapsed = animateCount ? context.date.timeIntervalSince(animationStartDate) : 0
                                                let progress = min(elapsed / 1.5, 1)
                                                let current = Int(progress * finalNumber)
                                                
                                                Text("\(current)%+")
                                                    .font(.system(size: 75, weight: .semibold, design: .monospaced))
                                                    .foregroundColor(.white)
                                            }
                                            
                                            Text("of students participated in volunteer\nwork before entering\ncollege")
                                                .font(.system(size: 14.1))
                                        }
                                        
                                        Spacer()
                                        
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("――――――")
                                                .foregroundStyle(.yellow)
                                            
                                            TimelineView(.animation) { context in
                                                let elapsed = animateCount ? context.date.timeIntervalSince(animationStartDate) : 0
                                                let progress = min(elapsed / 1.5, 1)
                                                let current = Int(progress * Double(finalNumber2))
                                                
                                                Text("\(current)+")
                                                    .font(.system(size: 75, weight: .semibold, design: .monospaced))
                                                    .foregroundColor(.white)
                                            }
                                            
                                            Text("volunteering hours by the\naverage high schooler before\ngraduating.")
                                                .font(.system(size: 14.1))
                                        }
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("――――――")
                                                .foregroundStyle(.yellow)
                                            
                                            TimelineView(.animation) { context in
                                                let elapsed = animateCount ? context.date.timeIntervalSince(animationStartDate) : 0
                                                let progress = min(elapsed / 1.5, 1)
                                                let current = Int(progress * finalNumber3)
                                                
                                                Text("\(current)%+")
                                                    .font(.system(size: 75, weight: .semibold, design: .monospaced))
                                                    .foregroundColor(.white)
                                            }
                                            
                                            Text("of admissions officers\nvalue 4-year volunteering")
                                                .font(.system(size: 14.1))
                                        }
                                        
                                    }
                                    .padding(.leading, 205)
                                    .padding(.trailing, 205)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 30)
                                .padding(.bottom, 165)
                                .background(Color(red: 4/255, green: 28/255, blue: 69/255))
                                
                                
                                
                                
                                HStack{
                                    Rectangle()
                                        .fill(Color(red: 21/255, green: 44/255, blue: 91/255))
                                        .frame(height: 2)
                                    
                                    Text("Our Partner Organizations")
                                        .foregroundStyle(Color(red: 21/255, green: 44/255, blue: 91/255))
                                    
                                        .font(.custom("CormorantGaramond-Regular", size: 40))
                                    
                                        .lineLimit(1)
                                    
                                        .fixedSize(horizontal: true, vertical: false)
                                    
                                        .multilineTextAlignment(.center)
                                    
                                        .padding(.horizontal, 15)
                                    
                                    
                                    
                                    
                                    Rectangle()
                                        .fill(Color(red: 21/255, green: 44/255, blue: 91/255))
                                        .frame(height: 2)
                                    
                                }
                                .id("partners")
                                .foregroundStyle(.black)
                                .padding(.horizontal, 75)
                                .padding(.vertical, 40)
                                .onScrollVisibilityChange(threshold: 0.2) {
                                    if $0 && !isVisible {
                                        isVisible = true
                                    }
                                }
                                
                                HStack(spacing: 10){
                                    NavigationLink {
                                        HandsOnGreaterPhoenixView()
                                    } label: {
                                        BoxLayout(data: item1, imageName: "HandsOnGreaterPhoenixLogo")
                                    }
                                    .buttonStyle(.plain)
                                    .foregroundStyle(.primary)
                                    .tint(.primary)
                                    .staggeredBoxAnimation(isVisible: isVisible, index: 0)
                                    
                                    
                                    NavigationLink {
                                        ArizonaStateParksandTrailsView()
                                    } label: {
                                        BoxLayout(data: item2, imageName: "AZStateParksandTrailsLogo")
                                    }
                                    .buttonStyle(.plain)
                                    .foregroundStyle(.primary)
                                    .tint(.primary)
                                    .staggeredBoxAnimation(isVisible: isVisible, index: 1)
                                    
                                    
                                    NavigationLink{
                                        CityOfFlagstaffView()
                                    } label: {
                                        BoxLayout(data: item3, imageName: "CityOfFlagstaffLogo")
                                    }
                                    .buttonStyle(.plain)
                                    .foregroundStyle(.primary)
                                    .tint(.primary)
                                    .staggeredBoxAnimation(isVisible: isVisible, index: 2)
                                    
                                    
                                    
                                    NavigationLink{
                                        JuniorAchievementOfArizonaView()
                                    } label: {
                                        BoxLayout(data: item4, imageName: "JuniorAchievementOfArizonaLogo")
                                    }
                                    .buttonStyle(.plain)
                                    .foregroundStyle(.primary)
                                    .tint(.primary)
                                    .staggeredBoxAnimation(isVisible: isVisible, index: 3)
                                    
                                }
                                
                                
                                
                                
                                HStack(spacing: 10){
                                    NavigationLink{
                                        FeedMyStarvingChildrenView()
                                    } label: {
                                        BoxLayout(data: item5, imageName: "FMSCLogo")
                                    }
                                    .buttonStyle(.plain)
                                    .foregroundStyle(.primary)
                                    .tint(.primary)
                                    .staggeredBoxAnimation(isVisible: isVisible, index: 4)
                                    
                                    
                                    NavigationLink {
                                        AZSustainabilityAllianceView()
                                        
                                    } label: {
                                        BoxLayout(data: item6, imageName: "AZSustainabilityAllianceLogo")
                                    }
                                    .buttonStyle(.plain)
                                    .foregroundStyle(.primary)
                                    .tint(.primary)
                                    .staggeredBoxAnimation(isVisible: isVisible, index: 5)
                                    
                                    
                                    NavigationLink{
                                        BureauOfLandManagementView()
                                        
                                    } label: {
                                        BoxLayout(data: item7, imageName: "BureauOfLandManagement")
                                    }
                                    .buttonStyle(.plain)
                                    .foregroundStyle(.primary)
                                    .tint(.primary)
                                    .staggeredBoxAnimation(isVisible: isVisible, index: 6)
                                    
                                    NavigationLink{
                                        LostOurHomesPetRescueView()
                                    } label: {
                                        BoxLayout(data: item8, imageName: "LostOurHomesPetRescueImageLogo")
                                    }
                                    .buttonStyle(.plain)
                                    .foregroundStyle(.primary)
                                    .tint(.primary)
                                    .staggeredBoxAnimation(isVisible: isVisible, index: 7)
                                }
                                
                                .padding(.bottom, 100)
                            }
                            
                            Color.clear
                                .frame(height: 1)
                                .id("partnersBottom")
                            
                            
                            
                            
                            Group {
                                
                                ZStack{
                                    Color(red: 253/255, green: 251/255, blue: 245/255)
                                    
                                    VStack(alignment: .leading, spacing: 25){
                                        
                                        Text("Quest - Our Volunteering Recommendation Engine")
                                            .foregroundStyle(Color(red: 21/255, green: 44/255, blue: 91/255))
                                        
                                            .font(.custom("CormorantGaramond-Regular", size: 40))
                                        
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                            .padding(.bottom, 13.5)
                                        
                                            .padding(.leading, -3)
                                        
                                        Text("Quest in an intelligent Volunteer Recommendation engine helps you to find the best volunteering opportunities tailored to your\ninterests and location. By analyzing your preferences and matching them with relevant organizations, Quest simplifies the search process and makes\ncommunity involvement more accessible. Quest is designed to help you find the best volunteer opportunities where you can\nmake the greatest impact while supporting a cause that geniunely matters to you.")
                                            .foregroundStyle(Color(red: 40/255, green: 71/255, blue: 114/255))
                                            .multilineTextAlignment(.leading)
                                            .lineSpacing(6)
                                            .padding(.bottom, 13.5)
                                            .font(.system(size: 18.6))
                                        
                                        
                                        NavigationLink {
                                            QuestView()
                                        } label: {
                                            Text("Use Quest")
                                                .font(.system(size: 20))
                                                .foregroundStyle(Color(red: 21/255, green: 44/255, blue: 91/255))
                                                .padding(.vertical, 45)
                                                .padding(.horizontal, 175)
                                                .background(isClicked ? Color(red: 219/255, green: 231/255, blue: 243/255) : Color.clear)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .stroke(Color(red: 21/255, green: 44/255, blue: 91/255), lineWidth: 1.5)
                                                )
                                        }
                                        .buttonStyle(.plain)
                                        .padding(.leading, -3)
                                        .onHover {
                                            isClicked = $0
                                        }
                                        .animation(.easeInOut(duration: 1.0), value: isClicked)
                                        
                                        
                                        
                                        
                                        
                                        
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 205)
                                    .padding(.top, 100)
                                    .padding(.bottom, 200)
                                    .scrollTransition{ content, phase in
                                        content.opacity(phase.isIdentity ? 1: 0).offset(y: phase.isIdentity ? 0 : 50)
                                    }
                                }
                            }
                        }
                        
                        .background(Color(red: 255/255, green: 249/255, blue: 228/255)) //DON
                        
                        
                        
                        
                        
                        
                        
                        Group{
                            Color(red: 253/255, green: 251/255, blue: 245/255)
                            
                            VStack(alignment: .leading, spacing: 25){
                                
                                Text("Maps")
                                    .foregroundStyle(Color(red: 255/255, green: 255/255, blue: 255/255))
                                
                                    .font(.custom("CormorantGaramond-Regular", size: 40))
                                
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                    .padding(.bottom, 13.5)
                                
                                    .padding(.leading, -3)
                                
                                Text("Want to find the nearest opportunity, and fast? Maps is our location-based volunteer discovery tool that helps\nyou to find the nearest opportunity. By displaying nearby opportunities on an interactive map, Maps makes it easy\nto explore opportunities based on your current location and identify places where you can get involved. Maps simplifies\nthe process of finding local volunteer opportunities, helping you connect with organizations in your community and make a\nmeaningful impact close to your home, while earning verified hours.")
                                    .foregroundStyle(Color(red: 255/255, green: 255/255, blue: 114/255))
                                    .multilineTextAlignment(.leading)
                                    .lineSpacing(6)
                                    .padding(.bottom, 13.5)
                                    .font(.system(size: 18.6))
                                
                                
                                NavigationLink {
                                    Maps()
                                } label: {
                                    Text("Use Maps")
                                        .font(.system(size: 20))
                                        .foregroundStyle(Color(red: 255/255, green: 255/255, blue: 255/255))
                                        .padding(.vertical, 45)
                                        .padding(.horizontal, 175)
                                    //.background(isClicked ? Color(red: 219/255, green: 231/255, blue: 243/255) : Color.clear)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(red: 255/255, green: 255/255, blue: 255/255), lineWidth: 1.5)
                                        )
                                }
                                .buttonStyle(.plain)
                                .padding(.leading, -3)
                                .onHover {
                                    isClicked = $0
                                }
                                .animation(.easeInOut(duration: 1.0), value: isClicked)
                                
                                
                                
                                
                                
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 205)
                            .padding(.top, 100)
                            .padding(.bottom, 200)
                            .scrollTransition{ content, phase in
                                content.opacity(phase.isIdentity ? 1: 0).offset(y: phase.isIdentity ? 0 : 50)
                            }
                            
                            .background(Color(red: 0/255, green: 0/255, blue: 0/255)) //DON
                        }
                        
                        
                    }
                    
                    .scrollDisabled(scrollLocked)
                    .onScrollPhaseChange { _, newPhase in
                        if newPhase == .tracking || newPhase == .interacting || newPhase == .decelerating {
                            hasUserScrolled = true
                        }
                    }
                    
                    
                }
            }
        }
        
    }
    
}
    
        
        struct BoxLayout: View{
            let data: HomeScreenComponents
            let imageName: String
            
            
            
            var body: some View{
                VStack{
                    if imageName == "FMSCLogo"{
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 150)
                        
                            .padding(8)
                        
                        Text(data.orgName)
                            .foregroundStyle(.black)
                    }
                    else if imageName == "BureauOfLandManagement" {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 150)
                            .padding()
                        
                        Text(data.orgName)
                            .foregroundStyle(.black)
                    }
                    else if imageName == "AZStateParksandTrailsLogo"{
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 150)
                            .padding()
                        
                        Text(data.orgName)
                            .foregroundStyle(.black)
                    }
                    else if imageName == "LostOurHomesPetRescueImageLogo"{
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 150)
                            .padding()
                        
                        Text(data.orgName)
                            .foregroundStyle(.black)
                    }
                    
                    else{
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 150)
                            .clipShape(Circle())
                            .clipped()
                        
                            .padding()
                        
                        Text(data.orgName)
                            .foregroundStyle(.black)
                    }
                    
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .background(Color.gray.gradient)
                .border(Color.gray, width: 2)
                .cornerRadius(8)
                
                
                
                
                
                
                
                
                
                
                
            }
        }
        
        
        
        
        
        
        struct HomeScreenComponents : View{
            let orgName: String
            
            var body: some View{
                VStack{
                    Text(orgName)
                        .foregroundStyle(.primary)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .border(.gray, width: 0.15)
                    
                    
                }
                
            }
        }
        
    
        
    




struct StaggeredBoxAnimation: ViewModifier {
    let isVisible: Bool
    let index: Int
    
    func body(content: Content) -> some View{
        content
            .opacity(isVisible ? 1 : 0)
            .rotation3DEffect(.degrees(isVisible ? 0: -75), axis: (x: 0, y: 1, z: 0), perspective: 0.7)
            .offset(y: isVisible ? 0 : 35)
            .scaleEffect(isVisible ? 1 : 0.92)
            .animation(
                .spring(response: 0.55, dampingFraction: 0.75)
                .delay(Double(index) * 0.28),
                value: isVisible
            )
        
        
    }

    
    
    
}

struct CountingTextModifier: ViewModifier, Animatable {
    var number: Double
    
    var animatableData: Double {
        get { number }
        set { number = newValue }
    }
        
        func body(content: Content) -> some View {
            Text("\(Int(number))%")
        }
        
        
    }
    










extension View {
    func staggeredBoxAnimation(isVisible: Bool, index: Int) -> some View {
        modifier(StaggeredBoxAnimation(isVisible: isVisible, index: index))
    }
}



extension View {
    func countingText(value: Double) -> some View {
        self.modifier(CountingTextModifier(number: value))
    }
    
    
}





















#Preview {
    MainScreen()
}
