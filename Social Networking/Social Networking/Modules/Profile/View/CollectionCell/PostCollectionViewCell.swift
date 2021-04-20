//
//  PostCollectionViewCell.swift
//  Social Networking
//
//  Created by Anastas Smekh on 16.03.2021.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    private lazy var  textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.numberOfLines = 6
        return label
    }()
    
    private lazy var imagePost: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.9693087935, green: 0.9635462165, blue: 0.9737381339, alpha: 1)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.addSubview(textLabel)
        contentView.addSubview(imagePost)
        
        textLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(10)
        }
        
        imagePost.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    func addPost(_ post: UserPost?) {
        guard let textPost = post?.text ,
              let image = post?.imagePostString else { return }
        textLabel.text = textPost
        imagePost.image = UIImage(named: image)
    }
}
