//
//  GAuthViewModel.swift
//  GOMS
//
//  Created by 신아인 on 2023/06/17.
//

import UIKit
import Moya

class GAuthViewModel {
    let authProvider = MoyaProvider<SignInService>()
    var authData: SignInResponse!
    
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

extension GAuthViewModel {
    func signInCompleted(code: String) {
        let parameter = SignInRequest(code: code)
        authProvider.request(.signIn(param: parameter)) { response in
            switch response {
            case .success(let result):
                do {
                    print("signIn success")
                }
                catch(let err) {
                    print(err.localizedDescription)
                }
                
                let statusCode = result.statusCode
                switch statusCode{
                case 200..<300:
                    print("Token ?")
                case 400:
                    print("토큰 만료")
                default:
                    print("ERROR")
                }
                
            case .failure(let err):
                print(err.localizedDescription)
            }
            
        }
    }
}
