//
//  AllProduct.swift
//  StarWars
//
//  Created by Ari Munandar on 03/08/20.
//  Copyright (c) 2020 ARI MUNANDAR. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar
//              * https://www.youtube.com/channel/UC7jr8DR06tcVR0QKKl6cSNA?view_as=subscriber

import Foundation

public enum AllProduct: Module {
    case home
    case category

    public var routePath: String {
        switch self {
        case .home:
            return "\(Bundle.appName())/Home"
        case .category:
            return "\(Bundle.appName())/Category"
        }
    }
}
