//
//  UserInfoService.swift
//  Week4
//
//  Created by hyunwoo on 5/7/25.
//

import Foundation

final class UserInfoService {
    
    static let shared = UserInfoService()
    private init() {}
    
    func makeReqeust(userId: Int) -> URLRequest? {
        let urlString = "http://api.atsopt-seminar4.site/api/v1/users/me"
        
        guard let url = URL(string: urlString) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") //optional
        request.setValue(String(userId), forHTTPHeaderField: "userId")
        return request
    }
    
    func fetchNickName(userId: Int) async throws -> String {
        guard let request = makeReqeust(userId: userId) else{
            throw NetworkError.requestEncodingError
        }
        dump(request)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }
        dump(httpResponse)
        do {
            let decoded = try JSONDecoder().decode(MyNicknameListResponseWrapper.self, from: data)
            return decoded.data.nickname
        } catch {
            print("디코딩실패", error)
            throw NetworkError.responseDecodingError
        }
    }
    
}
