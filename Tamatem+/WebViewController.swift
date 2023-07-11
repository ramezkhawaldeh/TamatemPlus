//
//  WebViewController.swift
//  Tamatem+
//
//  Created by Ramez Khawaldeh on 11/07/2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var urlPath: String
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        return stackView
    }()
    
    lazy var progressBar: UIProgressView = {
        let progressBar = UIProgressView(progressViewStyle: .default)
        progressBar.sizeToFit()
        return progressBar
    }()
    
    lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        return webView
    }()
    
//MARK: - Initializer
    init(urlPath: String) {
        self.urlPath = urlPath

        super.init(nibName: nil, bundle: nil)

        configureNavigationItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//MARK: - NavBar Items
    private func configureNavigationItems() {
        let dismissItem = UIBarButtonItem(title: "Close",
                                          style: .plain,
                                          target: self,
                                          action: #selector(dismissView))
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(goBackwards))
        
        let forwardButton = UIBarButtonItem(image: UIImage(systemName: "arrow.forward"),
                                            style: .plain,
                                            target: self,
                                            action: #selector(goForward))
        
        let refreshButton = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"),
                                            style: .plain,
                                            target: self,
                                            action: #selector(refreshPage))
        
        navigationItem.rightBarButtonItems = [dismissItem, refreshButton]
        navigationItem.leftBarButtonItems = [backButton, forwardButton]
    }

//MARK: - ViewDidLoad
    override func viewDidLoad() {
        configureViews()
    }

//MARK: - Views configuration
    private func configureViews() {
        stackView.addArrangedSubview(progressBar)
        stackView.addArrangedSubview(webView)
        
        progressBar.sizeToFit()
        view.backgroundColor = .white
        
    }

// MARK: - NavBarItems actions
    @objc private func dismissView() {
        self.dismiss(animated: true)
    }
    
    @objc private func goBackwards() {
        webView.goBack()
    }
    
    @objc private func goForward() {
        webView.goForward()
    }
    
    @objc private func refreshPage() {
        webView.reload()
    }
}

extension WebViewController: WKNavigationDelegate {}
