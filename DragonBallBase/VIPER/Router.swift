//
//  Router.swift
//  DragonBallBase
//
//  Created by Pablo Gómez on 19/1/23.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter{
    var entry: EntryPoint? {get}
    static func start() -> AnyRouter
}

class LoginRouter: AnyRouter {
    var entry: EntryPoint?
    
    static func start() -> AnyRouter{
        let router = LoginRouter()
        
        var view: AnyView = LoginViperViewController()
        var presenter: AnyPresenter = LoginPresenter()
        var interactor: AnyInteractor = Logininteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.entry = view as? EntryPoint
        
        return router
    }
}
