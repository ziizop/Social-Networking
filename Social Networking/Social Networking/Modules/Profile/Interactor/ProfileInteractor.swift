//
//  ProfileInteractor.swift
//  Social Networking
//
//  Created by Anastas Smekh on 01.03.2021.
//

import Foundation

protocol ProfileInteractorOutput: class {
    func userInfoArray(_ data: [UserProfile]?)
    func userPostsArray(_ data: [UserPost]?)
}

protocol ProfileInteractorInput {
    func factoryUserInfoInPage()
    func factoryUserPostsInPage()
    func dataCollection()
}

final class ProfileInteractor {
    weak var presenter: ProfileInteractorOutput?
    private var dataArrays: [UserProfile]?
}

//MARK: - ProfileInteractorInput
extension ProfileInteractor: ProfileInteractorInput {
    
    /*
     Загружаем данные с сервера и компонуем  объекты для передачи на presenter
     */
    func factoryUserInfoInPage() {
        var dataArray: [UserCollectedData] = []
        var userID = AuthManager.shared.userId
        NetworkingService.shared.userProfil(userID) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let dataUser):
                print("Данные user: \n \(dataUser)")
                self.presenter?.userInfoArray(dataUser)
                self.dataArrays = dataUser
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func factoryUserPostsInPage() {
        let post: [UserPost] = [
            UserPost(id: nil, fromID: nil, ownerID: nil, date: nil, text: "Соображения высшего порядка, а также консультация с профессионалами из IT представляет собой интересный эксперимент проверки дальнейших направлений развитая системы массового участия. Разнообразный и богатый опыт курс на социально-ориентированный национальный проект представляет собой интересный эксперимент проверки позиций, занимаемых участниками в отношении поставленных задач. Не следует, однако, забывать о том, что консультация с профессионалами из IT требует от нас системного анализа модели развития.", canDelete: nil, canPin: nil, canArchive: nil, isArchived: nil, attachments: nil, imagePostString: "_8qBzaeKfV0 (1)"),
            UserPost(id: nil, fromID: nil, ownerID: nil, date: nil, text: "Соображения высшего порядка, а также консультация с профессионалами из IT представляет собой интересный эксперимент проверки дальнейших направлений развитая системы массового участия. Разнообразный и богатый опыт курс на социально-ориентированный национальный проект представляет собой интересный эксперимент проверки позиций, занимаемых участниками в отношении поставленных задач. Не следует, однако, забывать о том, что консультация с профессионалами из IT требует от нас системного анализа модели развития.", canDelete: nil, canPin: nil, canArchive: nil, isArchived: nil, attachments: nil, imagePostString: "notifications (1)"),
            UserPost(id: nil, fromID: nil, ownerID: nil, date: nil, text: "Соображения высшего порядка, а также консультация с профессионалами из IT представляет собой интересный эксперимент проверки дальнейших направлений разввленных задач. Не следует, однако, забывать о том, что консультация с профессионалами из IT требует от нас системного анализа модели развития.", canDelete: nil, canPin: nil, canArchive: nil, isArchived: nil, attachments: nil, imagePostString: "notifications (1)"),
            UserPost(id: nil, fromID: nil, ownerID: nil, date: nil, text: "Соображения высшего порядка, а также консультация с профессионалами из IT представляет собой интересный эксперишении поставленных задач. Не следует, однако, забывать о том, что консультация с профессионалами из IT требует от нас системного анализа модели развития.", canDelete: nil, canPin: nil, canArchive: nil, isArchived: nil, attachments: nil, imagePostString: "notifications (1)"),
            UserPost(id: nil, fromID: nil, ownerID: nil, date: nil, text: "Соображения высшего порядка, а также консультация с профессионалами из IT представляет собой интересный эксперимент проверки дальнейших направлений развитая стый опыт курс на социально-ориентированный национальный проект представляет собой интересный эксперимент проверки позиций, занимаемых участниками в отношении поставленных задач. Не следует, однако, забывать о том, что консультация с профессионалами из IT требует от нас системного анализа модели развития.", canDelete: nil, canPin: nil, canArchive: nil, isArchived: nil, attachments: nil, imagePostString: "notifications (1)"),
            UserPost(id: nil, fromID: nil, ownerID: nil, date: nil, text: "Соображения высшего порядка, а также консультация с профессионалами из IT представляет собой интересный эксперимент проверки дальнейших направлений развитая системы массового участия. Разнообразный и богатый опыт курс на социально-ориентированный национальный проект представляет собой интересный эксперимент проверки позиций, занимаемых участниками в отношении поледует, однако, забывать о том, что консультация с профессионалами из IT требует от нас системного анализа модели развития.", canDelete: nil, canPin: nil, canArchive: nil, isArchived: nil, attachments: nil, imagePostString: "notifications (1)"),
            UserPost(id: nil, fromID: nil, ownerID: nil, date: nil, text: "на социально-ориентированный национальный проект представляет собой интересный эксперимент проверки позиций, занимаемых участниками в отношении поставленных задач. Не следует, однако, забывать о том, что консультация с профессионалами из IT требует от нас системного анализа модели развития.", canDelete: nil, canPin: nil, canArchive: nil, isArchived: nil, attachments: nil, imagePostString: "notifications (1)"),
            UserPost(id: nil, fromID: nil, ownerID: nil, date: nil, text: "Соображения высшего порядка, а также консультация с профессионалами из IT представляет собой интересный эксперимент проверки дальнейших направлений развитая системы массового участия. Разнообразный и богатый опыт курс на социально-ориентированный нсионалами из IT требует от нас системного анализа модели развития.", canDelete: nil, canPin: nil, canArchive: nil, isArchived: nil, attachments: nil, imagePostString: "notifications (1)")
        ]
        self.presenter?.userPostsArray(post)
    }
    
    /*
     передача заполненного  массива данных на presenter
     */
    func dataCollection() {
        presenter?.userInfoArray(dataArrays)
    }
}
