//
//  LoginScreenRouter.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import Foundation

protocol LoginScreenRouterInput {
    func loginTransition()
}

final class LoginScreenRouter {
    weak var view: LoginScreenViewInput?
}

extension LoginScreenRouter: LoginScreenRouterInput {
    func loginTransition() {
        let web = WebPageAssembly.assembly()
        web.modalPresentationStyle = .fullScreen
        view?.navigationController?.pushViewController(web, animated: true)
    }
}
