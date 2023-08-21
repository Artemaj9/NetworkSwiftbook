//
//  User.swift
//  NetworkSwiftbook
//
//  Created by Artem on 21.08.2023.
//

import Foundation

struct User: Decodable {
    let id: Int
    let firstName: String
    let lastName: String
    let avatar: URL
    
    static let example = User(
        id: 2, firstName: "Jane",
        lastName: "Flower",
        avatar: URL(string: "https://reqres.in/img/faces/7-image.jpg")!)
}

struct UsersQuery: Decodable {
    let data: [User]
}
