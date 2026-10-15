//
//  QuestView.swift
//  VolunteerSearch
//
//  Created by Aravind Subramanian on 6/18/26.
//

import SwiftUI
import FirebaseAI


struct ChatMessage: Identifiable, Equatable {
    let id = UUID()
    var sender: Sender
    let text: String
    
    enum Sender {
        case user
        case ai
    }
}



struct QuestView: View {
    var model : GenerativeModel {
        let fileContents: String
        if let fileURL = Bundle.main.url(
            forResource: "HandsOnGreaterPhoenix",
            withExtension: "json"
        ),
           let contents = try? String(contentsOf: fileURL, encoding: .utf8) {
            fileContents = contents
        } else {
            fileContents = "[]"
        }
        
        let systemInstruction = """
            You are Quest AI, a friendly volunteer recommendation engine.
            Here is the database of volunteer opportunities with full descriptions, locations, dates, and times: 
            
            Rules:
            1. Greet the user warmly and request them to share their passion or location. (Note: The UI pre-populates this greeting).
            2. Once provided, search the entire database (all 8 organizations and their opportunities) to recommend the single best opportunity. Provide key details like dates , times, descriptions, and which organization they chose.
            3. The user can then ask follow-up questions (e.g. 'why?', 'tell me more', or details about the schedule). Answer them accurately.
            4. Keep answers conversational, warm, and breif.
            
            Only take opportunities from this project's database (Only from HandsOn Greater Phoenix, the City of Flagstaff, Arizona Sustainability Alliance, Arizona State Parks and Trails, Junior Achievement of Arizona, Feed My Starving Children, Bureau of Land Management Arizona, and Lost our Home Pet rescue). Make sure that you tell the user exactly which organziation the opportunity is from.
            """
        
        
        
        let systemInstructionText = systemInstruction + "\n\(fileContents)"
        
        return FirebaseAI.firebaseAI(backend: .googleAI())
            .generativeModel(
                modelName: "gemini-3.5-flash-lite",
                systemInstruction: ModelContent(role: "system", parts: systemInstructionText)
            )
    }
    
    @State private var userPrompt = ""
    @State private var messages: [ChatMessage] = [ChatMessage(sender: .ai, text: "Hi! I'm Quest AI. Tell me your interests and location, and I will find the best volunteer opportunity near you!")]
    @State private var chatSession: Chat? = nil
    @State private var isLoading = false
    
    var body: some View {
        ZStack{
            Color(red: 253/255, green: 251/255, blue: 245/255)
                .ignoresSafeArea()
            VStack{
                Text("Quest AI")
                    .foregroundStyle(Color(red: 21/255, green: 44/255, blue: 91/255))
                    .font(.custom("CormorantGaramond-Regular", size: 40))
                    .bold()
                    .padding(.top)
                
                ScrollViewReader{ scrollProxy in
                    ScrollView {
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(Array(messages.enumerated()), id: \.element.id) { _, message in
                                HStack {
                                    if message.sender == .user {
                                        Spacer()
                                        Text(message.text)
                                            .padding()
                                            .background(Color.blue)
                                            .foregroundColor(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 16))
                                        
                                        Image(systemName: "person.crop.circle.fill")
                                            .font(.title2)
                                            .foregroundColor(.blue)
                                        
                                        
                                    } else {
                                        Image(systemName: "sparkles")
                                            .font(.title2)
                                            .foregroundStyle(.purple)
                                            .symbolEffect(.rotate, isActive: isLoading)
                                        
                                        Text(message.text)
                                            .padding()
                                            .background(Color.gray.opacity(0.2))
                                            .foregroundStyle(Color(red: 21/255, green: 44/255, blue: 91/255))
                                            .clipShape(RoundedRectangle(cornerRadius: 16))
                                        Spacer()
                                    }
                                }
                                
                                .id(message.id)
                            }
                        }
                        .padding()
                        
                    }
                    .onChange(of: messages.count) {
                        if let lastMessage = messages.last {
                            withAnimation {
                                scrollProxy.scrollTo(lastMessage.id, anchor: .bottom)
                            }
                        }
                        
                    }
                    
                    .safeAreaInset(edge: .bottom) {
                    HStack(spacing: 12) {
                        ZStack(alignment: .leading) {
                            TextField("", text: $userPrompt)
                                .foregroundColor(.black)
                                .padding(.vertical, 20)
                                .padding(.horizontal, 16)
                                .frame(minHeight: 50)
                                .background(Color.white)
                                .foregroundStyle(.black)
                                .textFieldStyle(.plain)
                                .cornerRadius(28)
                                .onSubmit {
                                    if !userPrompt.isEmpty && !isLoading {
                                        sendMessage()
                                    }
                                }

                            if userPrompt.isEmpty {
                                Text("Ask Quest AI...")
                                    .foregroundStyle(.gray)
                                    .padding(.horizontal, 16)
                                    .allowsHitTesting(false)
                            }
                        }
                        Button {
                            sendMessage()
                        } label: {
                            Image(systemName: isLoading ? "ellipsis": "paperplane.fill")
                                .font(.title3)
                                .bold()
                        }
                        .padding(.trailing, 4)
                        .foregroundColor(Color(red: 21/255, green: 44/255, blue: 91/255))
                        .disabled(userPrompt.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || isLoading)
                    }
                    .padding()
                    .background(Color(red: 253/255, green: 251/255, blue: 245/255))
                    
                    
                }
                
                                    
                    
                   
                    
                }
            }
        }
        
    }
        
        func sendMessage() {
            let prompt = userPrompt.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !prompt.isEmpty, !isLoading else {
                return
            }

            userPrompt = ""
            isLoading = true
            
            messages.append(ChatMessage(sender: .user, text: prompt))
            
            Task {
                defer {
                    isLoading = false
                }

                do{
                    if chatSession == nil {
                        chatSession = model.startChat()
                    }
                    
                    guard let chat = chatSession else{
                        messages.append(
                            ChatMessage(
                                sender: .ai,
                                text: "Quest AI couldn't start a conversation. Please try again."
                            )
                        )
                        return
                    }
                    let response = try await chat.sendMessage(prompt)
                    if let responseText = response.text {
                        messages.append(ChatMessage(sender: .ai, text: responseText))
                    }
                }
                catch{
                    let nsError = error as NSError
                    print("Quest AI error:", nsError)
                    print("Quest AI error details:", nsError.userInfo)
                    messages.append(
                        ChatMessage(
                            sender: .ai,
                            text: "Quest AI couldn't connect. Please try again."
                        )
                    )
                }
            }
            
            
        }
    }

    
#Preview {
    QuestView()
}




