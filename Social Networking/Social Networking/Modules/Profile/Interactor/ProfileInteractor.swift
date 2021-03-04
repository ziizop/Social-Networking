//
//  ProfileInteractor.swift
//  Social Networking
//
//  Created by Anastas Smekh on 01.03.2021.
//

import Foundation

protocol ProfileInteractorOutput: class {
    
}

protocol ProfileInteractorInput {
    
}

final class ProfileInteractor {
    weak var presenter: ProfileInteractorOutput?
}

//MARK: - ProfileInteractorInput
extension ProfileInteractor: ProfileInteractorInput {
    
}
