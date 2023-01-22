//
//  LoginViewController.swift
//  DragonBallBase
//
//  Created by Pablo Gómez on 20/1/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    var mainView: LoginView {self.view as! LoginView}
    var emailText: UITextField?
    var passText: UITextField?
    var loginButton: UIButton?
    var resultLabel: UILabel?
    
    var viewModel: LoginViewModel?
    
    override func loadView() {
        let loginView = LoginView()
        
        // Nose si esto es una mala práctica, pero funciona sin los gets
        emailText = loginView.emailField
        passText = loginView.passwordField
        loginButton = loginView.loginButton
        resultLabel = loginView.resultLabel
        
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = LoginViewModel()
        
        loginButton?.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    @objc
    func loginTapped(sender: UIButton) {        
        viewModel?.login(email: emailText?.text, password: passText?.text){ response in
            DispatchQueue.main.async {
                self.resultLabel?.text = response
            }
        }
    }
    
    
}
