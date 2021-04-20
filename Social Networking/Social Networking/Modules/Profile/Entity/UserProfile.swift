// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userProfile = try? newJSONDecoder().decode(UserProfile.self, from: jsonData)

import Foundation
import SwiftyJSON

// MARK: - Response
class UserProfile: Hashable {
    
    let firstName: String
    let id: Int?
    let lastName: String
    let canAccessClosed, isClosed: Bool
    let sex: Int
    let screenName: String
    let photo50, photo100: String
    let online, verified, friendStatus: Int
    let nickname, domain, bdate: String
    let city, country: String
    let timezone: Int
    let photo200, photoMax, photo200_Orig, photo400_Orig: String
    let photoMaxOrig: String
    let photoID: String
    let hasPhoto, hasMobile, isFriend, canPost: Int
    let canSeeAllPosts, canSeeAudio: Int
    let skype, interests, books, tv: String
    let quotes, about, games, movies: String
    let activities, music: String
    let canWritePrivateMessage, canSendFriendRequest: Int
    let canBeInvitedGroup: Bool
    let mobilePhone, homePhone, site, status: String
    let lastSeen: Int
    let cropPhoto: String

    init(from json: JSON) {
        let firstName = json["first_name"].stringValue
        self.firstName = firstName
        
        let id = json["id"].intValue
        self.id = id
        
        let lastName = json["last_name"].stringValue
        self.lastName = lastName
        
        let canAccessClosed = json["can_access_closed"].boolValue
        self.canAccessClosed = canAccessClosed
        
        let isClosed = json["is_closed"].boolValue
        self.isClosed = isClosed
        
        let sex = json["sex"].intValue
        self.sex = sex
        
        let screenName = json["screen_name"].stringValue
        self.screenName = screenName
        
        let photo50 = json["photo_50"].stringValue
        self.photo50 = photo50
        
        let photo100 = json["photo_100"].stringValue
        self.photo100 = photo100
        
        let online = json["online"].intValue
        self.online = online
        
        let verified = json["verified"].intValue
        self.verified = verified
        
        let friendStatus = json["friend_status"].intValue
        self.friendStatus = friendStatus
        
        let nickname = json["nickname"].stringValue
        self.nickname = nickname
        
        let domain = json["domain"].stringValue
        self.domain = domain
        
        let bdate = json["bdate"].stringValue
        self.bdate = bdate
        
        let city = json["city"]["title"].stringValue
        self.city = city
        
        let country = json["country"]["title"].stringValue
        self.country = country
        
        let timezone = json["timezone"].intValue
        self.timezone = timezone
        
        let photo200 = json["photo_200"].stringValue
        self.photo200 = photo200
        
        let photoMax = json["photo_max"].stringValue
        self.photoMax = photoMax
        
        let photo200_Orig = json["photo_200_orig"].stringValue
        self.photo200_Orig = photo200_Orig
        
        let photo400_Orig = json["photo_400_orig"].stringValue
        self.photo400_Orig = photo400_Orig
        
        let photoMaxOrig = json["photo_max_orig"].stringValue
        self.photoMaxOrig = photoMaxOrig
        
        let photoID = json["photo_id"].stringValue
        self.photoID = photoID
        
        let hasPhoto = json["has_photo"].intValue
        self.hasPhoto = hasPhoto
        
        let hasMobile = json["has_mobile"].intValue
        self.hasMobile = hasMobile
        
        let isFriend = json["is_friend"].intValue
        self.isFriend = isFriend
        
        let canPost = json["can_post"].intValue
        self.canPost = canPost
        
        let canSeeAllPosts = json["can_see_all_posts"].intValue
        self.canSeeAllPosts = canSeeAllPosts
        
        let canSeeAudio = json["can_see_audio"].intValue
        self.canSeeAudio = canSeeAudio
        
        let skype = json["skype"].stringValue
        self.skype = skype
        
        let interests = json["interests"].stringValue
        self.interests = interests
        
        let books = json["books"].stringValue
        self.books = books
        
        let tv = json["tv"].stringValue
        self.tv = tv
        
        let quotes = json["quotes"].stringValue
        self.quotes = quotes
        
        let about = json["about"].stringValue
        self.about = about
        
        let games = json["games"].stringValue
        self.games = games
        
        let movies = json["movies"].stringValue
        self.movies = movies
        
        let activities = json["activities"].stringValue
        self.activities = activities
        
        let music = json["music"].stringValue
        self.music = music
        
        let canWritePrivateMessage = json["can_write_private_message"].intValue
        self.canWritePrivateMessage = canWritePrivateMessage
        
        let canSendFriendRequest = json["can_send_friend_request"].intValue
        self.canSendFriendRequest = canSendFriendRequest
        
        let canBeInvitedGroup = json["can_be_invited_group"].boolValue
        self.canBeInvitedGroup = canBeInvitedGroup
        
        let mobilePhone = json["mobile_phone"].stringValue
        self.mobilePhone = mobilePhone
        
        let homePhone = json["home_phone"].stringValue
        self.homePhone = homePhone
        
        let site = json["site"].stringValue
        self.site = site
        
        let status = json["status"].stringValue
        self.status = status
        
        let lastSeen = json["last_seen"]["time"].intValue
        self.lastSeen = lastSeen
        
        let cropPhoto = json["crop_photo"]["photo"]["size"][9]["url"].stringValue
        self.cropPhoto = cropPhoto
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(self.id)
        }
    
    static func == (lhs: UserProfile, rhs: UserProfile) -> Bool {
        return lhs.id == rhs.id
    }
}
