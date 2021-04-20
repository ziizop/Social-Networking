//
//  NetworkingService.swift
//  Social Networking
//
//  Created by Anastas Smekh on 05.03.2021.
//

/*
 Работа с сервером , работа с json , запорсы токина и данных
 */


import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import WebKit


final class NetworkingService {
    
    //singleton
    static var shared: NetworkingService = NetworkingService()
    
    //MARK: - Первичная работа с сервером
    /*
     Параметры для первичного запроса ссылки
     scope - Зашифрованные: друзья, фото, истории, статус, группы
     redirectUri - ссылка на которую переходим после авторизации и берем токен и userID
     vAPI - Версия api
     */
    private let clientID = "7775950"
    private let scope = "271430" // тут друзья, фото, истории, статус, группы
    private let display = "mobile"
    private let redirectUri = "https://oauth.vk.com/blank.html"
    private let responseType = "token"
    private let vAPI = "5.92"
    
    /*
     Метод по созданиию url запроса
     */
    func creatingUrlRequest(completion: @escaping( Result<URLRequest,Error>) -> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: clientID),
            URLQueryItem(name: "scope", value: scope),
            URLQueryItem(name: "display", value: display),
            URLQueryItem(name: "redirect_uri", value: redirectUri),
            URLQueryItem(name: "response_type", value: responseType),
            URLQueryItem(name: "v", value: vAPI)
        ]
        let request = URLRequest(url: components.url!)
        completion(.success(request))
    }
    
    //MARK: - Общие свойства и методы для работы с сервером
    /*
     Свойства для всех json  запросов на сервер
     токин user сохраненный в UserDefaults
     user id
     */
    
    private var baseUrl = "https://api.vk.com"
    
    /*
     Метод загрузки изображения по ссылки из JSON
     */
    func uploadingImageByUrl(_ urlString: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let  url = URL(string: urlString) else { return  }
        print(urlString)
        do {
            let imageData = try Data(contentsOf: url)
            guard let image = UIImage(data: imageData) else { return }
            completion(.success(image))
        } catch let dataError {
            completion(.failure(dataError))
        }
    }
    
    //MARK: - Network for news data
    /*
     Свойства для связи с сервиром:
     filters  - перечисленные через запятую названия списков новостей, которые необходимо получить.
     sourceIds - перечисленные через запятую иcточники новостей, новости от которых необходимо получить.
     startTime - время в формате unixtime, начиная с которого следует получить новости для текущего пользователя.
     
     Остальные параметры: https://vk.com/dev/newsfeed.get
     */
    private var methodNewsFeed = "/method/newsfeed.get"
    private var filters = "post"
    private var sourceIds =  "groups"
    private var startTime = "1614720798"
    
    /*
     Метод отправки запрос на сервер для получения новостей
     */
    func newsRequest(completion: @escaping( Result<[NewsResponse],Error>) -> Void ) {
        let baseURL = baseUrl
        let path = methodNewsFeed
        
        let params: Parameters = [
            "access_token": AuthManager.shared.userToken,
            "filters": filters,
            "source_ids": sourceIds,
            "start_time": startTime,
            "v": vAPI
        ]
        
        AF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                let items = json["response"]["items"].arrayValue
                let itemsNews =  items.map {NewsResponse(from: $0)}
                completion(.success(itemsNews))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    //MARK: - Network for friends data
    /*
     Свойства для связи с сервиром:
     order  - порядок, в котором нужно вернуть список друзей. Допустимые значения:
     fields - список дополнительных полей, которые необходимо вернуть.
     
     Остальные параметры: https://vk.com/dev/friends.get
     */
    private var methodFriends = "/method/friends.get"
    private var order = "hints"
    private var fields =  "nickname, online,last_seen,photo_200_orig,city"
    
    /*
     Метод отправки запрос на сервер для получения друзей
     */
    func friendsReques(completion: @escaping( Result<[FriendsModel],Error>) -> Void ) {
        let baseURL = baseUrl
        let path = methodFriends
        let params: Parameters = [
            "access_token": AuthManager.shared.userToken,
            "user_id": AuthManager.shared.userId,
            "order": order,
            "fields": fields,
            "v": vAPI
        ]
        AF.request(baseUrl + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                let items = json["response"]["items"].arrayValue
                let itemsFriens = items.map { FriendsModel(from: $0) }
                print("Данные полученны по друзьям")
                completion(.success(itemsFriens))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    //MARK: - Network for authorized user profile info data
    /*
     Свойства для связи с сервиром:
     Этот метод можно вызвать с ключом доступа пользователя
     access_token - ключом доступа пользователя
     user_ids - перечисленные через запятую идентификаторы пользователей или их короткие имена (screen_name)
     fields - список дополнительных полей профилей, которые необходимо вернуть.
     Остальные параметры: https://vk.com/dev/users.get
     Значения возвращаемых параметров - https://vk.com/dev/objects/user
     */
    private var methodUserProfileInfo = "/method/users.get"
    private var userFields = " photo_id, verified, sex, bdate, city, country, home_town, has_photo, photo_50, photo_100, photo_200_orig, photo_200, photo_400_orig, photo_max, photo_max_orig, online, domain, has_mobile, contacts, site, education, universities, schools, status, last_seen, followers_count, common_count, occupation, nickname, relatives, relation, personal, connections, exports, activities, interests, music, movies, tv, books, games, about, quotes, can_post, can_see_all_posts, can_see_audio, can_write_private_message, can_send_friend_request, is_favorite, is_hidden_from_feed, timezone, screen_name, maiden_name, crop_photo, is_friend, friend_status, career, military, blacklisted, blacklisted_by_me, can_be_invited_group "
    
    /*
     Метод отправки запрос на сервер для получения данных юзера
     */
    func userProfil(_ userId: Int, completion: @escaping (Result<[UserProfile],Error>) -> Void ) {
        let baseURL = baseUrl
        let path = methodUserProfileInfo
        let params: Parameters = [
            "access_token": AuthManager.shared.userToken,
            "user_ids":userId ,
            "fields": userFields,
            "v": vAPI
        ]
        
        AF.request(baseUrl + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                let items = json["response"].arrayValue
                let userProfileItems = items.map {UserProfile(from: $0)}
                completion(.success(userProfileItems))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    //
    
    //MARK: - Network for group  info data
    /*
     Свойства для связи с сервиром:
     Этот метод можно вызвать с ключом доступа пользователя
     access_token - ключом доступа пользователя
     Остальные параметры: https://vk.com/dev/account.getProfileInfo
     */
    private var methodGroup = "/method/account.getProfileInfo"
    
    /*
     Метод отправки запрос на сервер для получения друзей
     */
}
