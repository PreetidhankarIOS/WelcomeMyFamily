//
//  DogDataAPI.swift
//  WelcomeMyFamily
//
//  Created by Ashish Viltoriya on 19/02/24.
//

import Foundation


// MARK: - DogDataAPI
struct DogDataAPI: Codable {
    let weight, height: Eight
    let id: Int
    let name: String
    let countryCode: String?
    let bredFor: String
    let breedGroup: String?
    let lifeSpan, temperament, referenceImageID: String

    enum CodingKeys: String, CodingKey {
        case weight, height, id, name
        case countryCode = "country_code"
        case bredFor = "bred_for"
        case breedGroup = "breed_group"
        case lifeSpan = "life_span"
        case temperament
        case referenceImageID = "reference_image_id"
    }
}

// MARK: - Eight
struct Eight: Codable {
    let imperial, metric: String
}

typealias DogDataDynamic = [DogDataAPI]
