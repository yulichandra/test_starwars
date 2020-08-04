//
//  SpeciesEntityResults.swift
//
//  Created by Ari Munandar on 04/08/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct SpeciesEntityResults: Codable {
    enum CodingKeys: String, CodingKey {
        case created
        case skinColors = "skin_colors"
        case people
        case eyeColors = "eye_colors"
        case designation
        case homeworld
        case averageLifespan = "average_lifespan"
        case edited
        case classification
        case hairColors = "hair_colors"
        case averageHeight = "average_height"
        case language
        case name
        case films
        case url
    }

    var created: String?
    var skinColors: String?
    var people: [String]?
    var eyeColors: String?
    var designation: String?
    var homeworld: String?
    var averageLifespan: String?
    var edited: String?
    var classification: String?
    var hairColors: String?
    var averageHeight: String?
    var language: String?
    var name: String?
    var films: [String]?
    var url: String?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        created = try container.decodeIfPresent(String.self, forKey: .created)
        skinColors = try container.decodeIfPresent(String.self, forKey: .skinColors)
        people = try container.decodeIfPresent([String].self, forKey: .people)
        eyeColors = try container.decodeIfPresent(String.self, forKey: .eyeColors)
        designation = try container.decodeIfPresent(String.self, forKey: .designation)
        homeworld = try container.decodeIfPresent(String.self, forKey: .homeworld)
        averageLifespan = try container.decodeIfPresent(String.self, forKey: .averageLifespan)
        edited = try container.decodeIfPresent(String.self, forKey: .edited)
        classification = try container.decodeIfPresent(String.self, forKey: .classification)
        hairColors = try container.decodeIfPresent(String.self, forKey: .hairColors)
        averageHeight = try container.decodeIfPresent(String.self, forKey: .averageHeight)
        language = try container.decodeIfPresent(String.self, forKey: .language)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        films = try container.decodeIfPresent([String].self, forKey: .films)
        url = try container.decodeIfPresent(String.self, forKey: .url)
    }
}
