//
//  LoginScreenInteractor.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import Foundation

protocol LoginScreenInteractorOutput: class {
    func trasit(_ request: URLRequest)
}

protocol LoginScreenInteractorInput {
    func transinReguest()
}

final class LoginScreenInteractor {
    
    weak var presenter: LoginScreenInteractorOutput?
}

extension LoginScreenInteractor: LoginScreenInteractorInput {
    func transinReguest() {
        let api = NetworkongService.shared
        
        api.login { [ weak self ] result in
            guard let self = self else { return }
            switch result {
            case .success(let request):
                self.presenter?.trasit(request)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
      
}
