//
//  NewsPresenter.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import Foundation

final class NewsPresenter {
    weak var view: NewsViewInput?
    var interactor: NewsInteractorInput?
    var router: NewsRouterInput?
}

extension NewsPresenter: NewsViewOutput {
    func viewDidLoad() {
        
    }
}

extension NewsPresenter: NewsInteractorOutput {
    
}
