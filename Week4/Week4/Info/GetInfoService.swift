//
//  GetInfoService.swift
//  Week4
//
//  Created by hyunwoo on 5/3/25.
//
import Foundation

final class GetInfoService {
    
    static let shared = GetInfoService()
    private init() {}
    
    func makeReqeust(keyword: String?) -> URLRequest? {
        var urlString = "http://api.atsopt-seminar4.site/api/v1/users"
        
        if let keyword = keyword, !keyword.isEmpty,
           let encoded = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
            urlString += "?keyword=\(encoded)"
        }
        
        guard let url = URL(string: urlString) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") //optional
        return request
    }
    
    func fetchNickNameList(keyword: String?) async throws -> [String] {
        guard let request = makeReqeust(keyword: keyword) else{
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
            let decoded = try JSONDecoder().decode(NicknameListResponseWrapper.self, from: data)
            return decoded.data.nicknameList
        } catch {
            print("디코딩실패", error)
            throw NetworkError.responseDecodingError
        }
    }
}
