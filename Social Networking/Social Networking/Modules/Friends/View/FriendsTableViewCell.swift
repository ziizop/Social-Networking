//
//  FriendsTableViewCell.swift
//  Social Networking
//
//  Created by Anastas Smekh on 28.02.2021.
//

import UIKit

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
    
    func configureFriends() {
        contentView.addSubview(avatarImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(cityLabel)
        
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
