//
//  LoginScreenViewController.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import UIKit
import WebKit


protocol LoginScreenViewOutput {
    func viewDidLoad()
    func transit()
}

protocol LoginScreenViewInput: class {
    var navigationController: UINavigationController? { get }
}

final class LoginScreenView: BaseViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        if #available(iOS 13.0, *) {
            contentView.backgroundColor = .systemBackground
        } else {
            contentView.backgroundColor = .white
        }
        return contentView
    }()
    
    private lazy var loginButton: ButtonView = {
        let button = ButtonView(title: "Войти", target: self, selector: #selector(login))
        return button
    }()
    
    var presenter: LoginScreenViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configur()
        presenter?.viewDidLoad()
    }
    
    private func configur() {
        
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(400)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        contentView.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalToSuperview().inset(60)
//            make.bottom.equalToSuperview()
        }
    }
    
    @objc private func login() {
        presenter?.transit()
    }
}
//MARK: - UIScrollViewDelegate
extension LoginScreenView: UIScrollViewDelegate {
    
}

//MARK: - LoginScreenViewInput
extension LoginScreenView: LoginScreenViewInput {
    
}
