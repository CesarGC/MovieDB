//
//  UIApplication.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//
import UIKit

extension UIApplication {
    
    static var loginAnimation: UIView.AnimationOptions = .transitionFlipFromRight
    static var logoutAnimation: UIView.AnimationOptions = .transitionCrossDissolve
    
    public static func setRootView(_ viewController: UIViewController,
                                   options: UIView.AnimationOptions = .transitionFlipFromRight,
                                   animated: Bool = true,
                                   duration: TimeInterval = 0.5,
                                   completion: (() -> Void)? = nil) {
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        
        guard animated else {
            keyWindow?.rootViewController = viewController
            return
        }
        
        UIView.transition(with: keyWindow!, duration: duration, options: options, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            DispatchQueue.main.async {
        
                var startingYPos = viewController.view.safeAreaInsets.top
                if(startingYPos == 0) {
                    startingYPos = 20
                }
            viewController.view.frame = CGRect(x: viewController.view.frame.origin.x, y:startingYPos, width: viewController.view.frame.size.width, height: viewController.view.frame.size.height-startingYPos)
            }
            keyWindow?.rootViewController = viewController
            UIView.setAnimationsEnabled(oldState)
        }) { _ in
            completion?()
        }
    }
}
