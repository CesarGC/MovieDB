//
//  BaseViewController.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    var loadingView: UIView!
    var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.loadingView = UIView()
            self.loadingView.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            self.loadingView.center = self.view.center
            self.loadingView.backgroundColor = UIColor.gray
            self.loadingView.alpha = 0.75
            self.loadingView.clipsToBounds = true
            self.loadingView.layer.cornerRadius = 12
            
            self.spinner = UIActivityIndicatorView(style:.large)
            self.spinner.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
            self.spinner.center = CGPoint(x:self.loadingView.bounds.size.width / 2, y:self.loadingView.bounds.size.height / 2)
            self.spinner.color = UIColor.white
            self.loadingView.addSubview(self.spinner)
            
            let keyWindow = UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .compactMap({$0 as? UIWindowScene})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first
            keyWindow?.addSubview(self.loadingView)
            self.spinner.startAnimating()
        }
    }
    
    func hideActivityIndicator() {
        if(self.loadingView != nil) {
            
            UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: {
                    self.loadingView.alpha = 0.0
                }) { completion in
                self.loadingView.removeFromSuperview()
                self.spinner = nil
                self.loadingView = nil
            }
            
        }
    }
    
    func showAlertController(title: String, message: String) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Ok", style: .default) { (action) in
            
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
