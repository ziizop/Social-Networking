//
//  ProfilePresenter.swift
//  Social Networking
//
//  Created by Anastas Smekh on 01.03.2021.
//

import Foundation

final class ProfilePresenter {
    weak var view: ProfileViewInput?
    var interactor: ProfileInteractorInput?
    var router: ProfileRouterInput?
}

//MARK: - ProfileViewOutput
extension ProfilePresenter: ProfileViewOutput {
    func viewDidLoad() {
        
    }
    
    
}

//MARK: - ProfileInteractorOutput
extension ProfilePresenter: ProfileInteractorOutput {
    
}
