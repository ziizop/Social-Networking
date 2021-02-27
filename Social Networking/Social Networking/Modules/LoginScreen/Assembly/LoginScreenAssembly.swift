//
//  LoginScreenAssembly.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import UIKit

final class LoginScreenAssembly {
    
    static func assembly() -> UIViewController {
        let view = LoginScreenView()
        let interactor = LoginScreenInteractor()
        let presenter = LoginScreenPresenter()
        let router = LoginScreenRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        let navigatorController = UINavigationController(rootViewController: view)
        
        return navigatorController
    }
}
