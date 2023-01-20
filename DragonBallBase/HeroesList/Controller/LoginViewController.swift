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
    
    //var viewModel:
    
    override func loadView() {
        let loginView = LoginView()
        
        emailText = loginView.getEmail()
        
        /*emailText = loginView.email
        passText = loginView.password
        loginButton = loginView.loginButton
        resultLabel = loginView.resultLabel*/
        
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //viewModel = HeroeListViewModel()
        
        loginButton?.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
    }
    
    @objc
    func loginTapped(sender: UIButton) {
        
    }
    
    
}
