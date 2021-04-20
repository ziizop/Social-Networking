//
//  FriendsPresenter.swift
//  Social Networking
//
//  Created by Anastas Smekh on 28.02.2021.
//

import UIKit

final class FriendsPresenter {
    weak var view: FriendsViewInput?
    var interactor: FriendsInteractorInput?
    var router: FriendsRouterInput?
    
    private var friendsArray: [FriendsSortType]? = []
}

//MARK: - FriendsViewOutput
extension FriendsPresenter: FriendsViewOutput {
 
    func viewDidLoad() {
        /*
         Стартовое значения данных!
         */
        interactor?.dataCollection()
    }
    
    func viewWillAppear() {
        /*
         Собираем данные
         */
        interactor?.factoryFriends()
    }
    
    func viewDidAppear() {

    }
    
    func numberOfSections() -> Int {
        FriendsType.allCases.count
    }
    
    func numberOfRowsInSectionAllFriends(section: FriendsType) -> Int {
        friendsArray?[section.rawValue].dataArray.count ?? 0
    }
    
    func cellForRowAtFriends(_ section: FriendsType, _ indextRow: Int) -> FriendsModel? {
        friendsArray?[section.rawValue].dataArray[indextRow]
    }
    
    func titleForHeaderInSection(_ section: FriendsType) -> String? {
        friendsArray?[section.rawValue].title ?? ""
    }
    
    func heightForRowAt(_ section: FriendsType) -> CGFloat {
        friendsArray?[section.rawValue].heightRow ?? 0
    }
}

//MARK: - FriendsInteractorOutput
extension FriendsPresenter: FriendsInteractorOutput {
    
    func friendsAllArray(_ data: [FriendsSortType]?) {
        friendsArray = data
        view?.reloadData()
    }
}
