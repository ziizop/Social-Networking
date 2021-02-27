//
//  LoginScreenPresenter.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import Foundation

final class LoginScreenPresenter {
    weak var view: LoginScreenViewInput?
    var interactor: LoginScreenInteractorInput?
    var router: LoginScreenRouterInput?
}

extension LoginScreenPresenter: LoginScreenViewOutput {

    func viewDidLoad() {
        
    }
    
    func tapButton() {
        router?.loginTransition()
    }
    
}

extension LoginScreenPresenter: LoginScreenInteractorOutput {
    
}
