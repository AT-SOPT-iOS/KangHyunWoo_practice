//
//  TestModel.swift
//  Week3_Practice
//
//  Created by hyunwoo on 4/26/25.
//
import UIKit

struct ChatModel {
    let profileImg: UIImage
    let name: String
    let place: String
    let message: String
    let itemImg: UIImage
}

extension ChatModel {
    static func dummy() -> [ChatModel] {
        return [
            ChatModel(profileImg: .person1, name: "김가현", place: "광진구", message: "내말에답장해줘", itemImg: .product1),
            ChatModel(profileImg: .person2, name: "김현수", place: "여의도", message: "마크내사랑", itemImg: .rectangle3),
            ChatModel(profileImg: .person3, name: "서주영", place: "잠실", message: "마크내꺼", itemImg: .rectangle4),
            ChatModel(profileImg: .person4, name: "권석기", place: "회기", message: "나는 민경훈", itemImg: .rectangle5),
            ChatModel(profileImg: .person5, name: "김나연", place: "미국", message: "타코팔러가야돼", itemImg: .rectangle6),
            ChatModel(profileImg: .person6, name: "정정욱", place: "중국", message: "보쌈정식13000원", itemImg: .rectangle7),
            ChatModel(profileImg: .person7, name: "서상원", place: "일본", message: "잠실의주인은두산이다", itemImg: .rectangle8),
            ChatModel(profileImg: .person8, name: "임재현", place: "태국", message: "뒷풀이갈게", itemImg: .rectangle9),
            ChatModel(profileImg: .person9, name: "이은지", place: "명왕성", message: "은지야술먹자", itemImg: .rectangle10),
            ChatModel(profileImg: .person10, name: "강현우", place: "안양", message: "현우야 정신차려", itemImg: .product2)
        ]
    }
}
