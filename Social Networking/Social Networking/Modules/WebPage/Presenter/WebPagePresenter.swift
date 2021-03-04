//
//  WebPagePresenter.swift
//  Social Networking
//
//  Created by Anastas Smekh on 01.03.2021.
//

import Foundation

final class WebPagePresenter{
    weak var view: WebPageViewInput?
    var interactor: WebPageInteractorInput?
    var router: WebPageRouterInput?
    
    private var requests: URLRequest?
    private let url = URL(string: "")
    private var tokenA: String?
    private var newsArray: NewsAllData?
}

extension WebPagePresenter: WebPageViewOutput {

    func viewDidLoad() {
        interactor?.transinReguest()
    }
    
    func viewDidAppear() {
        
    }
    
    func loadingRequestForWeb() -> URLRequest {
        guard let data = requests else { return URLRequest(url: url!) }
        return data 
    }
    
    func transitionData(_ data: String) {
        interactor?.dataSeparationsFromSignAndSave(data)
    }
    
    func transition() {
        router?.startTransit()
    }
}

extension WebPagePresenter: WebPageInteractorOutput {

    func requestForLogin(_ request: URLRequest) {
        requests = request
    }
}

