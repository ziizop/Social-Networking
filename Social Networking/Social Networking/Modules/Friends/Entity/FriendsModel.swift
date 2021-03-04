// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import UIKit
import SwiftyJSON

// MARK: - Item
class FriendsModel: Codable {
    let firstName: String
    let id: Int
    let lastName: String
    let canAccessClosed, isClosed: Bool?
    let online: Int
    let photo200_Orig: String
    let onlineMobile, onlineApp: Int?

    init(from json: JSON) {
        let firstName = json["first_name"].stringValue
        self.firstName = firstName
        
        let id = json["id"].intValue
        self.id = id
        
        let lastName = json["last_name"].stringValue
        self.lastName = lastName
        
        let canAccessClosed = json["can_access_closed"].boolValue
        self.canAccessClosed = canAccessClosed
        
        let isClosed = json["isClosed"].boolValue
        self.isClosed = isClosed
        
        let online = json["online"].intValue
        self.online = online
        
        let photo200_Orig = json["photo_200_orig"].stringValue
        self.photo200_Orig = photo200_Orig
        
        let onlineMobile = json["online_mobile"].intValue
        self.onlineMobile = onlineMobile
        
        let onlineApp = json["online_app"].intValue
        self.onlineApp = onlineApp
    }
}

