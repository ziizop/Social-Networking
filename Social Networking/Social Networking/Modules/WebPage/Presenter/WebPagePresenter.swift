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
}

extension WebPagePresenter: WebPageViewOutput {

    func viewDidLoad() {
        interactor?.transinReguest()
    }
    
    func viewDidAppear() {
        
    }
    
    /*
     Передаю запрос на view
     */
    func loadingRequestForWeb() -> URLRequest {
        guard let data = requests else { return URLRequest(url: url!) }
        return data 
    }
    
    /*
     Передаю полученные после авторизации в  iteractor
     */
    func transitionData(_ data: String) {
        interactor?.dataSeparationsFromSignAndSave(data)
    }
    
    /*
      Передаем переход на view, с router
     */
    func transition() {
        router?.startTransit()
    }
}

extension WebPagePresenter: WebPageInteractorOutput {
    /*
     Получаем  запрос и передаем на view
     */
    func requestForLogin(_ request: URLRequest) {
        requests = request
    }
}

