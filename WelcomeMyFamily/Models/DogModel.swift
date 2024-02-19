//
//  DogModel.swift
//  WelcomeMyFamily
//
//  Created by Ashish Viltoriya on 19/02/24.
//

import Foundation

struct DogModel: Identifiable {
    
    var id: Int
    var name: String
    var age: Int
    var gender: String
    var color: String
    var weight: Double
    var location: String
    var image: String
    var about: String
    var owner: PreetiModel
}
