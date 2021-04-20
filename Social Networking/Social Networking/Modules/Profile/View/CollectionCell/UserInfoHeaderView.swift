//
//  UserInfoHeaderView.swift
//  Social Networking
//
//  Created by Anastas Smekh on 09.03.2021.
//

import UIKit

class UserInfoHeaderView: UICollectionViewCell {

    private lazy var conteinerUserInformationView: UIView = {
        let view = UIView()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        return view
    }()
    
    private lazy var userAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "_8qBzaeKfV0 (1)")
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .light)
        if #available(iOS 13.0, *) {
            label.textColor = .black
        } else {
            label.textColor = .black
        }
        label.text = "Anastas Smekh"
        return label
    }()
    
    private lazy var userInformationOnlineOrOffline: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .light)
        if #available(iOS 13.0, *) {
            label.textColor = .systemGray
        } else {
            label.textColor = .gray
        }
        label.text = "online"
        return label
    }()
    
    private lazy var messagesButton: ButtonView? = {
        let button = ButtonView(title: "Сообщения", target: self, selector: #selector(changeBackgroundIn(_ :)))
        return button
    }()
    
    private lazy var friendsButton: ButtonView? = {
        let button = ButtonView(title: "У вас в друзьях", target: self, selector: #selector(changeBackgroundIn(_ :)))
        return button
    }()
    
    private lazy var separation: UIView? = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    
    private lazy var iconCity: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "house")
        imageView.tintColor = .systemGray
        return imageView
    }()
    
    private lazy var labelCity: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.text = "Город:"
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var labelCityName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.text = "Санкт-Петербург"
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var iconFollowers: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dot.radiowaves.right")
        imageView.tintColor = .systemGray
        return imageView
    }()
    
    private lazy var labelFollowersCount: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.text = "163"
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var labelFollowers: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.text = "подписчика"
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var iconFullInfo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "info.circle.fill")
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var buttonFullInfo: UIButton? = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .light)
        button.imageView?.image = UIImage(named: "info.circle.fill")
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.setTitle("     Подробная информация", for: .normal)
        button.addTarget(self, action: #selector(changeBackgroundIn(_ :)), for: .touchDown)
        return button
    }()
    
    private lazy var separation1: UIView? = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    private lazy var collectionView: UICollectionView? = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 80, height: 100)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        if #available(iOS 13.0, *) {
            collectionView.backgroundColor = .systemBackground
        } else {
            collectionView.backgroundColor = .white
        }
        collectionView.registers(cellWithClass: ProfileFriendsCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    private lazy var separation2: UIView? = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    private lazy var photoImagesProfilCollection: UICollectionView? = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0.5, left: 0.5, bottom: 0.5, right: 0.5)
        layout.itemSize = CGSize(width: 110, height: 110)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        if #available(iOS 13.0, *) {
            collectionView.backgroundColor = .systemBackground
        } else {
            collectionView.backgroundColor = .white
        }
        collectionView.registers(cellWithClass: ProfilePhotosCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    //MARK: - User add post
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Добавить пост"
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func userInformation(userData: String?)   {
        
        conteinerUserInformationView.addSubview(userAvatar)
        conteinerUserInformationView.addSubview(userNameLabel)
        conteinerUserInformationView.addSubview(userInformationOnlineOrOffline)
        
        guard let messagesButton = messagesButton,
              let friendsButton = friendsButton,
              let separation = separation,
              let buttonFullInfo = buttonFullInfo,
              let separation1 = separation1,
              let collectionView = collectionView,
              let separation2 = separation2,
              let photoImagesProfilCollection = photoImagesProfilCollection
        else { return }
        conteinerUserInformationView.addSubview(messagesButton)
        conteinerUserInformationView.addSubview(friendsButton)
        
        conteinerUserInformationView.addSubview(separation)
        
        conteinerUserInformationView.addSubview(iconCity)
        conteinerUserInformationView.addSubview(labelCity)
        conteinerUserInformationView.addSubview(labelCityName)
        
        conteinerUserInformationView.addSubview(iconFollowers)
        conteinerUserInformationView.addSubview(labelFollowersCount)
        conteinerUserInformationView.addSubview(labelFollowers)
        
        conteinerUserInformationView.addSubview(iconFullInfo)
        conteinerUserInformationView.addSubview(buttonFullInfo)
        
        conteinerUserInformationView.addSubview(separation1)
        
        conteinerUserInformationView.addSubview(collectionView)
        
        conteinerUserInformationView.addSubview(separation2)
        
        conteinerUserInformationView.addSubview(photoImagesProfilCollection)
        contentView.addSubview(conteinerUserInformationView)
        
        conteinerUserInformationView.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
        }
        
        userAvatar.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(15)
            make.width.height.equalTo(100)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(35)
            make.leading.equalTo(userAvatar.snp.trailing).offset(10)
        }
        
        userInformationOnlineOrOffline.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(5)
            make.leading.equalTo(userAvatar.snp.trailing).offset(10)
        }
        
        messagesButton.snp.makeConstraints { make in
            make.top.equalTo(userAvatar.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(15)
            make.height.equalTo(50)
            make.width.equalTo(170)
        }
        
        friendsButton.snp.makeConstraints { make in
            make.top.equalTo(userAvatar.snp.bottom).offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.height.equalTo(50)
            make.width.equalTo(170)
        }
        
        separation.snp.makeConstraints { make in
            make.top.equalTo(messagesButton.snp.bottom).offset(15)
            make.height.equalTo(1)
            make.width.leading.equalToSuperview().inset(15)
        }
        
        iconCity.snp.makeConstraints { make in
            make.top.equalTo(separation.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(15)
            make.width.height.equalTo(20)
        }
        
        labelCity.snp.makeConstraints { make in
            make.top.equalTo(separation.snp.bottom).offset(15)
            make.leading.equalTo(iconCity.snp.trailing).offset(25)
            make.height.equalTo(20)
            make.width.equalTo(48)
        }
        
        labelCityName.snp.makeConstraints { make in
            make.top.equalTo(separation.snp.bottom).offset(15)
            make.leading.equalTo(labelCity.snp.trailing).offset(3)
            make.height.equalTo(20)
            make.width.equalTo(250)
        }
        
        iconFollowers.snp.makeConstraints { make in
            make.top.equalTo(iconCity.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(15)
            make.width.height.equalTo(20)
        }
        
        labelFollowersCount.snp.makeConstraints { make in
            make.top.equalTo(iconCity.snp.bottom).offset(15)
            make.leading.equalTo(iconFollowers.snp.trailing).offset(25)
            make.height.equalTo(20)
            make.width.equalTo(25)
        }
        
        labelFollowers.snp.makeConstraints { make in
            make.top.equalTo(iconCity.snp.bottom).offset(15)
            make.leading.equalTo(labelFollowersCount.snp.trailing).offset(3)
            make.height.equalTo(20)
            make.width.equalTo(250)
        }
        
        iconFullInfo.snp.makeConstraints { make in
            make.top.equalTo(iconFollowers.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(15)
            make.width.height.equalTo(20)
        }
        
        buttonFullInfo.snp.makeConstraints { make in
            make.top.equalTo(iconFollowers.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(15)
            make.height.equalTo(20)
            make.width.equalTo(250)
        }
        
        separation1.snp.makeConstraints { make in
            make.top.equalTo(iconFullInfo.snp.bottom).offset(15)
            make.height.equalTo(1)
            make.width.leading.equalToSuperview().inset(15)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(separation1.snp.bottom).offset(15)
            make.height.equalTo(80)
            make.width.leading.equalToSuperview().inset(15)
        }
        
        separation2.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(15)
            make.height.equalTo(1)
            make.width.leading.equalToSuperview().inset(15)
        }
        
        photoImagesProfilCollection.snp.makeConstraints { make in
            make.top.equalTo(separation2.snp.bottom).offset(15)
            make.height.equalTo(235)
            make.width.leading.equalToSuperview().inset(10)
        }
        
        userNameLabel.text = userData
        
        /*
         Временная логика
         */
        
//        if AuthManager.shared.userId == userData?.id {
//            friendsButton.isHidden = true
//        }
//        userNameLabel.text = userData?.firstName
//
//        NetworkingService.shared.uploadingImageByUrl(userData?.photoMax ?? "") { [ weak self ] ( result ) in
//            guard let self = self else { return }
//            switch result {
//            case .success(let image):
//                self.userAvatar.image = image
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//
//
//        if userData?.online == 1 {
//            userInformationOnlineOrOffline.alpha = 1
//        } else {
//            userInformationOnlineOrOffline.alpha = 0
//        }
        
        /*
         Временная логика
         */
    }
    
    func addPostUser() {
        contentView.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(5)
            make.top.bottom.equalToSuperview().inset(5)
        }
        }
    
    func post(text: String) {
    }
    
    @objc private func changeBackgroundIn(_ sender: UIButton) {
        print("TOUCH")
    }
}

//MARK: - UICollectionViewDelegate
extension UserInfoHeaderView: UICollectionViewDelegate {
    
}

//MARK: - UICollectionViewDataSource
extension UserInfoHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return 10
        }
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileFriendsCollectionViewCell.reuseIdentifier, for: indexPath) as? ProfileFriendsCollectionViewCell else { return UICollectionViewCell() }
            return cell
        }
        guard let photos = collectionView.dequeueReusableCell(withReuseIdentifier: ProfilePhotosCollectionViewCell.reuseIdentifier, for: indexPath) as? ProfilePhotosCollectionViewCell else { return UICollectionViewCell() }
        photos.backgroundColor = .red
        return photos
    }
}
