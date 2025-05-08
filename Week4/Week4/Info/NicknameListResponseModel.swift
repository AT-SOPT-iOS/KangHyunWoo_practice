//
//  NicknameListResponseModel.swift
//  Week4
//
//  Created by hyunwoo on 5/3/25.
//
import Foundation

struct NicknameListResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data : NicknameListResponseModel
}
struct NicknameListResponseModel: Codable{
    let nicknameList: [String]
}

