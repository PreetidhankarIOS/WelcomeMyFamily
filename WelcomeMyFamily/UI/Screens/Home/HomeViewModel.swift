//
//  HomeViewModel.swift
//  WelcomeMyFamily
//
//  Created by Ashish Viltoriya on 19/02/24.
//

import Foundation


class HomeViewModel: ObservableObject {
    
    @Published var dogsList = [DogModel]()
    
    init() { fetchDogsList() }
    
    func fetchDogsList() { dogsList = DogData.dogs }
}
