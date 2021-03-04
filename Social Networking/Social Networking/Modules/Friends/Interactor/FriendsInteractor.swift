//
//  FriendsInteractor.swift
//  Social Networking
//
//  Created by Anastas Smekh on 28.02.2021.
//

import UIKit

protocol FriendsInteractorOutput:class {
    
}

protocol FriendsInteractorInput {
    
}

final class FriendsInteractor {
    weak var presenter: FriendsInteractorOutput?
}

extension FriendsInteractor: FriendsInteractorInput {
    
}
