//
//  HomeViewModel.swift
//  StarWars
//
//  Created by Ari Munandar on 03/08/20.
//  Copyright (c) 2020 ARI MUNANDAR. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar
//              * https://www.youtube.com/channel/UC7jr8DR06tcVR0QKKl6cSNA?view_as=subscriber

import ReactiveKit
import UIKit

protocol HomeViewModelInputs {
    // do someting...
}

protocol HomeViewModelOutputs {
    var categories: [Category] { get }
}

protocol IHomeViewModelType: HomeViewModelInputs, HomeViewModelOutputs {
    var input: HomeViewModelInputs { get }
    var output: HomeViewModelOutputs { get }
}

extension IHomeViewModelType {
    var input: HomeViewModelInputs {
        return self
    }

    var output: HomeViewModelOutputs {
        return self
    }
}

class HomeViewModel: IHomeViewModelType {
    private var parameters: [String: Any]?
    private var manager: IHomeManager {
        return HomeManager()
    }

    init(parameters: [String: Any]?) {
        self.parameters = parameters
    }

    var categories: [Category] {
        return [
            .films,
            .people,
            .planets,
            .species,
            .starships,
            .vehicles
        ]
    }
}

extension HomeViewModel {
    // do someting...
}

extension HomeViewModel {
    // do someting...
}
