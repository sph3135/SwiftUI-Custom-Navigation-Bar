//
//  DataModel.swift
//  CustomTabSwiftUI
//
//  Created by Sudeep P H on 27/09/23.
//

struct User: Identifiable, Decodable {
    var id: Int
    var email: String
    var firstName: String
    var lastName: String
    var avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id, email,firstName = "first_name",lastName = "last_name", avatar
    }
}

struct UserData: Decodable {
    var page: Int
    var perPage: Int
    var total: Int
    var totalPages: Int
    var data: [User]
}

struct Support: Decodable {
    var url: String
    var text: String
}

struct ApiResponse: Decodable {
    var page: Int
    var perPage: Int
    var total: Int
    var totalPages: Int
    var data: [User]
    var support: Support
    
    enum CodingKeys: String, CodingKey {
        case page, perPage = "per_page", total, totalPages = "total_pages", data, support
    }
}

