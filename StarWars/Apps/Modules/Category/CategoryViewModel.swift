//
//  CategoryViewModel.swift
//  StarWars
//
//  Created by Ari Munandar on 04/08/20.
//  Copyright (c) 2020 ARI MUNANDAR. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar
//              * https://www.youtube.com/channel/UC7jr8DR06tcVR0QKKl6cSNA?view_as=subscriber

import Alamofire
import ReactiveKit
import UIKit

protocol CategoryViewModelInputs {
    func onViewDidLoad()
}

protocol CategoryViewModelOutputs {
    var categoryTitle: String? { get }
    var categoryData: [(String, String)] { get }
    var onSuccessFetchingCategory: Signal<Void, Never> { get }
}

protocol ICategoryViewModelType: CategoryViewModelInputs, CategoryViewModelOutputs {
    var input: CategoryViewModelInputs { get }
    var output: CategoryViewModelOutputs { get }
}

extension ICategoryViewModelType {
    var input: CategoryViewModelInputs {
        return self
    }

    var output: CategoryViewModelOutputs {
        return self
    }
}

class CategoryViewModel: ICategoryViewModelType {
    private var parameters: [String: Any]?
    private var manager: ICategoryManager {
        return CategoryManager()
    }

    private var categoryDataObject: [(String, String)] = []
    private let onSuccessFetchingCategorySubject = Subject<Void, Never>()

    init(parameters: [String: Any]?) {
        self.parameters = parameters
    }
}

extension CategoryViewModel {
    func onViewDidLoad() {
        guard let category = parameters?["category"] as? Category else { return }
        let request = CategoryModel.Request(urlPath: category.urlPath)

        switch category {
        case .films:
            fetchCategory(by: FilmEntityResults.self, request: request, completion: { films in
                films?.forEach { film in
                    if let title = film.title, let subtitle = film.releaseDate {
                        self.categoryDataObject.append((title, "Release Date on \(subtitle)"))
                    }
                }
            })
        case .people:
            fetchCategory(by: PeopleEntityResults.self, request: request, completion: { peoples in
                peoples?.forEach { people in
                    if let title = people.name, let subtitle = people.gender {
                        self.categoryDataObject.append((title, "Gender \(subtitle)"))
                    }
                }
            })
        case .planets:
            fetchCategory(by: PlanetEntityResults.self, request: request, completion: { planets in
                planets?.forEach { planet in
                    if let title = planet.name, let subtitle = planet.population {
                        self.categoryDataObject.append((title, "Population \(subtitle)"))
                    }
                }
            })
        case .species:
            fetchCategory(by: SpeciesEntityResults.self, request: request, completion: { species in
                species?.forEach { species in
                    if let title = species.name, let subtitle = species.designation {
                        self.categoryDataObject.append((title, "Designation \(subtitle)"))
                    }
                }
            })
        case .starships:
            fetchCategory(by: StarshipEntityResults.self, request: request, completion: { starships in
                starships?.forEach { starship in
                    if let title = starship.name, let subtitle = starship.manufacturer {
                        self.categoryDataObject.append((title, "Manufacturer \(subtitle)"))
                    }
                }
            })
        case .vehicles:
            fetchCategory(by: VehicleEntityResults.self, request: request, completion: { vehicles in
                vehicles?.forEach { vehicle in
                    if let title = vehicle.name, let subtitle = vehicle.manufacturer {
                        self.categoryDataObject.append((title, "Manufacturer \(subtitle)"))
                    }
                }
            })
        }
    }

    private func fetchCategory<T: Codable>(by entity: T.Type, request: CategoryModel.Request, completion: @escaping ([T]?) -> Void) {
        manager.processFetchCategory(model: request) { [weak self] (result: AResult<BaseEntity<T>, GeneralError>) in
            switch result {
            case .success(let data):
                completion(data.results)
                self?.onSuccessFetchingCategorySubject.send()
            case .failure(let error):
                print("ERROR MESSAGE: ", error.message)
            }
        }
    }
}

extension CategoryViewModel {
    var categoryTitle: String? {
        guard let category = parameters?["category"] as? Category else { return nil }
        return category.title
    }

    var categoryData: [(String, String)] {
        return categoryDataObject
    }

    var onSuccessFetchingCategory: Signal<Void, Never> {
        return onSuccessFetchingCategorySubject.toSignal()
    }
}
