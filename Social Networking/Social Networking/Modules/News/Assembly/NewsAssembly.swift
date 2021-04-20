//
//  NewsAssembly.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import UIKit

final class NewsAssembly {
    static func assembly() -> UIViewController {
        
        let view = NewsView()
        let interactor = NewsInteractor()
        let presenter = NewsPresenter()
        let router = NewsRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor  = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        let navC = UINavigationController(rootViewController: view)
        return navC
    }
}
