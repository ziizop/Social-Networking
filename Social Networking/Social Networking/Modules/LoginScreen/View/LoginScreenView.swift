//
//  LoginScreenViewController.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import UIKit


protocol LoginScreenViewOutput {
    func viewDidLoad()
    func tapButton()
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
    
    private lazy var usernameLable: UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 20, weight: .light)
        lable.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lable.text = "Имя пользователя"
        return lable
    }()
    
    private lazy var passwordLable: UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 20, weight: .light)
        lable.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lable.text = "Пароль"
        return lable
    }()
    
    private lazy var usernameTextFild: UITextField = {
        let textFild = UITextField()
        textFild.placeholder = "Введите логин"
        textFild.borderStyle = .roundedRect
        textFild.font = .systemFont(ofSize: .zero, weight: .black)
        return textFild
    }()
    
    private lazy var passwordTextFild: UITextField = {
        let textFild = UITextField()
        textFild.placeholder = "Введите логин"
        textFild.borderStyle = .roundedRect
        textFild.font = .systemFont(ofSize: .zero, weight: .black)
        return textFild
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
        
        contentView.addSubview(usernameLable)
        contentView.addSubview(usernameTextFild)
        contentView.addSubview(passwordLable)
        contentView.addSubview(passwordTextFild)
        contentView.addSubview(loginButton)
        
        usernameLable.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(70)
        }
        
        usernameTextFild.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(70)
            make.top.equalTo(usernameLable.snp.bottom).offset(10)
            make.height.equalTo(40)
            make.width.equalToSuperview().inset(70)
        }
        
        passwordLable.snp.makeConstraints { make in
            make.top.equalTo(usernameTextFild.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(70)
        }
        
        passwordTextFild.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(70)
            make.top.equalTo(passwordLable.snp.bottom).offset(10)
            make.height.equalTo(40)
            make.width.equalToSuperview().inset(70)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextFild.snp.bottom).offset(40)
            make.trailing.leading.equalToSuperview().inset(70)
            make.height.equalTo(50)
            make.width.equalTo(60)
//            make.bottom.equalToSuperview()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let kbSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.size.height, right: 0)
        scrollView.contentInset = insets
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        let insets = UIEdgeInsets.zero
        scrollView.contentInset = insets
    }
    
    @objc private func login() {
        presenter?.tapButton()
    }
}
//MARK: - UIScrollViewDelegate
extension LoginScreenView: UIScrollViewDelegate {
    
}

//MARK: - LoginScreenViewInput
extension LoginScreenView: LoginScreenViewInput {
    
}
