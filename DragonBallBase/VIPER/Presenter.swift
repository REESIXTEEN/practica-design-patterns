//
//  Presenter.swift
//  DragonBallBase
//
//  Created by Pablo Gómez on 19/1/23.
//

import Foundation

protocol AnyPresenter {
    var router: AnyRouter? {get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
    
    func interactorDidLogin(result: String)
    func login()
}

class LoginPresenter: AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor?
    
    var view: AnyView?
    
    func interactorDidLogin(result: String) {
        view?.setResult(result: result)
    }
    
    func login() {
        let data = view?.getData()
        if let email = data?.0 , let password = data?.1 {
            interactor?.login(email: email, password: password)
        }else{
            view?.setResult(result: "email or password invalid")
        }
    }
    
    
}
