//
//  CategoryManager.swift
//  StarWars
//
//  Created by Ari Munandar on 04/08/20.
//  Copyright (c) 2020 ARI MUNANDAR. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar
//              * https://www.youtube.com/channel/UC7jr8DR06tcVR0QKKl6cSNA?view_as=subscriber

import Alamofire
import Foundation

protocol ICategoryManager: class {
    func processFetchCategory<T: Decodable>(model: CategoryModel.Request, completion: ((AResult<BaseEntity<T>, GeneralError>) -> Void)?)
}

class CategoryManager: ICategoryManager {
    func processFetchCategory<T>(model: CategoryModel.Request, completion: ((AResult<BaseEntity<T>, GeneralError>) -> Void)?) where T : Decodable {
        AllAPI.category(model: model).request(completion: completion)
    }
}
