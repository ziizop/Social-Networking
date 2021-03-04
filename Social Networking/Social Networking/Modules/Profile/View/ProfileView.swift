//
//  ProfileView.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import UIKit

protocol ProfileViewOutput {
    func viewDidLoad()
}

protocol ProfileViewInput: class {
    
}
final class ProfileView: BaseViewController {
    
    var presenter: ProfileViewOutput?
    
    private lazy var tableView: UITableView = {
        let tableView: UITableView
        if #available(iOS 13.0, *) {
            tableView = UITableView(frame: .zero, style: .insetGrouped)
        } else {
            tableView = UITableView(frame: .zero, style: .plain)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellWithClass: ProfileTableViewCell.self)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configure()
        view.backgroundColor = .yellow
    }
    
    private func configure() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
        }
    }
    
}

//MARK: - ProfileViewInput

extension ProfileView: ProfileViewInput {
    
}

//MARK: - UITableViewDelegate
extension ProfileView: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
extension ProfileView: UITableViewDataSource {
    
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
            return 10
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.reuseIdentifier, for: indexPath) as? ProfileTableViewCell else { return UITableViewCell() }
        switch indexPath.section {
        case 0:
            cell.userInformation()
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 680
        case 1:
            return 60
        case 2:
            return 300
        default:
            return 0
        }
    }
}
