//
//  APIError.swift
//  WelcomeMyFamily
//
//  Created by Ashish Viltoriya on 19/02/24.
//

import Foundation

enum APIError: Error {
    case requestFailed(Error)
    case invalidData
    case decodingError
    case invalidURL
    case invalidResponse
    case network
}

extension APIError {
    func getErrorMessage() -> String {
        var errorString = "Unknown error"
        switch self {
         case let .requestFailed(error):
            if error.errorCode == Constant.ErrorCode.offline {
                errorString = "Internet conenction appears to be offline."
            } else {
                errorString = error.localizedDescription
            }

        case .invalidData:
            errorString = "invalid request."

        case .decodingError:
            errorString = "decoding request."

        case .invalidURL:
            errorString = "invalid request."

        case .invalidResponse:
            errorString = "invalid response."

        case .network:
            errorString = "unknown network response."
        }
        
        return errorString
    }
}
extension Error {
    var errorCode: Int? {
        (self as NSError).code
    }
}

struct Constant {
    struct ErrorCode {
        static let offline = -1020
    }
}
