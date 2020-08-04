//
//  PeopleEntityResults.swift
//
//  Created by Ari Munandar on 04/08/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct PeopleEntityResults: Codable {
    enum CodingKeys: String, CodingKey {
        case gender
        case url
        case homeworld
        case starships
        case edited
        case eyeColor = "eye_color"
        case skinColor = "skin_color"
        case films
        case vehicles
        case height
        case hairColor = "hair_color"
        case created
        case birthYear = "birth_year"
        case name
        case mass
    }

    var gender: String?
    var url: String?
    var homeworld: String?
    var starships: [String]?
    var edited: String?
    var eyeColor: String?
    var skinColor: String?
    var films: [String]?
    var vehicles: [String]?
    var height: String?
    var hairColor: String?
    var created: String?
    var birthYear: String?
    var name: String?
    var mass: String?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        gender = try container.decodeIfPresent(String.self, forKey: .gender)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        homeworld = try container.decodeIfPresent(String.self, forKey: .homeworld)
        starships = try container.decodeIfPresent([String].self, forKey: .starships)
        edited = try container.decodeIfPresent(String.self, forKey: .edited)
        eyeColor = try container.decodeIfPresent(String.self, forKey: .eyeColor)
        skinColor = try container.decodeIfPresent(String.self, forKey: .skinColor)
        films = try container.decodeIfPresent([String].self, forKey: .films)
        vehicles = try container.decodeIfPresent([String].self, forKey: .vehicles)
        height = try container.decodeIfPresent(String.self, forKey: .height)
        hairColor = try container.decodeIfPresent(String.self, forKey: .hairColor)
        created = try container.decodeIfPresent(String.self, forKey: .created)
        birthYear = try container.decodeIfPresent(String.self, forKey: .birthYear)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        mass = try container.decodeIfPresent(String.self, forKey: .mass)
    }
}
