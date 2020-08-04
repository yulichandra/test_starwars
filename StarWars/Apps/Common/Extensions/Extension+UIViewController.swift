//
//  Extension+UIViewController.swift
//  StarWars
//
//  Created by Ari Munandar on 03/08/20.
//  Copyright © 2020 CoderLyn. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    var moduleId: String {
        return Bundle.appName() + "/" + String(describing: type(of: self)).replacingOccurrences(of: "ViewController", with: "")
    }
}
