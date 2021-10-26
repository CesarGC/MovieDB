//
//  UIViewController.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import UIKit

extension UIViewController {
    
    class var storyboardID: String {
        return "\(self)"
    }
    
    static func instantiate(from: AppStoryboard) -> Self {
        return from.viewController(viewControllerClass: self)
    }
}
