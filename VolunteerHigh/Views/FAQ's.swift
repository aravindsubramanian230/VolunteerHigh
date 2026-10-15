//
//  FAQ's.swift
//  VolunteerSearch
//
//  Created by Aravind Subramanian on 6/21/26.
//

import SwiftUI

struct FAQView: View {
    private let background = Color(red: 253/255, green: 251/255, blue: 245/255)
    private let navy = Color(red: 21/255, green: 44/255, blue: 91/255)
    
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
                
                NavigationLink {
                    AboutView()
                } label: {
                    Text("About")
                }
                .buttonStyle(.plain)
                .focusable(false)
                
                Text("FAQ's")
            }
            .font(.system(size: 18, weight: .medium))
            .foregroundStyle(.white)
            .padding(.trailing, 160)
            .padding(.leading, 0)
            .frame(maxWidth: .infinity)
            .frame(height: 72)
            .background(Color.black)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    HStack{
                        Rectangle()
                            .fill(navy)
                            .frame(height: 2)
                        
                        Text("FAQ's")
                            .foregroundStyle(navy)
                            .font(.custom("CormorantGaramond-Regular", size: 45))
                            .lineLimit(1)
                            .fixedSize(horizontal: true, vertical: false)
                            .padding(.horizontal, 15)
                        
                        Rectangle()
                            .fill(navy)
                            .frame(height: 2)
                    }
                    .padding(.horizontal, 75)
                    .padding(.vertical, 55)
                    
                    FAQRow(question: "Is VolunteerHigh Free?", answer: "Yes! VolunteerHigh is a completely free tool that can be used by anybody in Arizona.", navy: navy)
                    FAQRow(question: "Do I have to sign up to use VolunteerHigh?", answer: "No. VolunteerHigh requires no sign ups, though some opportunities require an account or aplication.", navy: navy)
                    FAQRow(question: "What organizations is VolunteerHigh partnered with?", answer: "VolunteerHigh is partnered with 8 organizations across the valley as of now.", navy: navy)
                    FAQRow(question: "Can I use VolunteerHigh in California?", answer: "No. VolunteerHigh is currently a platform designed only for students in Arizona.", navy: navy)
                    FAQRow(question: "How can I contact VolunteerHigh", answer: "Email VolunteerHighSupport@gmail.com", navy: navy)
                    FAQRow(question: "Where can I contact the organizations?", answer: "Here are our following partner organizations, and their contact information:\n\nArizona State Parks and Trails:\nPhone: (602) 542-7152\nEmail: crichards@azstateparks.gov\n\nHandsOnGreaterPhoenix:\nMain: 602.973.2212\nEmail: info@handsonphoenix.org\n\nCity of Flagstaff:\nEmail: Blake.Commisso@flagstaffaz.gov\n\nJunior Achievement of Arizona:\nEmail: taylors@jaaz.org\n\nFeed My Starving Children:\nEmail: info@fmsc.org\n\nArizona Sustainability Alliance:\nEmail: info@azsustain.org\n\nBureau of Land Management:\nEmail: elitchfield@az.go\n\nLost Our Home Pet Rescue:\nEmail: Volunteering@lostourhome.org", navy: navy)
                }
                .padding(.horizontal, 80)
            }
            .tint(navy)
            .background(background)
        }
        .background(background)
    }
}

struct FAQRow: View {
    let question: String
    let answer: String
    let navy: Color
    @State private var isOpen = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button {
                isOpen.toggle()
            } label: {
                HStack {
                    Text(question)
                    Spacer()
                    Text(isOpen ? "−" : "+")
                        .font(.system(size: 30))
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            
            if isOpen {
                Text(answer)
                    .font(.system(size: 18))
                    .lineSpacing(5)
            }
        }
        .foregroundStyle(navy)
        .font(.system(size: 23))
        .padding(.vertical, 20)
        .overlay(Divider(), alignment: .bottom)
    }
}

#Preview {
    FAQView()
}
