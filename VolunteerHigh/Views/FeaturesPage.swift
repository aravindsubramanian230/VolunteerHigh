//
//  ONLY FOR iOS
//  FeaturesPage.swift
//  VolunteerSearch
//
//  Created by Aravind Subramanian on 5/16/26.
//

import SwiftUI


#if os(iOS)
    struct FeaturesPage: View {
        var body: some View {
            ZStack{
                LinearGradient(
                    colors: gradientColors,
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                
                VStack(spacing: 30){
                    Spacer()
                    
                    Text("Volunteer Find")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.bottom)
                        .padding(.top, 100)
                    
                    FeatureCard(iconName: "map", description: "Volunteer Find is an app developed to help discover volunteering opportunities near you.")
                    
                    FeatureCard(iconName: "graduationcap", description: "Made for high school students in Arizona")
                    
                    Spacer()
                    
                    NavigationLink(value: Navigation.home) {
                        Text("Next")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.tint, in: RoundedRectangle(cornerRadius: 12))
                            .foregroundStyle(.white)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }

    #Preview {
        NavigationStack{
            FeaturesPage()
                .frame(maxHeight: .infinity)
                .background(Gradient(colors: gradientColors))
                .foregroundStyle(.white)
        }
    }

#endif
