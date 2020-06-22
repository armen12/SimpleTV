//
//  GitData.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 05.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import Foundation
import RealmSwift
import DifferenceKit

struct GitRepoModel: Codable{
    var name: String?
    var description: String?
    var fullName: String?
    var createAt: String?
    var updateAt: String?
    var owner: Owner
    var isSelectedCell = false
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

class RealmGitRepoModel: Object, Codable{
    @objc dynamic var name: String? = nil
  @objc dynamic var descriptionss: String? = nil
    @objc dynamic var fullName: String? = nil
    @objc dynamic var createAt: String? = nil
    @objc dynamic var updateAt: String? = nil
    @objc dynamic var owner: RealmOwner?
    override static func primaryKey() -> String? {
        return "name"
    }

    enum CodingKeys: String, CodingKey {
        case name, owner
        case fullName = "full_name"
        case createAt = "created_at"
        case updateAt = "updated_at"
        case descriptionss = "description"
    }
    
}
class RealmOwner: Object,  Codable{
    @objc dynamic var avatarURL: String? = nil
    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
    }
}
extension RealmGitRepoModel: Differentiable{}
extension RealmOwner: Differentiable{}



