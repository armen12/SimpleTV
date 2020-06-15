//
//  GitData.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 05.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import Foundation
struct GitRepoModel: Codable{
    var name: String?
    var description: String?
    var fullName: String?
    var createAt: String?
    var updateAt: String?
    var owner: Owner
//    var isSelectedCell = false
    enum CodingKeys: String, CodingKey {
        case name, description, owner
        case fullName = "full_name"
        case createAt = "created_at"
        case updateAt = "updated_at"
    }
    
    struct Owner: Codable{
        let avatarURL: String?
        enum CodingKeys: String, CodingKey {
            case avatarURL = "avatar_url"
        }
    }
}
