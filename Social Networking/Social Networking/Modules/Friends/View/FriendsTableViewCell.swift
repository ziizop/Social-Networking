//
//  FriendsTableViewCell.swift
//  Social Networking
//
//  Created by Anastas Smekh on 28.02.2021.
//

import UIKit
import Kingfisher

class FriendsTableViewCell: UITableViewCell {
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Поиск"
        searchBar.delegate = self
        return searchBar
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        return view
    }()
    
    private lazy var onlineImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var avatarImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "_8qBzaeKfV0 (1)")
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.textColor = .black
        label.text = "Default"
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = .gray
        label.text = "City"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func  configureView() {
        
    }
    
    func configureFriends(_ data: FriendsModel) {
        contentView.addSubview(avatarImage)
        contentView.addSubview(onlineImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(cityLabel)
        
        onlineImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(65)
            make.top.bottom.equalToSuperview().inset(50)
            make.width.height.equalTo(25)
        }
        
        avatarImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.bottom.equalToSuperview().inset(10)
            make.width.height.equalTo(60)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.leading.equalTo(avatarImage.snp.trailing).offset(10)
        }
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.leading.equalTo(avatarImage.snp.trailing).offset(10)
            make.bottom.equalToSuperview().inset(15)
        }
        
        nameLabel.text = data.firstName
        cityLabel.text = data.title
        
        if data.online == 1 {
            onlineImage.image = #imageLiteral(resourceName: "iconfinder_clone-old_15483")
        }
        guard let url = URL(string: data.photo200_Orig) else { return }
        avatarImage.kf.setImage(with: url)
//        NetworkingService.shared.uploadingImageByUrl(data.photo200_Orig) { [weak self] (result) in
//            guard let self = self else { return }
//            switch result {
//            case .success(let image):
//                self.avatarImage.image = image
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }
    
    func configureSearchBar() {
        containerView.addSubview(searchBar)
        contentView.addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
        }
        
        searchBar.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        
    }
}

//MARK: - UISearchBar

extension FriendsTableViewCell: UISearchBarDelegate {
    
}
