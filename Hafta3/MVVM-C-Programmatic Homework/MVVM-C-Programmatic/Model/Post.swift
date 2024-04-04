//
//  Post.swift
//  MVVM-C-Programmatic
//
//  Created by Kerim Çağlar on 31.03.2024.
//

import Foundation

struct Post: Decodable {
    let id: Int?
    let userId: Int?
    let title: String?
    let body: String?
}
