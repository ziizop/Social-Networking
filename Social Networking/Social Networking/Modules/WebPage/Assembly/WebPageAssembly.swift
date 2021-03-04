import UIKit

final class WebPageAssembly {
    static func assembly() -> UIViewController {
        let view = WebPageView()
        let interactor = WebPageInteractor()
        let presenter = WebPagePresenter()
        let router = WebPageRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        return view
    }
}
