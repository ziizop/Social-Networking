//
//  TabBarInteractor.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import Foundation

protocol TabBarInteractorOutput: class {
    
}

protocol TabBarInteractorInput {
    
}

final class TabBarInteractor {
    weak var presenter: TabBarInteractorOutput?
}

extension TabBarInteractor: TabBarInteractorInput {
    
}
