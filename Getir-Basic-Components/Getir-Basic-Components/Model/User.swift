//
//  User.swift
//  Getir-Basic-Components
//
//  Created by Kerim Çağlar on 24.03.2024.
//

import Foundation

struct User: Decodable {
    let id: Int?
    let name: String?
    let username: String?
    let email: String?
    let company: Company?
}

struct Company: Decodable {
    let name: String?
}
