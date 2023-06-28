//
//  SignInRequest.swift
//  GOMS
//
//  Created by 신아인 on 2023/06/22.
//

import Foundation

struct SignInRequest: Codable {
    let code: String
    
    init(code: String) {
        self.code = code
    }
}
