//
//  FriendsSortType.swift
//  Social Networking
//
//  Created by Anastas Smekh on 06.03.2021.
//

import UIKit

class FriendsSortType {
    var title: String?
    var heightRow: CGFloat?
    var dataArray: [FriendsModel]
    
    init (data: [FriendsModel], title: String?, heightRow: CGFloat) {
        self.dataArray = data
        self.title = title
        self.heightRow = heightRow
    }
}
