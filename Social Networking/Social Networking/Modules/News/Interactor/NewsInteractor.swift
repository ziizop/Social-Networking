//
//  NewsInteractor.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import Foundation

protocol NewsInteractorOutput: class {
    func newsDataJson(_ data: [NewsResponse])
}

protocol NewsInteractorInput {
    func factoryNews()
}

final class NewsInteractor {
    weak var presenter: NewsInteractorOutput?
}

extension NewsInteractor: NewsInteractorInput {
    func factoryNews() {
        DispatchQueue.global(qos: .background).async {
            NetworkingService.shared.newsRequest { [ weak self ] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    print(data.count)
                    DispatchQueue.main.async {
                        self.presenter?.newsDataJson(data)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
