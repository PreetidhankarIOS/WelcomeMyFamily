//
//  HomeViewModel.swift
//  WelcomeMyFamily
//
//  Created by Ashish Viltoriya on 19/02/24.
//

import Foundation


class HomeViewModel: ObservableObject {

        @Published var dogData: [DogDataAPI] = []
        @Published var isLoading: Bool = false
        @Published var errorMessage: String = ""
        private let service: ServiceProtocol
        init(service: ServiceProtocol) {
            self.service = service
            Task {
                await fetchPosts()
            }
        }
    
        @MainActor func fetchPosts() async {
            isLoading = true
                let result =  await service.fetchData()
                switch result {
                case .success(let data):
                    for item in data
                    {
                        self.dogData.append(item)
                       
                    }
                    isLoading = false
                case .failure(let error):
                    // Handle the APIError in the failure case
                    self.errorMessage = "Failed to fetch posts: \(error.getErrorMessage())"
                    isLoading = false
                }
        }
        
        func updateProduct(_ updatedProduct: DogDataAPI) {
            guard let index = dogData.firstIndex(where: { $0.id == updatedProduct.id }) else {
                return
            }
            dogData[index] = updatedProduct
        }

}
