//
//  NetworkManager.swift
//  WelcomeMyFamily
//
//  Created by Ashish Viltoriya on 19/02/24.
//

import Foundation


protocol ServiceProtocol {
    
    func fetchData() async -> Result<DogDataDynamic, APIError>
}

final class ProductService: ServiceProtocol {

//    func fetchData(completion: @escaping (Result<ProductModel, APIError>) -> Void) async{
//        let baseURL = "https://app.check24.de/products-test.json"
//        let router = NetworkRouter(baseURL: baseURL)
//
//        /* You may pass necessary header, params etcs. */
//
//        router.sendRequest(path: "/products-test.json", method: .get) { (result: Result<ProductModel, APIError>) in
//            switch result {
//            case .success(let posts):
//                print("Users: \(posts)")
//                completion(.success(posts)) // Wrap 'posts' in a Result.success
//            case .failure(let error):
//                // Handle the error case
//                completion(.failure(error)) // Wrap 'error' in a Result.failure
//                print("error: \(error)")
//
//            }
//        }
//    }
    
    func fetchData() async -> Result<DogDataDynamic, APIError> {
        let baseURL = "https://api.thedogapi.com"
        let router = NetworkRouter(baseURL: baseURL)
        
        do {
            let result: Result<DogDataDynamic, APIError> =  await router.sendRequest(path: "/v1/breeds?limit=10&page=0", method: .get)
            return result
        }
        
    }

}

//https://api.thedogapi.com/v1/breeds?limit=10&page=0
//https://cdn2.thedogapi.com/images/Hyq1ge9VQ.jpg
