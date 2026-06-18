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

            }

        }

    }
    var body: some Scene {
        WindowGroup {
            WelcomePage()
                .preferredColorScheme(.dark)
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

    
    var body: some View{
        
        ScrollView(.vertical, showsIndicators: true) {
            LazyVStack(spacing: 0) {
                
                Text("Volunteer Search")
                    .foregroundStyle(Color.primary)
                    .font(Font.largeTitle)
                    .font(.title).bold()
                    .padding()
                
                
                ZStack(alignment: .leading){
                    
                    Image("Image")
                        .resizable()
                        .frame(width: 1474, height: 1067)
                        .ignoresSafeArea(edges: .leading)
                        .ignoresSafeArea(edges: .trailing)
                    
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 16){
                            Text("Discover Meaningful")
                                .font(.custom("PlayfairDisplay-Regular", size: 45))
                                .foregroundStyle(.white)
                                .bold()
                                .padding(.top, 385)
                                .padding(.leading, 30)
                            
                            Text("Student Service")
                                .font(.custom("PlayfairDisplay-Regular", size: 50))
                                .foregroundColor(Color(red: 74/255, green: 144/255, blue: 226/255))
                                .foregroundStyle(.white)
                                .bold()
                                .padding(.leading, 30)
                            
                            Text("Together, we can make a lasting\nimpact and build a better tomorrow\nfor those in need")
                            
                                .font(.system(size: 18))
                                .tracking(1)
                                .padding(.leading, 30)
                            
                            
                            
                            
                            Spacer()
                        }
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                }
                
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
                                        withAnimation(.easeOut(duration: 0.6)) { isVisible = true }
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
                                //.frame(maxWidth:.infinity, alignment: .center)
                                .onScrollVisibilityChange(threshold: 1.0) { if $0 { withAnimation(.easeOut(duration: 0.6)) { isVisible = true } } }
                            
                            Rectangle()
                                    .fill(Color(red: 21/255, green: 44/255, blue: 91/255))
                                    .frame(height: 2)
                            
                        }
                        .foregroundStyle(.black)
                        .padding(.horizontal, 75)
                        .padding(.vertical, 40)
                            
                            HStack(spacing: 10){
                                NavigationLink {
                                    HandsOnGreaterPhoenix()
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
                        }
                    
                    .background(Color(red: 255/255, green: 249/255, blue: 228/255))
                        
                        
                        
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
                .delay(Double(index) * 0.42),
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










