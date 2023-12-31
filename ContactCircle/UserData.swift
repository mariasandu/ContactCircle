//
//  UserData.swift
//  ContactCircle
//
//  Created by Maria Sandu on 22.09.2023.
//

import Foundation

struct UserData: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [FriendData]
    
    static var mockUser: UserData {
        .init(id: "asghagd", isActive: true, name: "Maria", age: 23, company: "Emids", email: "test@gmail.com", address: "Cluj", about: "This is a description", registered: Date(), tags: ["tag1", "tag2"], friends: [FriendData.mockFriend])
    
    }
}

