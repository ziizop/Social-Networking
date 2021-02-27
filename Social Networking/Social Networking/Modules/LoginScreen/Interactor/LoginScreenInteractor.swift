//
//  LoginScreenInteractor.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import Foundation

protocol LoginScreenInteractorOutput: class {
    
}

protocol LoginScreenInteractorInput {
    
}

final class LoginScreenInteractor {
    
    weak var presenter: LoginScreenInteractorOutput?
}

extension LoginScreenInteractor: LoginScreenInteractorInput {
    
}
