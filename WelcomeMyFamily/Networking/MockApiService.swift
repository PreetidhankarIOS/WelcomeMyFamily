//
//  MockApiService.swift
//  WelcomeMyFamily
//
//  Created by Ashish Viltoriya on 19/02/24.
//

import Foundation

class MockProductService: ServiceProtocol {
    
    func fetchData() async -> Result<DogDataDynamic, APIError> {
        guard let sampleData: DogDataDynamic = readJSONFromFile(fileName: "SamplePost")else {
            return.failure(.invalidData)
            
        }
        return .success(sampleData)
        
    }
}
