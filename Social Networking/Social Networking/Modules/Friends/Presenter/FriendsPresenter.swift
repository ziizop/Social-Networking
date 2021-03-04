//
//  FriendsPresenter.swift
//  Social Networking
//
//  Created by Anastas Smekh on 28.02.2021.
//

import Foundation

final class FriendsPresenter {
    weak var view: FriendsViewInput?
    var interactor: FriendsInteractorInput?
    var router: FriendsRouterInput?
}

//MARK: - FriendsViewOutput
extension FriendsPresenter: FriendsViewOutput {
    func viewDidLoad() {
        
    }
}
//MARK: - FriendsInteractorOutput
extension FriendsPresenter: FriendsInteractorOutput {
    
}
