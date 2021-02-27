//
//  UITableViewCell+Extension.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import UIKit

extension UITableViewCell {
    class var reuseIdentifier: String {
        return String(describing: self)
    }
}
