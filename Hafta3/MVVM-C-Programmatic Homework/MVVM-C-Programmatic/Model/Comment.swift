//
//  Comment.swift
//  MVVM-C-Programmatic
//
//  Created by Kerim Çağlar on 31.03.2024.
//

import Foundation

struct Comment: Decodable {
    let id: Int?
    let postId: Int?
    let name: String?
    let email: String?
    let body: String?
}
