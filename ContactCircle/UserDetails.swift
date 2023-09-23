//
//  UserDetails.swift
//  ContactCircle
//
//  Created by Maria Sandu on 23.09.2023.
//

import SwiftUI

struct UserDetails: View {
    let user: UserData
    
    var body: some View {
        List {
            Section {
                VStack {
                    HStack {
                        Image(systemName: "person.and.background.dotted")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.trailing)
                            .frame(width: 70, height: 70)
                            .foregroundColor(.mint)
                        Text(user.name)
                        Spacer()
                        Text("Age: \(String(user.age))")
                    }
                    .padding()
                    Text("Joined: \(user.registered, style: .date)")
                }
            } header: {
                Text("User")
            }
            
            Section {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "mail")
                            .foregroundColor(.mint)
                        Text("Address: \(user.address)")
                            .padding(.vertical)
                    }
                    HStack {
                        Image(systemName: "bag")
                            .foregroundColor(.mint)
                        Text(user.company)
                            .padding(.vertical)
                    }
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.mint)
                        Text("Email: \(user.email)")
                            .padding(.vertical)
                    }
                }
            } header: {
                Text("Contact")
            }
            
            Section {
                Text(user.about)
                
            } header: {
                Text("About")
            }
            Section {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(user.friends) { friend in
                            VStack(alignment: .leading) {
                                Image(systemName: user.isActive ? "person.fill.checkmark" : "person.fill.xmark")
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.trailing)
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.mint)
                                
                                VStack {
                                    Text(friend.name)
                                        .font(.headline)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            } header: {
                Text("Friends")
            }
        }
        .listStyle(.grouped)
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserDetails_Previews: PreviewProvider {
    static var previews: some View {
        UserDetails(user: UserData.mockUser)
        
    }
}
