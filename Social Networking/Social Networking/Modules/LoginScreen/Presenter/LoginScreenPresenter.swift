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
    
    private var requests: URLRequest?
    private let url = URL(string: "")
}

extension LoginScreenPresenter: LoginScreenViewOutput {

    func viewDidLoad() {
        interactor?.transinReguest()
    }
    
    func transit() {
        router?.loginTransition()
    }
}

extension LoginScreenPresenter: LoginScreenInteractorOutput {
    func trasit(_ request: URLRequest) {
        print("Data: \(request)")
        requests = request
    }
    
    
}
