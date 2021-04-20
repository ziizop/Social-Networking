//
//  ProfileRouter.swift
//  Social Networking
//
//  Created by Anastas Smekh on 01.03.2021.
//

import Foundation

protocol ProfileRouterInput: class {
    func transitInLogin()
    func showModalPage(_ data: UserProfile)
}

final class ProfileRouter {
    weak var view: ProfileViewInput?
}

//MARK: - ProfileRouterInput
extension ProfileRouter: ProfileRouterInput {
    func transitInLogin() {
        let loginVC = LoginScreenAssembly.assembly()
        loginVC.modalPresentationStyle = .fullScreen
        view?.navigationController?.present(loginVC, animated: true, completion: {
            AuthManager.shared.removeCookie()
        })
    }
    
    func showModalPage(_ data: UserProfile) {
        let modalVC = FullInfoPageUserAssembly.assembly(data)
        view?.navigationController?.present(modalVC, animated: true)
    }
}
