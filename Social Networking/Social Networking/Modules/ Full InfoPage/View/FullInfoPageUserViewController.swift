//
//  FullInfoPageUserViewController.swift
//  Social Networking
//
//  Created by Anastas Smekh on 18.03.2021.
//

import UIKit

protocol FullInfoPageUserViewControllerOutput {
    
}

protocol FullInfoPageUserViewControllerInput: class {
    
}

final class FullInfoPageUserViewController: UIViewController {
    
    var presenter: FullInfoPageUserViewControllerOutput?
    
    private var data: UserProfile?
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellWithClass: FirstInfoTableViewCell.self)
        tableView.register(cellWithClass: ButtonTableViewCell.self)
        tableView.register(cellWithClass: BasecTableViewCell.self)
        tableView.register(cellWithClass: ContactsTableViewCell.self)
        tableView.register(cellWithClass: EducationTableViewCell.self)
        tableView.register(cellWithClass: PersonalInformationTableViewCell.self)
        return tableView
    }()
    
    init(_ data: UserProfile) {
        super.init(nibName: nil, bundle: nil)
        self.data = data
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
        }
        
        navigationItem.title = "Подробнее"
    }
}

//MARK: - FullInfoPageUserViewControllerInput
extension FullInfoPageUserViewController: FullInfoPageUserViewControllerInput {
    
}

//MARK: - UITableViewDelegate
extension FullInfoPageUserViewController: UITableViewDelegate {

}

//MARK: - UITableViewDataSource
extension FullInfoPageUserViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        FullPageInfoTypeSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = FullPageInfoTypeSection(rawValue: section) else { return 0 }
        switch section {
        case .firstInfo:
            return 1
        case .button:
            return 1
        case .basec:
            return 1
        case .contacts:
            return 1
        case .education:
            return 1
        case .personalInformation:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = FullPageInfoTypeSection(rawValue: indexPath.section)
              else { return UITableViewCell() }
        switch section {
        case .firstInfo:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstInfoTableViewCell.reuseIdentifier, for: indexPath) as? FirstInfoTableViewCell else { return UITableViewCell() }
            cell.backgroundColor = .red
            return cell
        case .button:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.reuseIdentifier, for: indexPath) as? ButtonTableViewCell else { return UITableViewCell() }
            cell.backgroundColor = .yellow
            return cell
        case .basec:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BasecTableViewCell.reuseIdentifier, for: indexPath) as? BasecTableViewCell else { return UITableViewCell() }
            cell.backgroundColor = .orange
            return cell
        case .contacts:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactsTableViewCell.reuseIdentifier, for: indexPath) as? ContactsTableViewCell else { return UITableViewCell() }
            cell.backgroundColor = .gray
            return cell
        case .education:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EducationTableViewCell.reuseIdentifier, for: indexPath) as? EducationTableViewCell else { return UITableViewCell() }
            cell.backgroundColor = .blue
            return cell
        case .personalInformation:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonalInformationTableViewCell.reuseIdentifier, for: indexPath) as? PersonalInformationTableViewCell else { return UITableViewCell() }
            cell.backgroundColor = .green
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = FullPageInfoTypeSection(rawValue: indexPath.section) else { return 0 }
        switch section {
        case .firstInfo:
            return 200
        case .button:
            return 250
        case .basec:
            return 350
        case .contacts:
            return 150
        case .education:
            return 150
        case .personalInformation:
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = FullPageInfoTypeSection(rawValue: section) else { return "" }
        switch section {
        case .firstInfo:
            return ""
        case .button:
            return ""
        case .basec:
            return "Основная информация"
        case .contacts:
            return "Контакты"
        case .education:
            return "Образование"
        case .personalInformation:
            return "Личная информация"
        }
    }
}
