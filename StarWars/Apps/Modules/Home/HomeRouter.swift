//
//  HomeRouter.swift
//  StarWars
//
//  Created by Ari Munandar on 03/08/20.
//  Copyright (c) 2020 ARI MUNANDAR. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar
//              * https://www.youtube.com/channel/UC7jr8DR06tcVR0QKKl6cSNA?view_as=subscriber

import UIKit

protocol IHomeRouter {
    func showCategory(category: Category)
}

class HomeRouter: IHomeRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> HomeViewController {
        let bundle = Bundle(for: type(of: self))
        let view = HomeViewController(nibName: "HomeViewController", bundle: bundle)
        let viewModel = HomeViewModel(parameters: parameters)
        view.viewModel = viewModel
        view.router = self
        return view
    }
}

extension HomeRouter {
    func showCategory(category: Category) {
        appRouter.presentModule(module: AllProduct.category, parameters: ["category": category])
    }
}
