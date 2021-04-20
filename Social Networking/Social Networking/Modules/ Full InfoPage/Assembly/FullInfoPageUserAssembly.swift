//
//  FullInfoPageUserAssembly.swift
//  Social Networking
//
//  Created by Anastas Smekh on 18.03.2021.
//

import UIKit

final class FullInfoPageUserAssembly {
    static func assembly(_ data: UserProfile) -> UIViewController {
        let view = FullInfoPageUserViewController(data)
        let interactor = FullInfoPageUserInteractor()
        let presenter = FullInfoPageUserPresenter()
        let router = FullInfoPageUserRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        let nav = UINavigationController(rootViewController: view)
        return nav
    }
}
