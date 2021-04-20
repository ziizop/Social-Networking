//
//  NewsTableViewCell.swift
//  Social Networking
//
//  Created by Anastas Smekh on 30.03.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    private lazy var newsView: UIView = {
        let view = UIView()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        return view
    }()
    
    private lazy var avataNews: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "_8qBzaeKfV0 (1)")
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var nameNews: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.textColor = .black
        label.text = "Defolt"
        return label
    }()
    
    private lazy var publicationTime: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.textColor = .gray
        label.text = " 10 минут назад"
        return label
    }()
    
    private lazy var textNews: UILabel = {
        let textView = UILabel()
        textView.font = .systemFont(ofSize: 15, weight: .light)
        textView.numberOfLines = 6
        textView.text = "Таким образом новая модель организационной деятельности способствует подготовки и реализации систем массового участия. Равным образом консультация с широким активом требуют определения и уточнения модели развития. С другой стороны рамки и место обучения кадров способствует подготовки и реализации модели развития.Равным образом консультация с широким активом требуют определения и уточнения модели развития. Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке модели развития. Равным образом постоянный количественный рост и сфера нашей активности играет важную роль в формировании системы обучения кадров, соответствует насущным потребностям.Разнообразный и богатый опыт консультация с широким активом обеспечивает широкому кругу. Товарищи! сложившаяся структура организации представляет собой интересный эксперимент проверки направлений прогрессивного развития. Значимость этих проблем настолько очевидна, что дальнейшее развитие различных форм деятельности обеспечивает широкому кругу (специалистов) участие в формировании новых предложений."
        textView.textColor = .black
        return textView
    }()
    
    private lazy var newsImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var newsImageSize = 0
    private var name: String?
    private var avataUsers: UIImage?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configView() {
        
    }
    
    private func configureNews(data: NewsResponse?) {
        
        newsView.addSubview(avataNews)
        newsView.addSubview(nameNews)
        newsView.addSubview(publicationTime)
        newsView.addSubview(textNews)
        newsView.addSubview(newsImage)
        
        contentView.addSubview(newsView)
        newsView.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
        }
        
        avataNews.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(30)
            make.width.height.equalTo(60)
        }
        
        nameNews.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.leading.equalTo(avataNews.snp.trailing).offset(5)
        }
        
        publicationTime.snp.makeConstraints { make in
            make.top.equalTo(nameNews.snp.bottom).offset(2)
            make.leading.equalTo(avataNews.snp.trailing).offset(5)
        }
        
        textNews.snp.makeConstraints { make in
            make.top.equalTo(avataNews.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
            make.width.equalToSuperview().inset(30)
        }
        
        textNews.text = data?.text
        
        if data?.url != nil {
            
            newsImage.snp.makeConstraints { make in
                make.top.equalTo(textNews.snp.bottom).offset(10)
                make.trailing.leading.equalToSuperview().inset(30)
                make.height.equalTo(400)
                make.bottom.equalToSuperview().inset(10)
            }
            
            print("Ссылка на картинку:  \(data?.url)")
            NetworkingService.shared.uploadingImageByUrl(data?.url ?? "") { [ weak self ](result) in
                guard let self = self else { return }
                switch result {
                case .success(let imageData):
                    
                    self.newsImage.image = imageData
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    public func configure( data: NewsResponse? ) {
        configureNews(data: data)
    }
}

