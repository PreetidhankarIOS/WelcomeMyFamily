//
//  DetailsViewModel.swift
//  WelcomeMyFamily
//
//  Created by Ashish Viltoriya on 19/02/24.
//

import Foundation

class DetailsViewModel: ObservableObject {
    
    let model: DogDataAPI
    
//    let story = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
    init(model: DogDataAPI) { self.model = model }
    
    func favouriteMethod() {  }
    
    func messageMethod() {  }
    
    func adoptMethod() {  }
}
