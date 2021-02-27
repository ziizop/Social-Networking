//
//  NewsInteractor.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import Foundation

protocol NewsInteractorOutput: class {
    
}

protocol NewsInteractorInput {
    
}

final class NewsInteractor {
    weak var presenter: NewsInteractorOutput?
}

extension NewsInteractor: NewsInteractorInput {
    
}
