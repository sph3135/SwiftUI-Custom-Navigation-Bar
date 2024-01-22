//
//  Users.swift
//  CustomTabSwiftUI
//
//  Created by Sudeep P H on 27/09/23.
//

import SwiftUI

struct Users: View {
    @State private var apiResponse: ApiResponse?
    
    func fetchDetails() {
        guard let url = URL(string: "https://reqres.in/api/users?page=2") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.apiResponse = decodedResponse
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("User's Data")
                    .font(Font.custom("HelveticaNeue-Thin", size: 24))
                    .foregroundColor(Color.white)
                ScrollView {
                    VStack {
                        if let response = apiResponse {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                                ForEach(response.data) { user in
                                    VStack {
                                        AsyncImage(url: URL(string: user.avatar)) { phase in
                                            switch phase {
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .clipShape(Circle())
                                                    .shadow(color: .primary, radius: 5)
                                                    .padding([.horizontal, .top], 7)
                                                    .frame(width: 100, height: 100)
                                            default:
                                                Color.gray
                                                    .frame(width: 100, height: 100)
                                            }
                                        }
                                        Text(user.firstName).lineLimit(1)
                                            .font(Font.custom("HelveticaNeue-Thin", size: 15))
                                            .foregroundColor(Color.white)
                                        Text(user.lastName).lineLimit(1)
                                            .font(Font.custom("HelveticaNeue-Thin", size: 12))
                                            .foregroundColor(Color.white)
                                    }
                                    .onLongPressGesture(minimumDuration: 2.0, perform: {
                                        print("Long tapped")
                                    })
                                    .padding(8)
                                    
                                }
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                        } else {
                            Text("Loading...")
                        }
                    }
                }
            }
            .background(Color.backgroundGradient)
            .onAppear {
                fetchDetails()
            }
        }
    }
}

struct Users_Previews: PreviewProvider {
    static var previews: some View {
        Users()
    }
}


