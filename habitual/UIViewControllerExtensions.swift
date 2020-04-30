//
//  UIViewControllerExtensions.swift
//  habitual
//
//  Created by Anika Morris on 2/24/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import UIKit

extension UIViewController {
    static func instantiate() -> Self {
        return self.init(nibName: String(describing: self), bundle: nil)
    }
}
