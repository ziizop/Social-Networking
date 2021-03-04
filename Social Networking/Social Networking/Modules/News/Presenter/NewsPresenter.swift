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

    private var newsArry: [NewsResponse] = []
}

extension NewsPresenter: NewsViewOutput {
  
    func viewDidLoad() {
        interactor?.factoryNews()
    }
    
    func viewWillAppear() {
        
    }
    
    func viewDidAppear() {
        
    }
    
    func numberOfSections() -> Int {
        TypeSection.allCases.count
    }
    
    func numberOfRowsInSection() -> Int {
        newsArry.count
    }
    
    func cellForRowAt(indexPath: Int) -> NewsResponse? {
        newsArry[indexPath]
    }
    
}

extension NewsPresenter: NewsInteractorOutput {
    func newsDataJson(_ data: [NewsResponse]) {
        newsArry = data
        print("NEWS DATA : \(newsArry)")
        view?.reloadData()
    }
}
