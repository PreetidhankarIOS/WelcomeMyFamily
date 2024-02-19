//
//  NetworkRouter.swift
//  WelcomeMyFamily
//
//  Created by Ashish Viltoriya on 19/02/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

final class NetworkRouter {
    
    let baseURL: String
    init(baseURL: String) {
        self.baseURL = baseURL
    }

    private func buildRequest(url: URL, method: HTTPMethod, headers: [String: String]?, body: Data?) -> URLRequest {
        print("Request URL: \(url)")
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = body
        return request
    }

    private func executeRequest<T: Decodable>(request: URLRequest) async -> Result<T, APIError> {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                switch httpResponse.statusCode {
                case 200...299: // Success range
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    return .success(decodedData)
                case 400: // Bad Request
                    return .failure(.invalidResponse)
                case 401: // Unauthorized
                    // Handle unauthorized case, if applicable for your API
                    return .failure(.invalidResponse)
                case 404: // Not Found
                    // Handle not found case, if applicable for your API
                    return .failure(.invalidResponse)
                default:
                    // Handle other error cases with the specific error status code
                    return .failure(.invalidResponse)
                }
            } else {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                return .success(decodedData)
            }
        } catch {
            return .failure(.requestFailed(error))
        }
    }

    func sendRequest<T: Decodable>(path: String? = nil,
                                   method: HTTPMethod,
                                   parameters: [String: String]? = nil,
                                   headers: [String: String]? = nil,
                                   body: Data? = nil) async -> Result<T, APIError> {
        do {
            guard var urlComponents = URLComponents(string: baseURL) else {
                throw APIError.invalidURL
            }

            urlComponents.path = path ?? ""
            if let parameters = parameters {
                urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
            }

            guard let url = urlComponents.url else {
                throw APIError.invalidURL
            }

            let request = buildRequest(url: url, method: method, headers: headers, body: body)
            return await executeRequest(request: request)
        } catch {
            return .failure(.requestFailed(error))
        }
    }
    
    
}
