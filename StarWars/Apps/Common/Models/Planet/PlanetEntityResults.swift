//
//  PlanetEntityResults.swift
//
//  Created by Ari Munandar on 04/08/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct PlanetEntityResults: Codable {
    enum CodingKeys: String, CodingKey {
        case url
        case rotationPeriod = "rotation_period"
        case surfaceWater = "surface_water"
        case edited
        case orbitalPeriod = "orbital_period"
        case climate
        case diameter
        case terrain
        case films
        case population
        case residents
        case gravity
        case name
        case created
    }

    var url: String?
    var rotationPeriod: String?
    var surfaceWater: String?
    var edited: String?
    var orbitalPeriod: String?
    var climate: String?
    var diameter: String?
    var terrain: String?
    var films: [String]?
    var population: String?
    var residents: [String]?
    var gravity: String?
    var name: String?
    var created: String?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        rotationPeriod = try container.decodeIfPresent(String.self, forKey: .rotationPeriod)
        surfaceWater = try container.decodeIfPresent(String.self, forKey: .surfaceWater)
        edited = try container.decodeIfPresent(String.self, forKey: .edited)
        orbitalPeriod = try container.decodeIfPresent(String.self, forKey: .orbitalPeriod)
        climate = try container.decodeIfPresent(String.self, forKey: .climate)
        diameter = try container.decodeIfPresent(String.self, forKey: .diameter)
        terrain = try container.decodeIfPresent(String.self, forKey: .terrain)
        films = try container.decodeIfPresent([String].self, forKey: .films)
        population = try container.decodeIfPresent(String.self, forKey: .population)
        residents = try container.decodeIfPresent([String].self, forKey: .residents)
        gravity = try container.decodeIfPresent(String.self, forKey: .gravity)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        created = try container.decodeIfPresent(String.self, forKey: .created)
    }
}
