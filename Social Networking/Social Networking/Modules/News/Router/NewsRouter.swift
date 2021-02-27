//
//  NewsRouter.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import Foundation

protocol NewsRouterInput {
    
}

final class NewsRouter {
    weak var view: NewsViewInput?
}

extension NewsRouter: NewsRouterInput {
    
}
