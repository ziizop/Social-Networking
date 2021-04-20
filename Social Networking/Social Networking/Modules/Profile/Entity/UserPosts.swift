//
//  UserPosts.swift
//  Social Networking
//
//  Created by Anastas Smekh on 11.03.2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userProfile = try? newJSONDecoder().decode(UserProfile.self, from: jsonData)

import UIKit
import SwiftyJSON

// MARK: - Item
class UserPosts: Codable {
    let id, fromID, ownerID, date: Int
    let text: String
    let canDelete: Int
    let canPin: Int?
    let canArchive, isArchived: Bool
    let attachments: String

    init(for json: JSON) {
        let id = json["id"].intValue
        self.id = id
        
        let fromID = json["from_id"].intValue
        self.fromID = fromID
        
        let ownerID = json["owner_id"].intValue
        self.ownerID = ownerID
        
        let date = json["date"].intValue
        self.date = date
        
        let text = json["text"].stringValue
        self.text = text
        
        let canDelete = json["can_delete"].intValue
        self.canDelete = canDelete
        
        let canPin = json["can_pin"].intValue
        self.canPin = canPin
        
        let canArchive = json["can_archive"].boolValue
        self.canArchive = canArchive
        
        let isArchived = json["can_archive"].boolValue
        self.isArchived = isArchived
        
        let attachments = json["attachments"][1]["photo"]["sizes"][9]["url"].stringValue
        self.attachments = attachments
    }
}

