//
//  ProfileView.swift
//  Social Networking
//
//  Created by Anastas Smekh on 27.02.2021.
//

import UIKit

protocol ProfileViewOutput {
    func viewDidLoad()
    func viewDidAppear()
    func cellForRowAtUserInfo() -> [UserProfile]?
    func cellForRowAtUserPosts() -> [UserPost]?
    func closeSecion()
    func modalPage()
}

protocol ProfileViewInput: class {
    func reloadData()
    var navigationController: UINavigationController? {get}
    func show()
    
}

final class ProfileView: BaseViewController {
    
    var presenter: ProfileViewOutput?
    
    private var dataSource: UICollectionViewDiffableDataSource<UserPageTypeSection,AnyHashable>?
    
    private var item: [Int] = [1] // для добавления поста
    private var test: [Int] = [2]
    
    var userInfo: [UserProfile]? = []
    var userPost: [UserPost]? = []
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.backgroundColor = #colorLiteral(red: 0.9961728454, green: 0.9902502894, blue: 1, alpha: 1)
        collectionView.registers(cellWithClass: ProfileInfoCollectionViewCell.self)
        collectionView.registers(cellWithClass: ProfileAddPostCollectionViewCell.self)
        collectionView.registers(cellWithClass: PostCollectionViewCell.self)
        return collectionView
    }()
    
    private lazy var barButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        barButton.style = .plain
        barButton.tintColor = .systemRed
        barButton.title = "Выход"
        barButton.target = self
        barButton.action = #selector(closeSecion)
        return barButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .yellow
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
        configure()
        setupDataSource()
        dataReload()
    }
    
    private func configure() {
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
        }
        
        navigationItem.title = "Anastas"
        navigationItem.rightBarButtonItem = barButton
        collectionView.reloadData()
    }
    
    @objc func closeSecion() {
        print("Вышли")
        presenter?.closeSecion()
    }
    
}

//MARK: - ProfileViewInput

extension ProfileView: ProfileViewInput {
    func reloadData() {
        collectionView.reloadData()
    }
    
    func show() {
        print("Tests")
    }
}

//MARK: - UICollectionViewCompositionalLayout
extension ProfileView {
    
    //MARK: - Data management by section
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<UserPageTypeSection, AnyHashable>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, Int) -> UICollectionViewCell? in
            guard let section = UserPageTypeSection(rawValue: indexPath.section) else { fatalError("Ошибка секции") }
            switch section {
            case .userInfo:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileInfoCollectionViewCell.reuseIdentifier, for: indexPath) as? ProfileInfoCollectionViewCell else { return UICollectionViewCell() }
                cell.delegate = self
                cell.userInformation(userData: Int as! UserProfile)
                cell.layer.cornerRadius = 10
                cell.clipsToBounds = true
                return cell
            case .userAddPost:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileAddPostCollectionViewCell.reuseIdentifier, for: indexPath) as? ProfileAddPostCollectionViewCell else { return UICollectionViewCell() }
                return cell
            case .userPost:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.reuseIdentifier, for: indexPath) as? PostCollectionViewCell else { return UICollectionViewCell() }
                cell.addPost(Int as! UserPost)
                cell.layer.cornerRadius = 10
                cell.clipsToBounds = true
                return cell
            }
        })
            
    }
    
    //MARK: - Reload data
    private func dataReload() {
        guard let post = presenter?.cellForRowAtUserPosts(),
              let userInfo = presenter?.cellForRowAtUserInfo()
              else { return }
        var snapshot = NSDiffableDataSourceSnapshot<UserPageTypeSection, AnyHashable>()
        snapshot.appendSections([.userInfo, .userAddPost, .userPost])
        snapshot.appendItems(userInfo, toSection: .userInfo)
        snapshot.appendItems(item, toSection: .userAddPost)
        snapshot.appendItems(post, toSection: .userPost)
        dataSource?.apply(snapshot, animatingDifferences: false)
    }
    
    
    //MARK: - Create layout
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let layyout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            guard let section = UserPageTypeSection(rawValue: sectionIndex) else { fatalError("Ошибка секции") }
            switch section {
            case .userInfo:
                return self.createUserInfoSection()
            case .userAddPost:
                return self.createAddPostSection()
            case .userPost:
                return self.createPostsSection()
            }
        }
        return layyout
    }
    
    //MARK: - Layout section
    private func createUserInfoSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(680))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 8, trailing: 0)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 10, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    private func createAddPostSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(80))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 8, trailing: 0)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 10, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    private func createPostsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(600))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets.init(top: 8, leading: 0, bottom: 8, trailing: 0)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 10, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    /*
     Для ios ниже 13 Версии
     */
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        presenter?.numberOfSections() ?? 0
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let section = UserPageTypeSection(rawValue: section) else { return 0 }
//        return presenter?.numberOfRowsInSection(section: section) ?? 0
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 0 {
//            return UIView()
//        }
//        return nil
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileInfoTableViewCell.reuseIdentifier, for: indexPath) as? ProfileInfoTableViewCell,
//              let section = UserPageTypeSection(rawValue: indexPath.row),
//              let userInfo = presenter?.cellForRowAt(section: section, indexRow: indexPath.row)
//              else  { return UITableViewCell() }
//        switch userInfo.type {
//                case.userInfo:
//                    cell.userInformation(userData: userInfo.data as? UserProfile)
//                case .userAddPost:
//                    cell.addPostUser()
//                    cell.textLabel?.text = "\(indexPath)"
//                case .userPost:
//                    cell.post(text: "\(indexPath)")
//                default:
//                    print("default")
//                }
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        guard let section = UserPageTypeSection(rawValue: indexPath.section) else { return 0 }
//        return presenter?.heightForRowAt(section) ?? 0
//    }
}

//MARK: - ProfileInfoCollectionViewCellDelegete
extension ProfileView: ProfileInfoCollectionViewCellDelegete {
    func didTap() {
        presenter?.modalPage()
    }
}
