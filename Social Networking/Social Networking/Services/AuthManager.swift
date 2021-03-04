//
//  AuthManager.swift
//  Social Networking
//
//  Created by Anastas Smekh on 04.03.2021.
//

import UIKit

final class AuthManager {
    
    static let shared: AuthManager = AuthManager()
    
    public var userToken: String {
        get {
            return UserDefaults.standard.string(forKey: "access_token") ?? ""
        }
        set {
            print("Новый токен: \n \(newValue)")
            UserDefaults.standard.setValue(newValue, forKey: "access_token")
        }
    }
    
    public var userId: String {
        get {
            return UserDefaults.standard.string(forKey: "user_id") ?? ""
        }
        set {
            print("Новые userID: \n \(newValue) ")
            UserDefaults.standard.setValue(newValue, forKey: "user_id")
        }
    }
    
    /*
     Сохранения данных с помощью UserDefaults
     */
    
    func sevaDataUsersSing(_ userData: PrimaryUserData) {
        print("Сохранения данных пользователя: \n \(userData)")
        userToken = userData.token
        userId = userData.userId
            
    }
    
    /*
     Проверка на наличия токена и  выбор экрана
     */
    
    func controlAuthorizationTokenAndSelectScreen(_ window: UIWindow?) {
        guard let mainWindow = window else { return }
        let loginScreenAuthorization = LoginScreenAssembly.assembly()
        let tabBaarScreen = TabBarAssembly.assembly()
        guard userToken != "" else {
            print(" Нет Токина , авторизируйтесь в вк! ")
            mainWindow.rootViewController = loginScreenAuthorization
            return
        }
        
        print(" Добро пожаловать в клиент вк \n USER: \(userId) ")
        mainWindow.rootViewController = tabBaarScreen
        
    }
}
