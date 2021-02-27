//
//  UIActivityIndicatorView+Extension.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import UIKit

extension UIActivityIndicatorView {
    
    static var indicator: UIActivityIndicatorView = {
        
        var ai: UIActivityIndicatorView
        
        if #available(iOS 13.0, *) {
            ai = UIActivityIndicatorView(style: .medium)
        } else {
            ai = UIActivityIndicatorView(style: .gray)
        }
        
        ai.hidesWhenStopped = true
        return ai
    }()
    
}
