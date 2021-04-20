//
//  NewsView.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import UIKit

protocol NewsViewOutput {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewDidLayoutSubviews()
    func numberOfSections() -> Int
    func numberOfRowsInSection() -> Int
    func cellForRowAt(indexPath: Int) -> NewsResponse?
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
        tableView.estimatedRowHeight = 400.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(cellWithClass: NewsStorysTableViewCell.self)
        tableView.register(cellWithClass: NewsTableViewCell.self)
        tableView.register(cellWithClass: SearchBarTableViewCell.self)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
    }
    
    override func viewDidLayoutSubviews() {
        presenter?.viewDidLayoutSubviews()
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
        TypeSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let seaction = TypeSection(rawValue: section) else { return 0 }
        switch seaction {
        case .searchBar:
            return 1
        case .storys:
            return 1
        case .post:
            return presenter?.numberOfRowsInSection() ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let seaction = TypeSection(rawValue: indexPath.section)
              else { return UITableViewCell() }
        switch seaction {
        case .searchBar:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchBarTableViewCell.reuseIdentifier, for: indexPath) as? SearchBarTableViewCell else { return UITableViewCell() }
            cell.configurSearchBar()
            return cell
        case .storys:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsStorysTableViewCell.reuseIdentifier, for: indexPath) as? NewsStorysTableViewCell else { return UITableViewCell() }
            cell.configurStorys("Anastas", avatar: #imageLiteral(resourceName: "iconfinder_clone-old_15483"))
            return cell
        case .post:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseIdentifier, for: indexPath) as?  NewsTableViewCell,
                  let news = presenter?.cellForRowAt(indexPath: indexPath.row)
                  else  { return UITableViewCell() }
            cell.configure(data: news)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let seaction = TypeSection(rawValue: indexPath.section) else {  return 100 }
        switch seaction {
        case .searchBar:
            return 80
        case .storys:
            return 100
        case .post:
            return 400
        }
    }
}




