//
//  CategoryModel.swift
//  StarWars
//
//  Created by Ari Munandar on 04/08/20.
//  Copyright (c) 2020 ARI MUNANDAR. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar
//              * https://www.youtube.com/channel/UC7jr8DR06tcVR0QKKl6cSNA?view_as=subscriber

import UIKit

struct CategoryModel {	
	struct Request {
        var urlPath: String

		var parameters: [String: Any]? {
			// do someting...
			return nil
		}
	}

    struct Response {    
        var title: String
        var subtitle: String
	}

	struct ViewModel {
		// do someting...
	}
}
