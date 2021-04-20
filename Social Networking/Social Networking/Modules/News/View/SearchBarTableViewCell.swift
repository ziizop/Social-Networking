//
//  SearchBarTableViewCell.swift
//  Social Networking
//
//  Created by Anastas Smekh on 30.03.2021.
//

import UIKit

class SearchBarTableViewCell: UITableViewCell {
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Поиск новостей"
        searchBar.delegate = self
        
        return searchBar
    }()
    
    private lazy var avatarUser: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "_8qBzaeKfV0 (1)")
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configView() {
        
    }
    
    func configurSearchBar() {
        contentView.addSubview(avatarUser)
        contentView.addSubview(searchBar)
        
        avatarUser.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(30)
            make.width.height.equalTo(60)
        }
        searchBar.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(avatarUser.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
    }
}

//MARK: - UISearchBarDelegate
extension SearchBarTableViewCell: UISearchBarDelegate {
    
}
