//
//  Configuration.swift
//  SimpleTV
//
//  Created by Armen Nagapetyan on 05.06.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import Foundation
struct Configuration {
    
    static var production: Bool {
        return true
    }
    
    static var testEndpoint: URL {
        return URL(string: "https://api.github.com")!
    }
    
    static var productionEndpoint: URL {
        return URL(string: "https://api.github.com")!
    }
    
    static var requiredEndpoint: URL {
        return production ? productionEndpoint : testEndpoint
    }
    static var login: String {
        return ""
    }
    
    static var password: String {
        return ""
    }
}
