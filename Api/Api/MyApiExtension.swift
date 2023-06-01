//
//  MyApiExtension.swift
//  Api
//
//  Created by Taghrid Alkwayleet on 12/11/1444 AH.
//

import Foundation
enum CallApiError: Error {
    case responseIsNot200
    case stringIsNotGoodUrl
}

func callApi<T>(_ request: URLRequest, to: T.Type) async throws -> T
where T : Decodable {
    let (data, response) = try await URLSession.shared.data(for: request)
if !response.isOk {
throw CallApiError.responseIsNot200
}
data.printAsString()
return try data.decode(to: to)
}
                                                          
extension String {
    func toRequest () throws -> URLRequest {
        guard let url = URL(string: self) else {
            throw CallApiError.stringIsNotGoodUrl
        }
            return URLRequest (url: url)
        }
    }
extension Data {
    func printAsString() {
        guard let datasString = String(data: self, encoding: .utf8)
        else {
            print("Can not convert data to string")
            return
        }
        
        print("Data as string: \(datasString)")
    }
    
    func decode<T>(to: T.Type) throws -> T where T : Decodable {
        return try JSONDecoder().decode(to, from: self)
    }
}
extension URLResponse {
    var statusCode: Int? {
        guard let statusCode = (self as?
                                HTTPURLResponse)?.statusCode
        else {
            print("Can not get status code")
            return nil
            
        }
        return statusCode
    }
        
        var isOk: Bool {
            guard let statusCode = self.statusCode else {
                return false
            }
            if statusCode < 200 || statusCode > 299 {
                print("Status code :\(statusCode), is not 200s.")
                return false
            }
            
        }
    }
