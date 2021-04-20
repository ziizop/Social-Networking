//
//  UserCollectedData.swift
//  Social Networking
//
//  Created by Anastas Smekh on 07.03.2021.
//

import UIKit

class UserCollectedData {
    var type: UserPageTypeSection?
    var data: [Any]?
    var heightRow: CGFloat?
    
    init(type: UserPageTypeSection, data:[Any]?, heightRow: CGFloat ) {
        self.type = type
        self.data = data
        self.heightRow = heightRow
    }
}
