//
//  AuthManager.swift
//  Social Networking
//
//  Created by Anastas Smekh on 04.03.2021.
//

import UIKit
import WebKit

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
    
    public var userId: Int {
        get {
            return UserDefaults.standard.integer(forKey: "user_id")
        }
        set {
            print("Новые userID: \n \(newValue) ")
            UserDefaults.standard.set(newValue, forKey: "user_id")
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
        
        print(" Добро пожаловать в клиент вк \n USER: \(userId)  \n  TOKEN: \n  \(userToken) ")
        mainWindow.rootViewController = tabBaarScreen
        
    }
  
    //MARK: - Network remove cookie webkit
    /*
     Обнуляем токин и id
     */
    private func removeUserData() {
        userToken = ""
        userId = 0
        print("Токен пользователя удален: \(userToken)  \n Id пользователя удален: \(userId)")
    }
  
    /*
     Обнуляем куки  webkit для выхода из аккаунта
     */
    
    func removeCookie() {
        URLCache.shared.removeAllCachedResponses()
            HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
            print("[WebCacheCleaner] All cookies deleted")

            WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
                records.forEach { record in
                    WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
                        print("[WebCacheCleaner] Record \(record) deleted")
            }
                self.removeUserData()
        }
    }
}
