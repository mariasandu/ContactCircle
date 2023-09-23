//
//  DataController.swift
//  ContactCircle
//
//  Created by Maria Sandu on 23.09.2023.
//

import Foundation

class DataManager: ObservableObject {
    @Published var usersData: [UserData] = []

    func loadData() async {
        guard usersData.isEmpty else { return }

        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? decoder.decode([UserData].self, from: data) {
//                 Task.detached {
//                    DispatchQueue.main.async {
                        self.usersData = decodedResponse
                    }
//                }
//            }
            
        } catch {
            print("Invalid Data")
        }
    }
}
