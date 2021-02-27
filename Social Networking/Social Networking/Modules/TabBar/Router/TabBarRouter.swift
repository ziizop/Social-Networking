//
//  TabBarRouter.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import Foundation

protocol TabBarRouterInput {
    
}

final class TabBarRouter {
    weak var view: TabBarViewInput?
}

extension TabBarRouter: TabBarRouterInput {
    
}
