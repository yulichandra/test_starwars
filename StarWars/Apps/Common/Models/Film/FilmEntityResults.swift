//
//  FilmEntityResults.swift
//
//  Created by Ari Munandar on 04/08/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct FilmEntityResults: Codable {
    enum CodingKeys: String, CodingKey {
        case url
        case edited
        case vehicles
        case starships
        case created
        case species
        case characters
        case planets
        case releaseDate = "release_date"
        case openingCrawl = "opening_crawl"
        case episodeId = "episode_id"
        case title
        case director
        case producer
    }

    var url: String?
    var edited: String?
    var vehicles: [String]?
    var starships: [String]?
    var created: String?
    var species: [String]?
    var characters: [String]?
    var planets: [String]?
    var releaseDate: String?
    var openingCrawl: String?
    var episodeId: Int?
    var title: String?
    var director: String?
    var producer: String?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        edited = try container.decodeIfPresent(String.self, forKey: .edited)
        vehicles = try container.decodeIfPresent([String].self, forKey: .vehicles)
        starships = try container.decodeIfPresent([String].self, forKey: .starships)
        created = try container.decodeIfPresent(String.self, forKey: .created)
        species = try container.decodeIfPresent([String].self, forKey: .species)
        characters = try container.decodeIfPresent([String].self, forKey: .characters)
        planets = try container.decodeIfPresent([String].self, forKey: .planets)
        releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        openingCrawl = try container.decodeIfPresent(String.self, forKey: .openingCrawl)
        episodeId = try container.decodeIfPresent(Int.self, forKey: .episodeId)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        director = try container.decodeIfPresent(String.self, forKey: .director)
        producer = try container.decodeIfPresent(String.self, forKey: .producer)
    }
}
