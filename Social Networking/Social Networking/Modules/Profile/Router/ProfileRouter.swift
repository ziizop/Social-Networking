//
//  ProfileRouter.swift
//  Social Networking
//
//  Created by Anastas Smekh on 01.03.2021.
//

import Foundation

protocol ProfileRouterInput: class {
    
}

final class ProfileRouter {
    weak var view: ProfileViewInput?
}

//MARK: - ProfileRouterInput
extension ProfileRouter: ProfileRouterInput {
    
}
