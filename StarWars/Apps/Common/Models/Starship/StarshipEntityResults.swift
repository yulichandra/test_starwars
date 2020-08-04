//
//  StarshipEntityResults.swift
//
//  Created by Ari Munandar on 04/08/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct StarshipEntityResults: Codable {
    enum CodingKeys: String, CodingKey {
        case created
        case costInCredits = "cost_in_credits"
        case name
        case cargoCapacity = "cargo_capacity"
        case passengers
        case crew
        case edited
        case manufacturer
        case starshipClass = "starship_class"
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case length
        case consumables
        case model
        case films
        case url
        case mGLT = "MGLT"
        case hyperdriveRating = "hyperdrive_rating"
    }

    var created: String?
    var costInCredits: String?
    var name: String?
    var cargoCapacity: String?
    var passengers: String?
    var crew: String?
    var edited: String?
    var manufacturer: String?
    var starshipClass: String?
    var maxAtmospheringSpeed: String?
    var length: String?
    var consumables: String?
    var model: String?
    var films: [String]?
    var url: String?
    var mGLT: String?
    var hyperdriveRating: String?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        created = try container.decodeIfPresent(String.self, forKey: .created)
        costInCredits = try container.decodeIfPresent(String.self, forKey: .costInCredits)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        cargoCapacity = try container.decodeIfPresent(String.self, forKey: .cargoCapacity)
        passengers = try container.decodeIfPresent(String.self, forKey: .passengers)
        crew = try container.decodeIfPresent(String.self, forKey: .crew)
        edited = try container.decodeIfPresent(String.self, forKey: .edited)
        manufacturer = try container.decodeIfPresent(String.self, forKey: .manufacturer)
        starshipClass = try container.decodeIfPresent(String.self, forKey: .starshipClass)
        maxAtmospheringSpeed = try container.decodeIfPresent(String.self, forKey: .maxAtmospheringSpeed)
        length = try container.decodeIfPresent(String.self, forKey: .length)
        consumables = try container.decodeIfPresent(String.self, forKey: .consumables)
        model = try container.decodeIfPresent(String.self, forKey: .model)
        films = try container.decodeIfPresent([String].self, forKey: .films)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        mGLT = try container.decodeIfPresent(String.self, forKey: .mGLT)
        hyperdriveRating = try container.decodeIfPresent(String.self, forKey: .hyperdriveRating)
    }
}
