//
//  UserProfile.swift
//  Social Networking
//
//  Created by Anastas Smekh on 05.03.2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userProfile = try? newJSONDecoder().decode(UserProfile.self, from: jsonData)

import UIKit
import  SwiftyJSON


class UserProfile: Codable {
    let firstName: String
    let id: Int
    let lastName, homeTown, status, bdate: String
    let bdateVisibility: Int
    let city, country: String
    let phone: String
    let relation: Int
    let screenName: String
    let sex: Int

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id
        case lastName = "last_name"
        case homeTown = "home_town"
        case status, bdate
        case bdateVisibility = "bdate_visibility"
        case city, country, phone, relation
        case screenName = "screen_name"
        case sex
    }

    init(from json: JSON) {
        let firstName = json["first_name"].stringValue
        self.firstName = firstName
        
        let id = json["id"].intValue
        self.id = id
        
        let lastName = json["last_name"].stringValue
        self.lastName = lastName
        
        let homeTown = json["home_town"].stringValue
        self.homeTown = homeTown
        
        let status = json["status"].stringValue
        self.status = status
        
        let bdate = json["bdate"].stringValue
        self.bdate = bdate
        
        let bdateVisibility = json["bdate_visibility"].intValue
        self.bdateVisibility = bdateVisibility
        
        let city = json["city"]["title"].stringValue
        self.city = city
        
        let country = json["country"]["title"].stringValue
        self.country = country
        
        let phone = json["phone"].stringValue
        self.phone = phone
        
        let relation = json["relation"].intValue
        self.relation = relation
        
        let screenName = json["screen_name"].stringValue
        self.screenName = screenName
        
        let sex = json["sex"].intValue
        self.sex = sex
    }
}
