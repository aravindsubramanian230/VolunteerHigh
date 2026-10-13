//
//  WelcomePage.swift
//  VolunteerSearch
//
//  Created by Aravind Subramanian on 5/16/26.
//

import SwiftUI

let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]

struct WelcomePage: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: gradientColors,
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 150, height: 150)
                            .foregroundStyle(.tint)
                        Image(systemName: "magnifyingglass.circle")
                            .font(.system(size: 78))
                            .foregroundStyle(.white)
                    }

                    Text("Welcome to Volunteer Search")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top)

                    NavigationLink {
                        #if os(iOS)
                        FeaturesPage()
                        #else
                        MainScreen()
                        #endif
                    } label: {
                        Text("Next")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.tint, in: RoundedRectangle(cornerRadius: 12))
                            .foregroundStyle(.white)
                    }
                    .padding(.top)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
            }
            .navigationDestination(for: Navigation.self) { route in
                switch route {
                case .features:
                    #if os(iOS)
                    FeaturesPage()
                    #else
                    MainScreen()
                    #endif
                case .home:
                    #if os(iOS)
                    HomeScreen()
                    #else
                    MainScreen()
                    #endif

                case .handsOn:
                    HandsOnGreaterPhoenixView()
                }
            }
        }
        
        
    }
}

struct WelcomeScreen: App{
    var body: some Scene {
        WindowGroup{
            WelcomePage()
        }
    }
}

#Preview {
    WelcomePage()
}
