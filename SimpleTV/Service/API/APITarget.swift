//
//  APITarget.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 05.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import Foundation
import Moya

protocol APITarget: TargetType {
    
}

extension APITarget {
    
    var baseURL: URL {
        return Configuration.requiredEndpoint
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return [:]
    }
}
