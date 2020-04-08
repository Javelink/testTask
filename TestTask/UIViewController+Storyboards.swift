//
//  UIViewController+Storyboards.swift
//  TestTask
//
//  Created by Javelink on 4/8/20.
//  Copyright © 2020 Javelink. All rights reserved.
//

import UIKit

extension UIViewController {

    class func loadFromStoryboard(_ name: Storyboards) -> Self {
        return instantiateFromStoryboardHelper(name)
    }

    private class func instantiateFromStoryboardHelper<T>(_ name: Storyboards) -> T {
        let storyboard = UIStoryboard(name: name.rawValue, bundle: nil)

        guard let controller = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? T else {
            fatalError("fatalError")
        }

        return controller
    }
}
