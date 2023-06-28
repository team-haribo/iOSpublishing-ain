//
//  RefreshTokenRequest.swift
//  GOMS
//
//  Created by 신아인 on 2023/06/23.
//

import Foundation

struct RefreshTokenRequest: Codable {
    let authorization: String
    
    init(authorization: String) {
        self.authorization = authorization
    }
}
