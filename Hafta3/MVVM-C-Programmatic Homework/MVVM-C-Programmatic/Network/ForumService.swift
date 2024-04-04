//
//  ForumService.swift
//  MVVM-C-Programmatic
//
//  Created by Kerim Çağlar on 31.03.2024.
//

import Foundation

enum ForumService {
    case getUsers
    case getUserPosts(_ userId: Int)
    case getPostComments(_ postId: Int)
}
