//
//  MyNickNameListResponseModel.swift
//  Week4
//
//  Created by hyunwoo on 5/7/25.
//

import Foundation

struct MyNicknameListResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data : MyNicknameListResponseModel
}
struct MyNicknameListResponseModel: Codable{
    let nickname: String
 }
