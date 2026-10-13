//
//  FeatureCard.swift
//  VolunteerSearch
//
//  Created by Aravind Subramanian on 5/16/26.
//

import SwiftUI

struct FeatureCard: View {
    let iconName: String
    let description: String
    
    var body: some View {
        HStack{
            Image(systemName: iconName)
                .font(.largeTitle)
                .frame(width: 50)
                .padding(.trailing, 10)
            
            Text(description)
            
            Spacer()
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.tint)
                .opacity(0.25)
                .brightness(-0.4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundStyle(.white)
        
    }
    
}

#Preview {
    FeatureCard(iconName: "map", description: "Volunteer Find is an app developed to help you find volunteering opportunities near you.")
}
