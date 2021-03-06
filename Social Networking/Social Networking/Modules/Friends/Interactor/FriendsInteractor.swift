//
//  FriendsInteractor.swift
//  Social Networking
//
//  Created by Anastas Smekh on 28.02.2021.
//

import UIKit

protocol FriendsInteractorOutput:class {
    /*
     Передача данных на presenter
     */
    func friendsAllArray(_ data: [FriendsSortType]?)
}

protocol FriendsInteractorInput {
    /*
     Сборка данных с сервера
     */
    func factoryFriends()
    func dataCollection()
}

final class FriendsInteractor {
    weak var presenter: FriendsInteractorOutput?
    var data: [FriendsSortType]?
}

extension FriendsInteractor: FriendsInteractorInput {
    /*
     Загружаем данные
     */
    func factoryFriends() {
        var dataArray: [FriendsModel] = []
        NetworkingService.shared.friendsReques { [ weak self ] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                print("Данные с сервера: \(data)")
                dataArray = data
                let arrayBest = FriendsSortType(data: Array(dataArray[0...5]), title: "Важные друзья", heightRow: 80)
                let arrayAll = FriendsSortType(data: dataArray, title: "друзья \(data.count)", heightRow: 80)
                let dataArrays = [arrayBest, arrayAll]
                self.presenter?.friendsAllArray(dataArrays)
                self.data = dataArrays
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    /*
     Собираю данные & дефолтное значения
     */
    func dataCollection() {
        presenter?.friendsAllArray(data)
    }
}
