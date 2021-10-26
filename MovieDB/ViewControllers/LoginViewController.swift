//
//  LoginViewController.swift
//  MovieDB
//
//  Created by César García on 25/10/21.
//

import UIKit

class LoginViewController: UIViewController, LoginViewModelDelegate {

    @IBOutlet weak var lblMessageError: UILabel!
    @IBOutlet weak var txtFieldPass: UITextField!
    @IBOutlet weak var txtFieldUserName: UITextField!
    
    var viewModel: LoginViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = LoginViewModel(delegate: self)
        // Do any additional setup after loading the view.
    }

    @IBAction func actionSignIn(_ sender: Any) {
        self.viewModel.loginUser(self.txtFieldUserName.text!, self.txtFieldPass.text!)
    }
    
    func didReceiveLoginResponse() {
        let viewController = UINavigationController.init(rootViewController: MainViewController.instantiate(from: .Main))
        UIApplication.setRootView(viewController)
    }
    
    func didReceiveError(message: String, title: String) {
        DispatchQueue.main.async {
            self.lblMessageError.text = message
        }
    }
    
}
