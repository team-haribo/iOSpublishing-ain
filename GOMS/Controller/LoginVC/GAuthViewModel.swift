//
//  GAuthViewModel.swift
//  GOMS
//
//  Created by 신아인 on 2023/06/17.
//

import UIKit

class GAuthViewModel {
    let clientID: String
    let redirectURI: String
    var completion: ((_ code: String) -> Void)?
    
    init(clientID: String, redirectURI: String) {
        self.clientID = clientID
        self.redirectURI = redirectURI
    }
    
    func handleGAuthCode(code: String) {
        completion?(code)
    }
}
