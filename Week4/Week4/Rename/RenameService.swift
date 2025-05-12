//
//  RenameService.swift
//  Week4
//
//  Created by hyunwoo on 5/8/25.
//
import Foundation

class RenameService {
    
    static let shared = RenameService()
    private init() {}
    
    func makeRequestBody(nickName: String) -> Data? {
        do {
            let data = RenameRequestBody(nickname: nickName)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    func makeRequest(userId: Int, body: Data?) -> URLRequest?{
        let url = URL(string: "http://api.atsopt-seminar4.site/api/v1/users")!
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") //optional
        request.setValue(String(userId), forHTTPHeaderField: "userId")
        if let body = body {
            request.httpBody = body
        }
        return request
    }
    func PatchRegisterData(userId: Int, nickName: String) async throws -> RenameResponseWrapper {
        
        guard let body = makeRequestBody(nickName: nickName) else{
            throw NetworkError.requestEncodingError
        }
        guard let request = makeRequest(userId: userId, body: body) else{ //위에서 optional로 처리해서 guard let으로 감싸주기
            throw NetworkError.requestEncodingError
        }
        dump(request)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        dump(httpResponse)
        
        guard(200...299).contains(httpResponse.statusCode) else{
            throw configureHTTPError(errorCode:httpResponse.statusCode)
        }
        do{
            let decoded = try JSONDecoder().decode(RenameResponseWrapper.self, from: data)
            return decoded
        } catch {
            print("디코딩실패", error)
            throw(NetworkError.responseDecodingError)
        }
    }
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
    
    
}
