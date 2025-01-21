//
//  ActorModels.swift
//  MovieApp
//
//  Created by layan alwasaidi on 20/01/2025.
//

import Foundation

struct ActorResponse: Codable {
    let records: [ActorRecord]
}

struct ActorRecord: Codable {
    let id: String
    let fields: ActorFields
}

struct ActorFields: Codable {
    let name: String
    let age: Int?
    let movies: [String]? // Optional: IDs of movies the actor is linked to
}
