//
//  WebPageInteractor.swift
//  Social Networking
//
//  Created by Anastas Smekh on 01.03.2021.
//

import Foundation

protocol WebPageInteractorOutput: class {
    func requestForLogin(_ request: URLRequest)
}

protocol WebPageInteractorInput {
    func dataSeparationsFromSignAndSave(_ data: String)
    func transinReguest()
}

final class WebPageInteractor {
    weak var presenter: WebPageInteractorOutput?
}

extension WebPageInteractor: WebPageInteractorInput {
    
    func transinReguest() {
        let api = NetworkongService.shared
        
        api.login { [ weak self ] result in
            guard let self = self else { return }
            switch result {
            case .success(let request):
                print(request)
                self.presenter?.requestForLogin(request)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func dataSeparationsFromSignAndSave(_ data: String) {
        let params = data
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        print("ФРАГМЕНТ: \n  \(params)")
        
        guard let token = params["access_token"],
              let userIdString = params["user_id"],
              let id = Int(userIdString) else { return }
        
        let userData = PrimaryUserData(token: token, userId: userIdString)
        AuthManager.shared.sevaDataUsersSing(userData)
    }
}
