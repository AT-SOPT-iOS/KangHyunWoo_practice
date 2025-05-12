//
//  RegisterRequest.swift
//  Week4
//
//  Created by hyunwoo on 5/3/25.
//

struct RegisterRequestBody: Codable {
    let loginId: String
    let password: String
    let nickname: String
}
