import UIKit

protocol TabBarViewOutput {
    func viewDidLoad()
}

protocol TabBarViewInput: class {
    
}

final class TabBarView : UITabBarController {
    
    var presetner: TabBarViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presetner?.viewDidLoad()
        configure()
        setTabBar()
    }
    
    private func configure() {
        
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
    }
    
    private func setTabBar() {
        
        let newsModel = NewsAssembly.assembly()
        newsModel.tabBarItem = UITabBarItem(title: "Новости", image: UIImage(named: "book"), selectedImage: nil)
        
        
        let friendsModel = FriendsAssembly.assembly()
        friendsModel.tabBarItem = UITabBarItem(title: "Друзья", image: UIImage(named: "person.2"), selectedImage: nil)
        
        let profilModel = ProfileAssembly.assembly()
        profilModel.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "default_pic") , selectedImage: nil)
        
        viewControllers = [
            newsModel,
            friendsModel,
            profilModel
        ]
    }
}

extension TabBarView: TabBarViewInput {
    
}
