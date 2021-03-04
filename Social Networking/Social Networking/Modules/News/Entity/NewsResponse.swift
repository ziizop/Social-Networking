//
//  NewsResponse.swift
//  Social Networking
//
//  Created by Anastas Smekh on 02.03.2021.
//

import Foundation
import SwiftyJSON

class NewsResponse: Codable {
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

