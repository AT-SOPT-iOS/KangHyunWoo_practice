//
//  RenameResponseWrapper.swift
//  Week4
//
//  Created by hyunwoo on 5/8/25.
//

struct RenameResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data : String?
}
