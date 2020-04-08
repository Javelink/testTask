//
//  UIImage+Utils.swift
//  TestTask
//
//  Created by Javelink on 4/8/20.
//  Copyright © 2020 Javelink. All rights reserved.
//

import UIKit

enum ImagesSystem: String {
    case film = "film"
    case folder = "folder"
}

extension UIImage {

    class func imageSystem(_ name: ImagesSystem, pointSize: CGFloat) -> UIImage {
        
        guard let systemImage = UIImage(systemName: name.rawValue,
                                        withConfiguration: UIImage.SymbolConfiguration(pointSize: pointSize,
                                                                                       weight: .bold)) else {
            fatalError("fatal error with image")
        }
        
        return systemImage
    }
}
