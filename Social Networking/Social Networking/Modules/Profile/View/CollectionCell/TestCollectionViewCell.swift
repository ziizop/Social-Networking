//
//  UserCell.swift
//  WebinarLayout2020
//
//  Created by Алексей Пархоменко on 12.01.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//
import Foundation
import UIKit

class UserCell: UICollectionViewCell {
    
    private lazy var inputTextFild: UITextField = {
        let textFild = UITextField()
        textFild.placeholder = "Добавить пост"
        return textFild
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    func setupConstraints() {
        
        contentView.addSubview(inputTextFild)
        inputTextFild.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview().inset(5)
        }
    }
    
    func configures(text: String) {
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
