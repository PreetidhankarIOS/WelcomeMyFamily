//
//  HomeView.swift
//  WelcomeMyFamily
//
//  Created by Ashish Viltoriya on 18/02/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel(service: ProductService())
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.primary_color.edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Hey Preeti,").modifier(SailecFont(.bold, size: 24))
                                    .foregroundColor(Color.text_primary_color).padding(.top, 16)
                                Text("Adopt a new friend near you!").modifier(SailecFont(.regular, size: 18))
                                    .foregroundColor(Color.text_primary_color).padding(.top, 4)
                            }
                            Spacer()
                        }
                        Text("Nearby results").modifier(SailecFont(.bold, size: 14))
                            .foregroundColor(Color.text_primary_color)
                            .padding(.top, 24).padding(.bottom, 8)
                        ForEach(viewModel.dogData) { model in
                            NavigationLink(destination: DetailsView(model: model), label: {
                            let imageURLString = "https://cdn2.thedogapi.com/images/\(model.referenceImageID).jpg"
                                HomeListModelView(imageURLString:imageURLString, name: model.name, life_span: model.lifeSpan, temperament: model.temperament, bred_for: model.bred_for ?? "", breed_group: "", origin:model.origin ?? "")
  
                            })
                        }
                    }
                    Spacer()
                    Spacer().frame(height: 150)
                }
                .padding(.horizontal, 16).padding(.top, 1)
                .navigationBarHidden(true)
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeListModelView: View {
    
    var imageURLString: String, name: String, life_span: String, temperament: String, bred_for: String, breed_group: String, origin: String

    
    var body: some View {
        HStack(spacing: 12) {
            
            if let imageURL = URL(string: imageURLString) {
                     AsyncImage(url: imageURL) { image in
                         image
                             .resizable().scaledToFill()
                     } placeholder: {
                         ProgressView() // Placeholder while loading
                     }
                     .frame(width: 150, height: 150).cornerRadius(16) // Adjust the
                 } else {
                     Text("Invalid URL")
                 }
            VStack(alignment: .leading, spacing: 12) {
                Text(name).lineLimit(1).modifier(SailecFont(.medium, size: 20)).foregroundColor(Color.text_primary_color)
                
                Text("\(life_span) | \(bred_for)").lineLimit(2).modifier(SailecFont(.regular, size: 14)).foregroundColor(Color.text_primary_color)
                Text("\(temperament)").lineLimit(2).modifier(SailecFont(.regular, size: 14)).foregroundColor(Color.text_primary_color)
                
                
                HStack(alignment: .center, spacing: 2) {
                    Image(IMAGE_LOC_ICON).resizable().frame(width: 20, height: 20)
                    
                    Text("\(origin)").modifier(SailecFont(.regular, size: 14))
                        .foregroundColor(Color.text_primary_color).padding(.top, 2)
                }
            }
        }
        .padding(16)
        .background(Color.secondary_color)
        .cornerRadius(16)
    }
}

struct GenderView: View {
    var isMale: Bool
    var body: some View {
        Text(isMale ? "Male" : "Female").modifier(SailecFont(.regular, size: 12))
            .foregroundColor(isMale ? Color.blue_color : Color.red_color)
            .padding(.horizontal, 18).padding(.vertical, 8)
            .background(isMale ? Color.blue_color_trans : Color.red_color_trans)
            .cornerRadius(12)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
