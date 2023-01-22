//
//  Interactor.swift
//  DragonBallBase
//
//  Created by Pablo Gómez on 19/1/23.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? {get set}
    
    func login(email: String, password: String)
}

class Logininteractor: AnyInteractor {
    
    var presenter: AnyPresenter? = LoginPresenter()
    
    func login(email: String, password: String) {
        ApiClient(token: "").login(user: email, password: password) { token, error in
            var result = ""
            if let token = token {
                result = token
            } else {
                result = error?.localizedDescription ?? ""
            }
            self.presenter?.interactorDidLogin(result: result)
        }
    }
}
