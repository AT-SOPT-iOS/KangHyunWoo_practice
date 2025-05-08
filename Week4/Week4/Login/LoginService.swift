//
//  LoginService.swift
//  Week4
//
//  Created by hyunwoo on 5/7/25.
//

import Foundation

class LoginService {
    static let shared = LoginService()
    private init() {}
    
    func makeRequestBody(loginId: String,
                         password: String) -> Data? {
        do {
            let data = LoginRequestBody(loginId: loginId,
                                           password: password)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    func makeRequest(body: Data?) -> URLRequest{
        let url = URL(string: "http://api.atsopt-seminar4.site/api/v1/auth/signin")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let header = ["Content-Type" : "application/json"]
        header.forEach{
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        if let body = body {
            request.httpBody = body
        }
        return request
    }
    
    func PostRegisterData(loginId: String,
                          password: String) async throws -> LoginResponseBody {
        
        guard let body = makeRequestBody(loginId: loginId, password: password) else{
            throw NetworkError.requestEncodingError
        }
        let request = makeRequest(body: body)
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
            let decoded = try JSONDecoder().decode(LoginResponseWrapper.self, from: data)
            return decoded.data
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
