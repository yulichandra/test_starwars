//
//  Extension+Bundle.swift
//  StarWars
//
//  Created by Ari Munandar on 03/08/20.
//  Copyright © 2020 CoderLyn. All rights reserved.
//

import Foundation

extension Bundle {
    static func appName() -> String {
        guard let dictionary = Bundle.main.infoDictionary else {
            return ""
        }

        if let bundleId = dictionary["PRODUCT_BUNDLE_IDENTIFIER"] as? String {
            return bundleId
        } else {
            return ""
        }
    }
}
