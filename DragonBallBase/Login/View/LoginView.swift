//
//  LoginView.swift
//  DragonBallBase
//
//  Created by Pablo Gómez on 20/1/23.
//

import Foundation
import UIKit

class LoginView: UIView {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        backgroundColor = .white
        addSubview(loginLabel)
        addSubview(emailField)
        addSubview(passwordField)
        addSubview(loginButton)
        addSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            loginLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            loginLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            emailField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 8),
            emailField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            emailField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            emailField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 32),
            passwordField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            passwordField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            passwordField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 32),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            resultLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 64),
            resultLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            resultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            resultLabel.heightAnchor.constraint(equalToConstant: 200),
            
        ])
    }
    
    func getEmail() -> UITextField {
        return emailField
    }
    
}
