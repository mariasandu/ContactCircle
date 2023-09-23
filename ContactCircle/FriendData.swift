//
//  FriendData.swift
//  ContactCircle
//
//  Created by Maria Sandu on 22.09.2023.
//

import Foundation

struct FriendData: Codable, Identifiable {
    let id: String
    let name: String
    
    static var mockFriend: FriendData {
        .init(id: "asghagd", name: "Maria")
    
    }
}
