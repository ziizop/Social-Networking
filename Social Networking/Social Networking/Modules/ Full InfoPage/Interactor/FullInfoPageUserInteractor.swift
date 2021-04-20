//
//  FullInfoPageUserInteractor.swift
//  Social Networking
//
//  Created by Anastas Smekh on 18.03.2021.
//

import Foundation

protocol FullInfoPageUserInteractorOutput: class {
    
}

protocol FullInfoPageUserInteractorInput {
    
}

final class FullInfoPageUserInteractor {
    weak var presenter: FullInfoPageUserInteractorOutput?
    
}

extension FullInfoPageUserInteractor: FullInfoPageUserInteractorInput {
    
}
