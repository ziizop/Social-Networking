//
//  ProfileAssembly.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import UIKit

final class ProfileAssembly {
    static func assembly() -> UIViewController {
        let view = ProfileView()
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter()
        let router = ProfileRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        let navC = UINavigationController(rootViewController: view)
        return navC
    }
}
