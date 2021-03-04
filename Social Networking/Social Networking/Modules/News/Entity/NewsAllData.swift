//
//  NewsAllData.swift
//  Social Networking
//
//  Created by Anastas Smekh on 02.03.2021.
//

import Foundation
import SwiftyJSON

// MARK: - Welcome
class NewsAllData: Codable {
    let response: Response

    init(response: Response) {
        self.response = response
    }
}

// MARK: - Response
class Response: Codable {
    let sourceID, date: Int
    let canDoubtCategory, canSetCategory: Bool
    let text: String
    let markedAsAds: Int
    let isFavorite: Bool
    let postID: Int
    let signerID, topicID: Int?
    let url: String

    init(from json: JSON) {
        let sourceId = json["source_id"].intValue
        self.sourceID = sourceId
        
        let dateTime = json["date"].intValue
        self.date = dateTime
        
        let canDoubtCategorys = json["can_doubt_category"].boolValue
        self.canDoubtCategory = canDoubtCategorys
        
        let canSetCategory = json["can_set_category"].boolValue
        self.canSetCategory = canSetCategory

        let text = json["text"].stringValue
        self.text = text
        
        let markedAsAds = json["marked_as_ads"].intValue
        self.markedAsAds = markedAsAds
        
        let isFavorite = json["is_favorite"].boolValue
        self.isFavorite = isFavorite
        
        let postID = json["post_id"].intValue
        self.postID = postID
        
//        let attachments = ItemAttachment(from: json["attachments"].arrayValue)
//        self.attachments = attachments
        
        let signerID = json["signer_id"].intValue
        self.signerID = signerID
        
        let topicID = json["topic_id"].intValue
        self.topicID = topicID
        
        let urlString = json["attachments"][0]["photo"]["sizes"][6]["url"].stringValue
        print(urlString)
        self.url = urlString
    }
}

// MARK: - ItemAttachment
class ItemAttachment: Codable {
    let photo: [JSON]

    init(from json: JSON) {
        let photoPoster = json["photo"].arrayValue
        self.photo = photoPoster
    }
}

// MARK: - Photo
class Photo: Codable {
    let albumID, date, id, ownerID: Int
    let hasTags: Bool
    let sizes: [JSON]
    let text: String
    let userID: Int
    let accessKey: String?
    let postID: Int?
    
    init(from json: JSON) {
        let albumID = json["album_id"].intValue
        self.albumID = albumID
        
        let date = json["date"].intValue
        self.date = date
        
        let id = json["id"].intValue
        self.id = id
        
        let ownerId = json["owner_id"].intValue
        self.ownerID = ownerId
        
        let hasTags = json["has_tags"].boolValue
        self.hasTags = hasTags
        
        let sizes = json["sizes"].arrayValue
        self.sizes = sizes
        
        let text = json["text"].stringValue
        self.text = text
        
        let userId = json["user_id"].intValue
        self.userID = userId
        
        let accessKey = json["access_key"].stringValue
        self.accessKey = accessKey
        
        let postId = json["post_id"].intValue
        self.postID = postId
    }
}

class Size: Codable {
    let height: Int
    let url: String
    let width: Int

    init(from json: JSON) {
        let height = json["height"].intValue
        self.height = height
        
        let url = json["url"].stringValue
        self.url = url
        
        let width = json["width"].intValue
        self.width = width
    }
}
