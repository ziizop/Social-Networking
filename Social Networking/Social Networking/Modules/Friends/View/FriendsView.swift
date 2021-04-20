//
//  FriendsView.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import UIKit

protocol FriendsViewOutput {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func numberOfSections() -> Int
    func numberOfRowsInSectionAllFriends(section: FriendsType) -> Int
    func cellForRowAtFriends(_ section: FriendsType,_ indextRow: Int) -> FriendsModel?
    func titleForHeaderInSection(_ section: FriendsType) -> String?
    func heightForRowAt(_ section: FriendsType) -> CGFloat
}

protocol  FriendsViewInput: class {
    func reloadData()
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
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
    func reloadData() {
        tableView.reloadData()
    }
}

//MARK: - UITableViewDelegate

extension FriendsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - UITableViewDataSource
extension FriendsView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        FriendsType.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let mainSection = FriendsType(rawValue: section) else { return 0 }
        return presenter?.numberOfRowsInSectionAllFriends(section: mainSection) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.reuseIdentifier , for: indexPath) as? FriendsTableViewCell,
              let section = FriendsType(rawValue: indexPath.section),
              let friends = presenter?.cellForRowAtFriends(section, indexPath.row)
              else { return  UITableViewCell() }
        
        cell.configureFriends(friends)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = FriendsType(rawValue: section) else { return "" }
        return presenter?.titleForHeaderInSection(section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = FriendsType(rawValue: indexPath.section) else { return 80}
        return presenter?.heightForRowAt(section) ?? 0
    }
}
