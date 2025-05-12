//
//  LoginResponseWrapper.swift
//  Week4
//
//  Created by hyunwoo on 5/7/25.
//

struct LoginResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data : LoginResponseBody
}

struct LoginResponseBody: Codable {
    let userId: Int
}
