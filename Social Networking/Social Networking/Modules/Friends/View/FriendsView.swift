//
//  FriendsView.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import UIKit

protocol FriendsViewOutput {
    func viewDidLoad()
}

protocol  FriendsViewInput: class {
    
}

final class FriendsView: BaseViewController {
    
    var presenter: FriendsViewOutput?
    
    private lazy var tableView: UITableView = {
        let tableView: UITableView
        if #available(iOS 13.0, *) {
            tableView = UITableView(frame: .zero, style: .insetGrouped)
        } else {
            tableView = UITableView(frame: .zero, style: .plain)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellWithClass: FriendsTableViewCell.self)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configur()
    }
    
    private func  configur() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
}

//MARK: - FriendsViewInput
extension FriendsView: FriendsViewInput {
    
}

//MARK: - UITableViewDelegate

extension FriendsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Важные друзья"
        case 2:
            return "Мои друзья"
        default:
            return ""
        }
    }
}

//MARK: - UITableViewDataSource
extension FriendsView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 5
        case 2:
            return 10
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.reuseIdentifier , for: indexPath) as? FriendsTableViewCell else { return  UITableViewCell() }
        switch indexPath.section {
        case 0:
            cell.configureSearchBar() 
        case 1:
            cell.configureFriends()
        case 2:
            cell.configureFriends()
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 60
        case 1:
            return 80
        case 2:
            return 80
        default:
            return 0
        
        }
    }
}
