//
//  UserPosts1.swift
//  Social Networking
//
//  Created by Anastas Smekh on 16.03.2021.
//

import Foundation

struct UserPost: Hashable {
    let id, fromID, ownerID, date: Int?
    let text: String?
    let canDelete: Int?
    let canPin: Int?
    let canArchive, isArchived: Bool?
    let attachments: String?
    let imagePostString: String?
}
