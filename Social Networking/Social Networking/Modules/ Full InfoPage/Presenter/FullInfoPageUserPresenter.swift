//
//  FullInfoPageUserPresenter.swift
//  Social Networking
//
//  Created by Anastas Smekh on 18.03.2021.
//

import Foundation

final class FullInfoPageUserPresenter {
    weak var view: FullInfoPageUserViewControllerInput?
    var interactor: FullInfoPageUserInteractorInput?
    var router: FullInfoPageUserRouterInput?
}

//MARK: - FullInfoPageUserViewControllerOutput
extension FullInfoPageUserPresenter: FullInfoPageUserViewControllerOutput {
    
}

// MARK: - FullInfoPageUserInteractorOutput
extension FullInfoPageUserPresenter: FullInfoPageUserInteractorOutput {
    
}
