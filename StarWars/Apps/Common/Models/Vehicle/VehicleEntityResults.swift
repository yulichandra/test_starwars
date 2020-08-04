//
//  VehicleEntityResults.swift
//
//  Created by Ari Munandar on 04/08/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct VehicleEntityResults: Codable {
    enum CodingKeys: String, CodingKey {
        case cargoCapacity = "cargo_capacity"
        case length
        case films
        case consumables
        case passengers
        case name
        case edited
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case crew
        case manufacturer        
        case created
        case url
        case costInCredits = "cost_in_credits"
        case model
        case vehicleClass = "vehicle_class"
    }

    var cargoCapacity: String?
    var length: String?
    var films: [String]?
    var consumables: String?
    var passengers: String?
    var name: String?
    var edited: String?
    var maxAtmospheringSpeed: String?
    var crew: String?
    var manufacturer: String?
    var created: String?
    var url: String?
    var costInCredits: String?
    var model: String?
    var vehicleClass: String?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        cargoCapacity = try container.decodeIfPresent(String.self, forKey: .cargoCapacity)
        length = try container.decodeIfPresent(String.self, forKey: .length)
        films = try container.decodeIfPresent([String].self, forKey: .films)
        consumables = try container.decodeIfPresent(String.self, forKey: .consumables)
        passengers = try container.decodeIfPresent(String.self, forKey: .passengers)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        edited = try container.decodeIfPresent(String.self, forKey: .edited)
        maxAtmospheringSpeed = try container.decodeIfPresent(String.self, forKey: .maxAtmospheringSpeed)
        crew = try container.decodeIfPresent(String.self, forKey: .crew)
        manufacturer = try container.decodeIfPresent(String.self, forKey: .manufacturer)
        created = try container.decodeIfPresent(String.self, forKey: .created)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        costInCredits = try container.decodeIfPresent(String.self, forKey: .costInCredits)
        model = try container.decodeIfPresent(String.self, forKey: .model)
        vehicleClass = try container.decodeIfPresent(String.self, forKey: .vehicleClass)
    }
}
