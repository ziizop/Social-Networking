//
//  BaseViewController.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    
    private  var activitityIndicator = UIActivityIndicatorView.indicator
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()

        // Do any additional setup after loading the view.
    }
    
    private func setBackgroundColor() {
        
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
    }
    
    private func subscribeNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func showActivityIndicator() {
        navigationItem.titleView = activitityIndicator
        activitityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        activitityIndicator.stopAnimating()
        navigationItem.titleView = nil
    }
    
}

    // MARK: - Actions

extension BaseViewController {
    
    @objc func keyboardWillShow(_ notification: Notification) {
        print("\(#file) \(#function)")
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        print("\(#file) \(#function)")
    }
}
