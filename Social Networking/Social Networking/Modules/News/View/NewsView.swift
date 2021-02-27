//
//  NewsView.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import UIKit

protocol NewsViewOutput {
    func viewDidLoad()
}

protocol NewsViewInput: class {
    
}

final class NewsView: BaseViewController {
    
    var presenter: NewsViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .red
    }
}

extension NewsView: NewsViewInput {
    
}
