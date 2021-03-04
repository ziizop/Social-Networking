// базовые исходники для webkit
/*
 guard let url = request.url,
       url.path == "/blank.html",
       let fragment = url.fragment
       else { return }
 
 let params = fragment
     .components(separatedBy: "&")
     .map { $0.components(separatedBy: "=") }
     .reduce([String: String]()) { result, param in
         var dict = result
         let key = param[0]
         let value = param[1]
         dict[key] = value
         
         return dict
     }
 
 guard let toket = params["access_token"],
       let userIdString = params["user_id"],
       let _ = Int(userIdString) else { return }
 print(params)
 
 
 */


import UIKit
import Alamofire
import SwiftyJSON
   
final class NetworkongService {
    
    static var shared: NetworkongService = NetworkongService()
    
    private let clientID = "7775950"
    private let scope = "271430" // тут друзья, фото, истории, статус, группы
    private let display = "mobile"
    private let redirectUri = "https://oauth.vk.com/blank.html"
    private let responseType = "token"
    private let vAPI = "5.92"
    
    private static let sessionAF: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = false
        let session = Alamofire.Session(configuration: configuration)
        
        return session
    }()
    
    func login(completion: @escaping( Result<URLRequest,Error>) -> Void ){
        
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
    
    func postRequest(completion: @escaping( Result<[Response],Error>) -> Void ) {
        let baseURL = "https://api.vk.com"
        let path = "/method/newsfeed.get"
        
        let params: Parameters = [
            "access_token": AuthManager.shared.userToken,
            "filters": "post",
            "source_ids": "groups",
            "start_time": "1614720798",
            "v": "5.92"
        ]
        
        AF.request(baseURL + path, method: .get, parameters: params).responseJSON { (resulte) in
            switch resulte.result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                let json = JSON(data)
                let items = json["response"]["items"].arrayValue
                let itemsNews =  items.map {Response(from: $0)}
                print("itemAttachmentNews: \(itemsNews[10].url)")
                completion(.success(itemsNews))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    func test(token: String) {
        var components = URLComponents()
        components.scheme  = "https"
        components.host = "api.vk.com"
        components.path = "/method/newsfeed.get"
        components.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "filters", value: "post"),
            URLQueryItem(name: "source_ids", value: "groups"),
            URLQueryItem(name: "start_time", value: "1614720798"),
            URLQueryItem(name: "v", value: "5.92")
         ]
        
        let url = components.url!
        AF.session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else { return }
            do {
                let newsData = try JSONDecoder().decode(NewsAllData.self, from: data)
                print(newsData)
            } catch let jsonError {
                print(jsonError.localizedDescription)
            }
        }
    }
    
    static func loadGroups(token: String) {
        let baseURL = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.92"
        ]
        
        sessionAF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
            guard let json = response.value else { return }
        print(response)
        }
    }
    
    static func loadFriends(token: String, userID: Int) {
        let baseURL = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": token,
            "user_id": userID,
            "order": "hints",
            "fields":" nickname, domain, sex, bdate, city, country, timezone, photo_50, photo_100, photo_200_orig, has_mobile, contacts, education, online, relation, last_seen, status, can_write_private_message, can_see_all_posts, can_post, universities",
            "v": "5.130"
        ]
        sessionAF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
            guard let json = response.value else { return }
        print(response)
        }
    }
    
    func loadImage(_ urlString: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
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
}
