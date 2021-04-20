//
//  ProfileAddPostTableViewCell.swift
//  Social Networking
//
//  Created by Anastas Smekh on 07.03.2021.
//

import UIKit

class ProfileAddPostCollectionViewCell: UICollectionViewCell {
    
    private lazy var inputTextFild: UITextField = {
        let textFild = UITextField()
        textFild.placeholder = "Добавить пост"
        return textFild
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.9693087935, green: 0.9635462165, blue: 0.9737381339, alpha: 1)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        contentView.addSubview(inputTextFild)
        inputTextFild.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(5)
            make.top.bottom.equalToSuperview().inset(3)
        }
    }
    
}
