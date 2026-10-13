//
//  About.swift
//  VolunteerSearch
//
//  Created by Aravind Subramanian on 6/20/26.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
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
                
                Text("About")
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
                    ZStack(alignment: .leading) {
                        Image("Image2")
                            .resizable()
                            .frame(width: 1474, height: 920)
                            .ignoresSafeArea(edges: .leading)
                            .ignoresSafeArea(edges: .trailing)
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Our Mission")
                                    .font(.custom("PlayfairDisplay-Regular", size: 55))
                                    .foregroundStyle(Color(red: 74/255, green: 144/255, blue: 226/255))
                                    .bold()
                                    .padding(.top, 385)
                                    .padding(.leading, 30)
                                
                                Text("With the right tools and access to meaningful opportunities,\nany student can make a difference. VolunteerHigh empowers\nstudents to connect with\ncauses they care about, building lasting community\nimpact and growing service.")
                                    .lineSpacing(6)
                                    .font(.system(size: 18))
                                    .tracking(1)
                                    .padding(.leading, 30)
                                
                                Spacer()
                            }
                        }
                    }
                    
                    VStack(alignment: .center, spacing: 22) {
                        HStack {
                            Rectangle()
                                .fill(Color.yellow)
                                .frame(height: 2)
                            
                            Text("About VolunteerHigh")
                                .font(.custom("CormorantGaramond-Regular", size: 44))
                                .foregroundStyle(.white)
                                .fixedSize(horizontal: true, vertical: false)
                                .padding(.horizontal, 15)
                            
                            Rectangle()
                                .fill(Color.yellow)
                                .frame(height: 2)
                        }
                        
                        Text("Created By A Student, for Students.\n\nVolunteerHigh is a platform designed to help high school students in Arizona discover meaningful volunteer opportunities\n in their lcoal communities. Finding volunteer work can be difficult, with opportunities scattered across different websites and organizations.\nVolunteerHigh simplifies this process by displaying various organizations in one place.")
                            .foregroundStyle(Color.yellow)
                            .font(.custom("CormorantGaramond-Regular", size: 28))
                            .lineSpacing(6)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 205)
                    .padding(.top, 80)
                    .padding(.bottom, 260)
                    .background(Color(red: 4/255, green: 28/255, blue: 69/255))
                }
            }
        }
    }
}

#Preview {
    AboutView()
}
