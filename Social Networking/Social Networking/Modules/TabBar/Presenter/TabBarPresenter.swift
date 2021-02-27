//
//  File.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import Foundation

final class TabBarPresenter {
    weak var view: TabBarViewInput?
    var interactor: TabBarInteractorInput?
    var router: TabBarRouterInput?
}

extension TabBarPresenter: TabBarViewOutput {
    func viewDidLoad() {
        
    }
}

extension TabBarPresenter: TabBarInteractorOutput {
    
}
