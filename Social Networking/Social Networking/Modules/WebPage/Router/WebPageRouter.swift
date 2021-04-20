//
//  WebPageRouter.swift
//  Social Networking
//
//  Created by Anastas Smekh on 01.03.2021.
//

import Foundation

protocol WebPageRouterInput {
    func startTransit()
}

final class WebPageRouter {
    weak var view: WebPageViewInput?
}

extension WebPageRouter: WebPageRouterInput {
    func startTransit() {
        let tabBarAssembly = TabBarAssembly.assembly()
        tabBarAssembly.modalPresentationStyle = .fullScreen
        view?.navigationController?.present(tabBarAssembly, animated: true)
    }
}
