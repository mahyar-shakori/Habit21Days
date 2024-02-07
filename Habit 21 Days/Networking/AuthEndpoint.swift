//
//  AuthEndpoint.swift
//  Habit 21 Days
//
//  Created by Mahyar on 2/6/24.
//

import Foundation

enum AuthEndpoint {
    case getQuote
}

extension AuthEndpoint: Endpoint {
    
    var method: HTTPMethod {
        switch self {
        case .getQuote:
            return .get
        }
    }
    
    var body: [String : Any]? {
        return [:]
    }
    
    var header: [String : String]? {
        return ["X-Api-Key": "lap3sU0ASOTqp+yNhwqAIA==1vMwgAQ5Rv1r0rkJ"]
    }
    
    var path: String {
        switch self {
        case .getQuote:
            return "quotes?category=success"
        }
    }
}
