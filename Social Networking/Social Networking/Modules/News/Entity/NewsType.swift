//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
//
//import Foundation
//
//// MARK: - Group
//class Group: Codable {
//    let id: Int
//    let name, screenName: String
//    let isClosed: Int
//    let type: GroupType
//    let isAdmin, isMember, isAdvertiser: Int?
//    let photo50, photo100, photo200: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case screenName = "screen_name"
//        case isClosed = "is_closed"
//        case type
//        case isAdmin = "is_admin"
//        case isMember = "is_member"
//        case isAdvertiser = "is_advertiser"
//        case photo50 = "photo_50"
//        case photo100 = "photo_100"
//        case photo200 = "photo_200"
//    }
//
//    init(id: Int, name: String, screenName: String, isClosed: Int, type: GroupType, isAdmin: Int?, isMember: Int?, isAdvertiser: Int?, photo50: String, photo100: String, photo200: String) {
//        self.id = id
//        self.name = name
//        self.screenName = screenName
//        self.isClosed = isClosed
//        self.type = type
//        self.isAdmin = isAdmin
//        self.isMember = isMember
//        self.isAdvertiser = isAdvertiser
//        self.photo50 = photo50
//        self.photo100 = photo100
//        self.photo200 = photo200
//    }
//}
//
//enum GroupType: String, Codable {
//    case group = "group"
//    case page = "page"
//}
//
//// MARK: - Item
//class Item: Codable {
//    let sourceID, date: Int
//    let canDoubtCategory, canSetCategory: Bool
//    let postType: PostTypeEnum
//    let text: String
//    let markedAsAds: Int
//    let attachments: [ItemAttachment]?
//    let postSource: ItemPostSource
//    let comments: Comments
//    let likes: Likes
//    let reposts: Reposts
//    let views: Views
//    let isFavorite: Bool
//    let postID: Int
//    let type: PostTypeEnum
//    let copyHistory: [CopyHistory]?
//    let signerID, topicID: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case sourceID = "source_id"
//        case date
//        case canDoubtCategory = "can_doubt_category"
//        case canSetCategory = "can_set_category"
//        case postType = "post_type"
//        case text
//        case markedAsAds = "marked_as_ads"
//        case attachments
//        case postSource = "post_source"
//        case comments, likes, reposts, views
//        case isFavorite = "is_favorite"
//        case postID = "post_id"
//        case type
//        case copyHistory = "copy_history"
//        case signerID = "signer_id"
//        case topicID = "topic_id"
//    }
//
//    init(sourceID: Int, date: Int, canDoubtCategory: Bool, canSetCategory: Bool, postType: PostTypeEnum, text: String, markedAsAds: Int, attachments: [ItemAttachment]?, postSource: ItemPostSource, comments: Comments, likes: Likes, reposts: Reposts, views: Views, isFavorite: Bool, postID: Int, type: PostTypeEnum, copyHistory: [CopyHistory]?, signerID: Int?, topicID: Int?) {
//        self.sourceID = sourceID
//        self.date = date
//        self.canDoubtCategory = canDoubtCategory
//        self.canSetCategory = canSetCategory
//        self.postType = postType
//        self.text = text
//        self.markedAsAds = markedAsAds
//        self.attachments = attachments
//        self.postSource = postSource
//        self.comments = comments
//        self.likes = likes
//        self.reposts = reposts
//        self.views = views
//        self.isFavorite = isFavorite
//        self.postID = postID
//        self.type = type
//        self.copyHistory = copyHistory
//        self.signerID = signerID
//        self.topicID = topicID
//    }
//}
//
//// MARK: - ItemAttachment
//class ItemAttachment: Codable {
//    let type: AttachmentType
//    let photo: Photo?
//    let link: Link?
//    let video: Video?
//    let audio: Audio?
//    let market: Market?
//
//    init(type: AttachmentType, photo: Photo?, link: Link?, video: Video?, audio: Audio?, market: Market?) {
//        self.type = type
//        self.photo = photo
//        self.link = link
//        self.video = video
//        self.audio = audio
//        self.market = market
//    }
//}
//
//// MARK: - Audio
//class Audio: Codable {
//    let artist: String
//    let id, ownerID: Int
//    let title: String
//    let duration: Int
//    let isExplicit: Bool
//    let url: String
//    let date, albumID: Int
//    let isHq: Bool
//    let mainArtists: [MainArtist]
//    let shortVideosAllowed, storiesAllowed, storiesCoverAllowed: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case artist, id
//        case ownerID = "owner_id"
//        case title, duration
//        case isExplicit = "is_explicit"
//        case url, date
//        case albumID = "album_id"
//        case isHq = "is_hq"
//        case mainArtists = "main_artists"
//        case shortVideosAllowed = "short_videos_allowed"
//        case storiesAllowed = "stories_allowed"
//        case storiesCoverAllowed = "stories_cover_allowed"
//    }
//
//    init(artist: String, id: Int, ownerID: Int, title: String, duration: Int, isExplicit: Bool, url: String, date: Int, albumID: Int, isHq: Bool, mainArtists: [MainArtist], shortVideosAllowed: Bool, storiesAllowed: Bool, storiesCoverAllowed: Bool) {
//        self.artist = artist
//        self.id = id
//        self.ownerID = ownerID
//        self.title = title
//        self.duration = duration
//        self.isExplicit = isExplicit
//        self.url = url
//        self.date = date
//        self.albumID = albumID
//        self.isHq = isHq
//        self.mainArtists = mainArtists
//        self.shortVideosAllowed = shortVideosAllowed
//        self.storiesAllowed = storiesAllowed
//        self.storiesCoverAllowed = storiesCoverAllowed
//    }
//}
//
//// MARK: - MainArtist
//class MainArtist: Codable {
//    let name, domain, id: String
//    let isFollowed, canFollow: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case name, domain, id
//        case isFollowed = "is_followed"
//        case canFollow = "can_follow"
//    }
//
//    init(name: String, domain: String, id: String, isFollowed: Bool, canFollow: Bool) {
//        self.name = name
//        self.domain = domain
//        self.id = id
//        self.isFollowed = isFollowed
//        self.canFollow = canFollow
//    }
//}
//
//// MARK: - Link
//class Link: Codable {
//    let url: String
//    let title: String
//    let caption: String?
//    let linkDescription: String
//    let photo: Photo
//    let isFavorite: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case url, title, caption
//        case linkDescription = "description"
//        case photo
//        case isFavorite = "is_favorite"
//    }
//
//    init(url: String, title: String, caption: String?, linkDescription: String, photo: Photo, isFavorite: Bool?) {
//        self.url = url
//        self.title = title
//        self.caption = caption
//        self.linkDescription = linkDescription
//        self.photo = photo
//        self.isFavorite = isFavorite
//    }
//}
//
//// MARK: - Photo
//class Photo: Codable {
//    let albumID, date, id, ownerID: Int
//    let hasTags: Bool
//    let sizes: [Size]
//    let text: String
//    let userID: Int
//    let accessKey: String?
//    let postID: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case albumID = "album_id"
//        case date, id
//        case ownerID = "owner_id"
//        case hasTags = "has_tags"
//        case sizes, text
//        case userID = "user_id"
//        case accessKey = "access_key"
//        case postID = "post_id"
//    }
//
//    init(albumID: Int, date: Int, id: Int, ownerID: Int, hasTags: Bool, sizes: [Size], text: String, userID: Int, accessKey: String?, postID: Int?) {
//        self.albumID = albumID
//        self.date = date
//        self.id = id
//        self.ownerID = ownerID
//        self.hasTags = hasTags
//        self.sizes = sizes
//        self.text = text
//        self.userID = userID
//        self.accessKey = accessKey
//        self.postID = postID
//    }
//}
//
//// MARK: - Size
//class Size: Codable {
//    let height: Int
//    let url: String
//    let type: SizeType
//    let width: Int
//
//    init(height: Int, url: String, type: SizeType, width: Int) {
//        self.height = height
//        self.url = url
//        self.type = type
//        self.width = width
//    }
//}
//
//enum SizeType: String, Codable {
//    case a = "a"
//    case b = "b"
//    case c = "c"
//    case d = "d"
//    case e = "e"
//    case k = "k"
//    case l = "l"
//    case m = "m"
//    case o = "o"
//    case p = "p"
//    case q = "q"
//    case r = "r"
//    case s = "s"
//    case temp = "temp"
//    case w = "w"
//    case x = "x"
//    case y = "y"
//    case z = "z"
//}
//
//// MARK: - Market
//class Market: Codable {
//    let availability: Int
//    let category: Category
//    let marketDescription: String
//    let id, ownerID: Int
//    let price: Price
//    let title: String
//    let date: Int
//    let thumbPhoto: String
//
//    enum CodingKeys: String, CodingKey {
//        case availability, category
//        case marketDescription = "description"
//        case id
//        case ownerID = "owner_id"
//        case price, title, date
//        case thumbPhoto = "thumb_photo"
//    }
//
//    init(availability: Int, category: Category, marketDescription: String, id: Int, ownerID: Int, price: Price, title: String, date: Int, thumbPhoto: String) {
//        self.availability = availability
//        self.category = category
//        self.marketDescription = marketDescription
//        self.id = id
//        self.ownerID = ownerID
//        self.price = price
//        self.title = title
//        self.date = date
//        self.thumbPhoto = thumbPhoto
//    }
//}
//
//// MARK: - Category
//class Category: Codable {
//    let id: Int
//    let name: String
//    let section: Section
//
//    init(id: Int, name: String, section: Section) {
//        self.id = id
//        self.name = name
//        self.section = section
//    }
//}
//
//// MARK: - Section
//class Section: Codable {
//    let id: Int
//    let name: String
//
//    init(id: Int, name: String) {
//        self.id = id
//        self.name = name
//    }
//}
//
//// MARK: - Price
//class Price: Codable {
//    let amount: String
//    let currency: Section
//    let text: String
//
//    init(amount: String, currency: Section, text: String) {
//        self.amount = amount
//        self.currency = currency
//        self.text = text
//    }
//}
//
//enum AttachmentType: String, Codable {
//    case audio = "audio"
//    case link = "link"
//    case market = "market"
//    case photo = "photo"
//    case video = "video"
//}
//
//// MARK: - Video
//class Video: Codable {
//    let accessKey: String
//    let canComment, canLike, canRepost, canSubscribe: Int
//    let canAddToFaves, canAdd: Int
//    let comments: Int?
//    let date: Int
//    let videoDescription: String
//    let duration: Int
//    let photo130, photo320, photo800: String
//    let photo1280, firstFrame130, firstFrame160, firstFrame320: String?
//    let firstFrame800, firstFrame1280: String?
//    let width, height: Int?
//    let id, ownerID: Int
//    let title: String
//    let isFavorite: Bool
//    let trackCode: String
//    let views: Int
//    let localViews: Int?
//    let platform: String?
//    let videoRepeat: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case accessKey = "access_key"
//        case canComment = "can_comment"
//        case canLike = "can_like"
//        case canRepost = "can_repost"
//        case canSubscribe = "can_subscribe"
//        case canAddToFaves = "can_add_to_faves"
//        case canAdd = "can_add"
//        case comments, date
//        case videoDescription = "description"
//        case duration
//        case photo130 = "photo_130"
//        case photo320 = "photo_320"
//        case photo800 = "photo_800"
//        case photo1280 = "photo_1280"
//        case firstFrame130 = "first_frame_130"
//        case firstFrame160 = "first_frame_160"
//        case firstFrame320 = "first_frame_320"
//        case firstFrame800 = "first_frame_800"
//        case firstFrame1280 = "first_frame_1280"
//        case width, height, id
//        case ownerID = "owner_id"
//        case title
//        case isFavorite = "is_favorite"
//        case trackCode = "track_code"
//        case views
//        case localViews = "local_views"
//        case platform
//        case videoRepeat = "repeat"
//    }
//
//    init(accessKey: String, canComment: Int, canLike: Int, canRepost: Int, canSubscribe: Int, canAddToFaves: Int, canAdd: Int, comments: Int?, date: Int, videoDescription: String, duration: Int, photo130: String, photo320: String, photo800: String, photo1280: String?, firstFrame130: String?, firstFrame160: String?, firstFrame320: String?, firstFrame800: String?, firstFrame1280: String?, width: Int?, height: Int?, id: Int, ownerID: Int, title: String, isFavorite: Bool, trackCode: String, views: Int, localViews: Int?, platform: String?, videoRepeat: Int?) {
//        self.accessKey = accessKey
//        self.canComment = canComment
//        self.canLike = canLike
//        self.canRepost = canRepost
//        self.canSubscribe = canSubscribe
//        self.canAddToFaves = canAddToFaves
//        self.canAdd = canAdd
//        self.comments = comments
//        self.date = date
//        self.videoDescription = videoDescription
//        self.duration = duration
//        self.photo130 = photo130
//        self.photo320 = photo320
//        self.photo800 = photo800
//        self.photo1280 = photo1280
//        self.firstFrame130 = firstFrame130
//        self.firstFrame160 = firstFrame160
//        self.firstFrame320 = firstFrame320
//        self.firstFrame800 = firstFrame800
//        self.firstFrame1280 = firstFrame1280
//        self.width = width
//        self.height = height
//        self.id = id
//        self.ownerID = ownerID
//        self.title = title
//        self.isFavorite = isFavorite
//        self.trackCode = trackCode
//        self.views = views
//        self.localViews = localViews
//        self.platform = platform
//        self.videoRepeat = videoRepeat
//    }
//}
//
//// MARK: - Comments
//class Comments: Codable {
//    let count, canPost: Int
//    let groupsCanPost: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case count
//        case canPost = "can_post"
//        case groupsCanPost = "groups_can_post"
//    }
//
//    init(count: Int, canPost: Int, groupsCanPost: Bool?) {
//        self.count = count
//        self.canPost = canPost
//        self.groupsCanPost = groupsCanPost
//    }
//}
//
//// MARK: - CopyHistory
//class CopyHistory: Codable {
//    let id, ownerID, fromID, date: Int
//    let postType: PostTypeEnum
//    let text: String
//    let attachments: [CopyHistoryAttachment]
//    let postSource: CopyHistoryPostSource
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case ownerID = "owner_id"
//        case fromID = "from_id"
//        case date
//        case postType = "post_type"
//        case text, attachments
//        case postSource = "post_source"
//    }
//
//    init(id: Int, ownerID: Int, fromID: Int, date: Int, postType: PostTypeEnum, text: String, attachments: [CopyHistoryAttachment], postSource: CopyHistoryPostSource) {
//        self.id = id
//        self.ownerID = ownerID
//        self.fromID = fromID
//        self.date = date
//        self.postType = postType
//        self.text = text
//        self.attachments = attachments
//        self.postSource = postSource
//    }
//}
//
//// MARK: - CopyHistoryAttachment
//class CopyHistoryAttachment: Codable {
//    let type: AttachmentType
//    let video: Video
//
//    init(type: AttachmentType, video: Video) {
//        self.type = type
//        self.video = video
//    }
//}
//
//// MARK: - CopyHistoryPostSource
//class CopyHistoryPostSource: Codable {
//    let type: PostSourceType
//
//    init(type: PostSourceType) {
//        self.type = type
//    }
//}
//
//enum PostSourceType: String, Codable {
//    case api = "api"
//    case vk = "vk"
//}
//
//enum PostTypeEnum: String, Codable {
//    case post = "post"
//}
//
//// MARK: - Likes
//class Likes: Codable {
//    let count, userLikes, canLike, canPublish: Int
//
//    enum CodingKeys: String, CodingKey {
//        case count
//        case userLikes = "user_likes"
//        case canLike = "can_like"
//        case canPublish = "can_publish"
//    }
//
//    init(count: Int, userLikes: Int, canLike: Int, canPublish: Int) {
//        self.count = count
//        self.userLikes = userLikes
//        self.canLike = canLike
//        self.canPublish = canPublish
//    }
//}
//
//// MARK: - ItemPostSource
//class ItemPostSource: Codable {
//    let type: PostSourceType
//    let platform: String?
//
//    init(type: PostSourceType, platform: String?) {
//        self.type = type
//        self.platform = platform
//    }
//}
//
//// MARK: - Reposts
//class Reposts: Codable {
//    let count, userReposted: Int
//
//    enum CodingKeys: String, CodingKey {
//        case count
//        case userReposted = "user_reposted"
//    }
//
//    init(count: Int, userReposted: Int) {
//        self.count = count
//        self.userReposted = userReposted
//    }
//}
//
//// MARK: - Views
//class Views: Codable {
//    let count: Int
//
//    init(count: Int) {
//        self.count = count
//    }
//}
//
//// MARK: - Profile
//class Profile: Codable {
//    let firstName: String
//    let id: Int
//    let lastName: String
//    let canAccessClosed, isClosed: Bool?
//    let sex: Int
//    let screenName: String?
//    let photo50, photo100: String
//    let onlineInfo: OnlineInfo
//    let online: Int
//    let onlineMobile, onlineApp: Int?
//    let deactivated: String?
//
//    enum CodingKeys: String, CodingKey {
//        case firstName = "first_name"
//        case id
//        case lastName = "last_name"
//        case canAccessClosed = "can_access_closed"
//        case isClosed = "is_closed"
//        case sex
//        case screenName = "screen_name"
//        case photo50 = "photo_50"
//        case photo100 = "photo_100"
//        case onlineInfo = "online_info"
//        case online
//        case onlineMobile = "online_mobile"
//        case onlineApp = "online_app"
//        case deactivated
//    }
//
//    init(firstName: String, id: Int, lastName: String, canAccessClosed: Bool?, isClosed: Bool?, sex: Int, screenName: String?, photo50: String, photo100: String, onlineInfo: OnlineInfo, online: Int, onlineMobile: Int?, onlineApp: Int?, deactivated: String?) {
//        self.firstName = firstName
//        self.id = id
//        self.lastName = lastName
//        self.canAccessClosed = canAccessClosed
//        self.isClosed = isClosed
//        self.sex = sex
//        self.screenName = screenName
//        self.photo50 = photo50
//        self.photo100 = photo100
//        self.onlineInfo = onlineInfo
//        self.online = online
//        self.onlineMobile = onlineMobile
//        self.onlineApp = onlineApp
//        self.deactivated = deactivated
//    }
//}
//
//// MARK: - OnlineInfo
//class OnlineInfo: Codable {
//    let visible: Bool
//    let lastSeen: Int?
//    let isOnline, isMobile: Bool
//    let appID: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case visible
//        case lastSeen = "last_seen"
//        case isOnline = "is_online"
//        case isMobile = "is_mobile"
//        case appID = "app_id"
//    }
//
//    init(visible: Bool, lastSeen: Int?, isOnline: Bool, isMobile: Bool, appID: Int?) {
//        self.visible = visible
//        self.lastSeen = lastSeen
//        self.isOnline = isOnline
//        self.isMobile = isMobile
//        self.appID = appID
//    }
//}
