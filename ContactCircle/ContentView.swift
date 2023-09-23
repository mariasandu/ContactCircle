//
//  ContentView.swift
//  ContactCircle
//
//  Created by Maria Sandu on 22.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var usersData = [UserData]()
    
    var body: some View {
        NavigationView {
            List(usersData, id: \.id) { user in
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.headline)
                }
            }
            .task {
                await loadData()
            }
            .navigationTitle("Contact Circle")
        }
    }
    
    func loadData() async {
        guard usersData.isEmpty else { return }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        // For Date to be decoded use this decoding strategy
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? decoder.decode([UserData].self, from: data) {
                
                usersData = decodedResponse
            }
            
        } catch {
            print("Invalid Data")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


