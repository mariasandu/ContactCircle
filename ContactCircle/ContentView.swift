//
//  ContentView.swift
//  ContactCircle
//
//  Created by Maria Sandu on 22.09.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var dataManager = DataManager()

    var body: some View {
        NavigationView {
            List(dataManager.usersData, id: \.id) { user in
                NavigationLink {
                    UserDetails(user: user)
                } label: {
                    HStack {
                        Image(systemName: user.isActive ? "person.fill.checkmark" : "person.fill.xmark")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.trailing)
                            .frame(width: 60, height: 60)
                            .foregroundColor(.mint)
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.company)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Contact Circle")
            .task {
                await dataManager.loadData()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


