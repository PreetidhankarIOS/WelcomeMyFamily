//
//  DogModel.swift
//  WelcomeMyFamily
//
//  Created by Ashish Viltoriya on 19/02/24.
//

import Foundation

//struct DogModel: Identifiable {
//    
//    var id: Int
//    var name: String
//    var age: Int
//    var gender: String
//    var color: String
//    var weight: Double
//    var location: String
//    var image: String
//    var about: String
//    var owner: PreetiModel
//}


struct DogModel: Codable,Identifiable {
    
    //let weight, height: Eight
    let id: Int
    let name: String
    let countryCode: String?
    let bred_for: String?
    let breedGroup: String?
    let lifeSpan, temperament, referenceImageID: String
    let origin: String?
    enum CodingKeys: String, CodingKey {
        //case weight, height
        case id, name
        case countryCode = "country_code"
        case bred_for = "bred_for"
        case breedGroup = "breed_group"
        case lifeSpan = "life_span"
        case temperament
        case referenceImageID = "reference_image_id"
        case origin
    }
}

// MARK: - Eight
//struct Eight: Codable {
//    let imperial, metric: String
//}
