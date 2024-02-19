//
//  DogData.swift
//  WelcomeMyFamily
//
//  Created by Ashish Viltoriya on 19/02/24.
//

import Foundation

struct  DogData {
    static let owner = PreetiModel(name: "Preeti Dhankar", bio: "iOS Developer, SwiftUI and Swift", image: OWNER_IMAGE)
    static let owner2 = PreetiModel(name: "Ashish Viltoriya", bio: "Senior ios Developer", image: OWNER_IMAGE2)
    
    static let dogs =  [
        DogModel(id: 124, name: "Parkinson", age: 2, gender: "male", color: "Brown", weight: 14, location: "341m", image: DOG_IMAGE_BLUE, about: "Playful", owner: owner),
        
        DogModel(id: 222, name: "MiloMan", age: 6, gender: "female", color: "Orange", weight: 31, location: "1m", image: DOG_IMAGE_GARDEN, about: "Playful, Barks on command", owner: owner2),
        
        DogModel(id: 785, name: "Daisy", age: 3, gender: "female", color: "Brown", weight: 14, location: "541m", image: DOG_IMAGE_ORANGE, about: "Playful", owner: owner),
        DogModel(id: 485, name: "Oscar", age: 4, gender: "male", color: "Brown", weight: 14, location: "410m", image: DOG_IMAGE_WHITE, about: "Playful", owner: owner),
        DogModel(id: 452, name: "Milo", age: 4, gender: "male", color: "Brown", weight: 14, location: "243m", image: DOG_IMAGE_RED, about: "Playful", owner: owner),
        DogModel(id: 369, name: "Ruby", age: 5, gender: "female", color: "Brown", weight: 14, location: "114m", image: DOG_IMAGE_YELLOW, about: "Playful", owner: owner)
    ]
}
