//
//  HomeModule.swift
//  StarWars
//
//  Created by Ari Munandar on 03/08/20.
//  Copyright (c) 2020 ARI MUNANDAR. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar
//              * https://www.youtube.com/channel/UC7jr8DR06tcVR0QKKl6cSNA?view_as=subscriber

import UIKit

class HomeModule: IModule {
    let appRouter: IAppRouter
    private var router: HomeRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = HomeRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}
