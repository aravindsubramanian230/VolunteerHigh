//
//  WelcomePage.swift
//  VolunteerSearch
//
//  Created by Aravind Subramanian on 5/16/26.
//

import SwiftUI

let gradientColors2: [Color] = [
    .gradientTop,
    .gradientBottom
]

struct RecommendationEngine: View {
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
                    
                    Text("Which opportunity is best for you?")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top)
                    
                    NavigationLink(value: Navigation.features) {
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
        }
    }
}
#Preview {
    RecommendationEngine()
}
