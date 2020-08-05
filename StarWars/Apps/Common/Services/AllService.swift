//
//  AllService.swift
//  StarWars
//
//  Created by Ari Munandar on 03/08/20.
//  Copyright © 2020 CoderLyn. All rights reserved.
//

import Alamofire
import Foundation

enum AllService: IApiService {
    case categories
    case category(model: CategoryModel.Request)

    var path: String {
        switch self {
        case .categories:
            return baseUrl
        case .category(let model):
            return baseUrl + model.urlPath + "asdasd"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .categories,
             .category:
            return .get
        }
    }

    var parameters: Parameters? {
        switch self {
        case .categories,
             .category:
            return nil
        }
    }

    var headers: HTTPHeaders? {
        switch self {
        case .categories,
             .category:
            return nil
        }
    }

    var encoding: ParameterEncoding {
        /*
         Use URLEncoding.queryString for query type
         */
        switch self {
        case .categories,
             .category:
            return JSONEncoding.default
        }
    }
}
