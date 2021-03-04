//
//  ProfileFriendsCollectionViewCell.swift
//  Social Networking
//
//  Created by Anastas Smekh on 01.03.2021.
//

import UIKit

class ProfileFriendsCollectionViewCell: UICollectionViewCell {
    
    private lazy var conteinerView: UIView = {
        let view = UIView()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        return view
    }()
    
    private lazy var  avatarUser: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "_8qBzaeKfV0 (1)")
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .light)
        if #available(iOS 13.0, *) {
            label.textColor = .black
        } else {
            label.textColor = .systemGray
        }
        label.text = "TEST"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configurView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configurView() {
        
        conteinerView.addSubview(avatarUser)
        conteinerView.addSubview(nameLabel)
        contentView.addSubview(conteinerView)
        
        conteinerView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview().inset(10)
        }
        
        avatarUser.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
//            make.leading.top.trailing.equalToSuperview().inset(20)
            make.width.height.equalTo(60)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarUser.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func configur(_ name: String, _ avatarImage: UIImage) {
        avatarUser.image = avatarImage
        nameLabel.text = name
    }
    
}
