//
//  WebPageViewViewController.swift
//  Social Networking
//
//  Created by Anastas Smekh on 01.03.2021.
//

import UIKit
import WebKit

protocol WebPageViewOutput {
    func viewDidLoad()
    func viewDidAppear()
    func loadingRequestForWeb() -> URLRequest // создания ссылки и передача для формы авторизации
//    func transferOfToken(_ token: String)
    func transitionData(_ data: String)
    func transition()
}

protocol WebPageViewInput: class {
    var navigationController: UINavigationController? {get}
    
}

final class WebPageView: BaseViewController {
    
    var presenter: WebPageViewOutput?
    
    
    private lazy var webView: WKWebView = {
        let web = WKWebView()
        web.navigationDelegate = self
        return web
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
    }
    
    private func configure() {
        view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
        }
        let data = presenter?.loadingRequestForWeb()
        let request = data
        webView.load(request!)
    }
}

//MARK: - WebPageViewInput
extension WebPageView: WebPageViewInput {
    
}

//MARK: - WKNavigationDelegate
extension WebPageView: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        presenter?.transitionData(fragment)
        presenter?.transition()
        decisionHandler(.cancel)

    }
}

