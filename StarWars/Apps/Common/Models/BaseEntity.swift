//
//  BaseEntity.swift
//  StarWars
//
//  Created by Ari Munandar on 04/08/20.
//  Copyright © 2020 CoderLyn. All rights reserved.
//

import Foundation

struct BaseEntity<T: Codable>: Codable {
    enum CodingKeys: String, CodingKey {
        case results
        case next
        case count
    }

    var results: [T]?
    var next: String?
    var count: Int?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        results = try container.decodeIfPresent([T].self, forKey: .results)
        next = try container.decodeIfPresent(String.self, forKey: .next)
        count = try container.decodeIfPresent(Int.self, forKey: .count)
    }
}
