//
//  RegisterResponse.swift
//  Week4
//
//  Created by hyunwoo on 5/3/25.
//

struct RegisterResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data : RegisterResponseBody
}

struct RegisterResponseBody: Codable {
    let userId: Int
    let nickname: String
}
