//
//  View.swift
//  DragonBallBase
//
//  Created by Pablo Gómez on 19/1/23.
//

import Foundation
import UIKit


protocol AnyView {
    var presenter: AnyPresenter? {get set}
    func setResult(result: String)
    func getData() -> (String?, String?)
}


class LoginViperViewController: UIViewController, AnyView {
    var presenter: AnyPresenter?
    
    let loginLabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailField = {
        let emailText = UITextField()
        emailText.placeholder = "email"
        emailText.backgroundColor = .systemGray5
        emailText.borderStyle = .roundedRect
        emailText.translatesAutoresizingMaskIntoConstraints = false
        return emailText
    }()
    
    let passwordField = {
        let passText = UITextField()
        passText.placeholder = "password"
        passText.backgroundColor = .systemGray5
        passText.borderStyle = .roundedRect
        passText.isSecureTextEntry = true
        passText.textContentType = .password
        passText.translatesAutoresizingMaskIntoConstraints = false
        return passText
    }()
    
    let loginButton = {
        let button = UIButton(configuration: UIButton.Configuration.filled())
        button.setTitle("Sign in", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let resultLabel = {
        let result = UILabel()
        //result.backgroundColor = .red
        result.numberOfLines = 0
        result.textAlignment = .center
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(loginLabel)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(resultLabel)
        setUpViews()
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    func setUpViews(){
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            loginLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            emailField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 8),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            emailField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 32),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            passwordField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 32),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            resultLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 64),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            resultLabel.heightAnchor.constraint(equalToConstant: 200),
            
        ])
    }
    
    func setResult(result: String) {
        resultLabel.text = result
    }
    
    func getData() -> (String?, String?) {
        return (emailField.text, passwordField.text)
    }
    
    @objc func loginTapped() {
        presenter?.login()
    }
    
}
