//
//  SignInService.swift
//  GOMS
//
//  Created by 신아인 on 2023/06/22.
//

import Foundation
import Moya

enum SignInService {
    case signIn(param: SignInRequest)
    case refreshToken(refreshToken: String)
}

extension SignInService: TargetType {
    var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .signIn:
            return "/auth/signin/"
        case .refreshToken:
            return "/auth/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signIn:
            return .post
        case .refreshToken:
            return .patch // 리소스 특정 부분 수정
        }
    }
    
    var task: Task {
        switch self {
        case .signIn(let param):
            return .requestJSONEncodable(param)
        case .refreshToken:
            return .requestPlain // 값을 넣지 않을 때 사용
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .refreshToken(let refreshToken):
            return["Content-Type" :"application/json", "refreshToken" : refreshToken]
        default:
            return["Content-Type" :"application/json"]
        }
    }
    
    
}
