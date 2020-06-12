//
//  GitRepoAPI.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 05.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import Foundation
import Foundation
import Moya

enum GitRepoAPI{
    case getAllRepo
}
extension GitRepoAPI: APITarget{
    
    var path: String {
        switch self {
        case  .getAllRepo:
            return "/orgs/square/repos"
        }
    }
    
    var task: Task {
        switch self {
        case .getAllRepo:
            return  Task.requestPlain
        }
    }
}
