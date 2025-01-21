//
//  UserModels.swift
//  MovieApp
//
//  Created by layan alwasaidi on 21/01/2025.
//

import Foundation

struct UserResponse: Codable {
    let records: [UserRecord]
}

struct UserRecord: Codable {
    let id: String
    let fields: UserFields
}

struct UserFields: Codable {
    let email: String
    let password: String
    let name: String
}
