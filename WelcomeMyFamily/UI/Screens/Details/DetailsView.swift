//
//  DetailsView.swift
//  WelcomeMyFamily
//
//  Created by Ashish Viltoriya on 19/02/24.
//

import SwiftUI


struct DetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: DetailsViewModel
    // var viewModelOwner: PreetiModel
    
    init(model: DogDataAPI) {
        viewModel = DetailsViewModel(model: model)
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color.primary_color.edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ZStack(alignment: .top) {
                            let imageURLString = "https://cdn2.thedogapi.com/images/\(viewModel.model.referenceImageID).jpg"
                            if let imageURL = URL(string: imageURLString) {
                                 AsyncImage(url: imageURL) { image in
                                     image
                                .resizable().scaledToFit()
                                 } placeholder: {
                                     ProgressView() // Placeholder while loading
                                 }
                                 .frame(height: 300).frame(maxWidth: .infinity)
                             }
                    HStack {
                            Button(action: { self.presentationMode.wrappedValue.dismiss() },
                                   label: { Image(IMAGE_BACK_ICON).resizable().frame(width: 34, height: 34) })
                            Spacer()
                            Button(action: { viewModel.favouriteMethod() },
                                   label: { Image(IMAGE_FAV_ICON).resizable().frame(width: 26, height: 26) })
                        }.padding(.horizontal, 24).padding(.top, 46)
                    }
                        Group {
                            HStack {
                                Text(viewModel.model.name).modifier(SailecFont(.bold, size: 24)).lineLimit(1)
                                    .foregroundColor(Color.text_primary_color)
                                Spacer()
                                Text(viewModel.model.lifeSpan).modifier(SailecFont(.bold, size: 24)).lineLimit(1)
                               GenderView(isMale: "" == "male")
                            }.padding(.vertical, 8)
                            HStack(alignment: .center) {
                                HStack(alignment: .center, spacing: 2) {
                                    Image(IMAGE_LOC_ICON).resizable().frame(width: 24, height: 24)
                                    Text("\(viewModel.model.origin ?? "")").modifier(SailecFont(.regular, size: 14))
                                        .foregroundColor(Color.text_primary_color).padding(.top, 2)
                                }
                                Spacer()
                                Text("Breed Group : \(viewModel.model.breedGroup ?? "") | \(viewModel.model.bred_for ?? "")").modifier(SailecFont(.regular, size: 14))
                                    .lineLimit(2).foregroundColor(Color.text_primary_color)
                            }
                            HStack {
                                Text("12 min ago").modifier(SailecFont(.regular, size: 14))
                                    .foregroundColor(Color.text_primary_color)
                                Spacer()
                            }.padding(.leading, 6).padding(.top, 2)
                            
                            VStack(spacing: 16) {
                                HStack {
                                    Text("My Story").modifier(SailecFont(.bold, size: 18))
                                        .foregroundColor(Color.text_primary_color)
                                    Spacer()
                                }
                                Text(viewModel.model.temperament).modifier(SailecFont(.regular, size: 16))
                                    .foregroundColor(Color.text_primary_color)
                            }.padding(.vertical, 16)
                            
                            VStack(spacing: 16) {
                                HStack {
                                    Text("Quick Info").modifier(SailecFont(.bold, size: 18))
                                        .foregroundColor(Color.text_primary_color)
                                    Spacer()
                                }
                                HStack(spacing: 8) {
                                    DetailsInfoView(primary: "\(viewModel.model.lifeSpan)", secondary: "Age")
                                    DetailsInfoView(primary: "Brown", secondary: "Color")
                                    DetailsInfoView(primary: "29", secondary: "Weight")
                                }
                            }.padding(.vertical, 16)
                            
                            VStack(spacing: 16) {
                                HStack {
                                    Text("Owner Info").modifier(SailecFont(.bold, size: 18))
                                        .foregroundColor(Color.text_primary_color)
                                    Spacer()
                                }
                               // DetailsOwnerView(image: Image("owner_image"), name: "Preeti Dhankar", bio: "Socialist & Developer", messageMethod: viewModel.messageMethod)
                            }.padding(.vertical, 16)
                            
                            Button(action: { viewModel.adoptMethod() },
                                   label: { Text("Adopt me").modifier(SailecFont(.medium, size: 16)).foregroundColor(.white) })
                                .frame(height: 50).frame(maxWidth: .infinity)
                                .background(Color.main_color).cornerRadius(8)
                                .padding(.vertical, 24)
                            
                       }.padding(.horizontal, 16).padding(.top, 8)
                    }
                    .background(Color.primary_color)
                    
                    Spacer()
                    Spacer().frame(height: 150)
                }
                
                .edgesIgnoringSafeArea(.all)
                .navigationBarHidden(true)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
struct DetailsOwnerView: View {
    var image: String, name: String, bio: String
    var messageMethod: () -> ()
    var body: some View {
        HStack {
            Image(image).resizable().scaledToFill().frame(width: 60, height: 60).cornerRadius(30)
            VStack(alignment: .leading, spacing: 8) {
                Text(name).modifier(SailecFont(.medium, size: 16))
                    .foregroundColor(Color.text_primary_color)
                Text(bio).modifier(SailecFont(.regular, size: 14))
                    .foregroundColor(Color(hex: "828282"))
            }.padding(.leading, 8)
            Spacer()
            Button(action: { self.messageMethod() },
                   label: { Image(IMAGE_MSG_ICON).resizable().frame(width: 20, height: 20) })
                .frame(width: 45, height: 45).background(Color.main_color).cornerRadius(25)
        }
    }
}

struct DetailsInfoView: View {
    var primary: String, secondary: String
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 8) {
                Text(primary).modifier(SailecFont(.medium, size: 16))
                    .foregroundColor(Color.text_primary_color)
                Text(secondary).modifier(SailecFont(.regular, size: 12))
                    .foregroundColor(Color(hex: "828282"))
            }
            Spacer()
        }
        .padding(.vertical, 12)
        .background(Color.secondary_color)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "DDDDDD"), lineWidth: 0.25)
        )
    }
}

//struct DetailsView_Preview: PreviewProvider {
//   
//       static var previews: some View {
//           DetailsView(model: <#DogDataAPI#>)
//       }
//
//}


//    "weight": {
//    "imperial": "6 - 13",
//    "metric": "3 - 6"
//    },
//    "height": {
//    "imperial": "9 - 11.5",
//    "metric": "23 - 29"
//    },
//    "id": 1,
//    "name": "Affenpinscher",
//    "bred_for": "Small rodent hunting, lapdog",
//    "breed_group": "Toy",
//    "life_span": "10 - 12 years",
//    "temperament": "Stubborn, Curious, Playful, Adventurous, Active, Fun-loving",
//    "origin": "Germany, France",
//    "reference_image_id": "BJa4kxc4X"
