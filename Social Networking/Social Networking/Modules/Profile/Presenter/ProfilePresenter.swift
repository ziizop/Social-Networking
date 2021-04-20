//
//  ProfilePresenter.swift
//  Social Networking
//
//  Created by Anastas Smekh on 01.03.2021.
//

import UIKit

final class ProfilePresenter {
    weak var view: ProfileViewInput?
    var interactor: ProfileInteractorInput?
    var router: ProfileRouterInput?
    
    private var userData: [UserProfile]? = []
    private var userPost: [UserPost]? = []
}

//MARK: - ProfileViewOutput
extension ProfilePresenter: ProfileViewOutput {
    
    func viewDidLoad() {
        interactor?.dataCollection()
        interactor?.factoryUserInfoInPage()
        interactor?.factoryUserPostsInPage()
    }
    
    func viewDidAppear() {
        interactor?.factoryUserInfoInPage()
    }
    
    func cellForRowAtUserInfo() -> [UserProfile]? {
        userData
    }
    
    func cellForRowAtUserPosts() -> [UserPost]? {
        userPost
    }
    
    func closeSecion() {
        router?.transitInLogin()
    }
    
    func modalPage() {
        guard let data = userData?[0] else { return }
        router?.showModalPage(data)
    }
}

//MARK: - ProfileInteractorOutput
extension ProfilePresenter: ProfileInteractorOutput {
    
    func userInfoArray(_ data: [UserProfile]?) {
        userData = data
        view?.reloadData()
    }
    
    func userPostsArray(_ data: [UserPost]?) {
        userPost = data
        view?.reloadData()
    }
}
