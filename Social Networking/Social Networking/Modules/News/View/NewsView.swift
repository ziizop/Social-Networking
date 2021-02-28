//
//  NewsView.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import UIKit

protocol NewsViewOutput {
    func viewDidLoad()
}

protocol NewsViewInput: class {
    func reloadData()
}

final class NewsView: BaseViewController {
    
    var presenter: NewsViewOutput?
    
    private lazy var newsTableView: UITableView = {
        var tableView: UITableView
        
        if #available(iOS 13.0, *) {
            tableView = UITableView(frame: .zero, style: .plain)
        } else {
            tableView = UITableView(frame: .zero, style: .grouped)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellWithClass: NewsStorysTableViewCell.self)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configure()
        
    }
    
    private func configure() {
        view.addSubview(newsTableView)
        
        newsTableView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
    
}

//MARK: - NewsViewInput
extension NewsView: NewsViewInput {
    
    func reloadData() {
        newsTableView.reloadData()
    }
}

//MARK: - UITableViewDelegate
extension NewsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

//MARK: - UITableViewDataSource
extension NewsView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            print("ЗАХОДИМ")
            return 10
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsStorysTableViewCell.reuseIdentifier, for: indexPath) as?  NewsStorysTableViewCell
              else { return UITableViewCell() }
        switch indexPath.section {
        case 0:
            cell.configurSearchBar()
        case 1:
            cell.configurStorys("Anastas", avatar: #imageLiteral(resourceName: "_8qBzaeKfV0 (1)"))
        case 2:
            cell.configureNews()
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 80
        case 1:
            return 130
        case 2:
           return 600
        default:
            return 0 
        }
    }
}


