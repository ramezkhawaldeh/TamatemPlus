//
//  ViewController.swift
//  Tamatem+
//
//  Created by Ramez Khawaldeh on 11/07/2023.
//

import UIKit

final class InitialViewController: UIViewController {

    lazy var openBrowserButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)

        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true

        button.addTarget(self, action: #selector(didPressOpenBrowserButton), for: .touchUpInside)
       
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupOpenBrowserButtonTitle()
    }
    
    private func setupOpenBrowserButtonTitle() {
        openBrowserButton.setTitle("Open Browser", for: .normal)
        openBrowserButton.setTitleColor(.blue, for: .normal)
    }

    @objc func didPressOpenBrowserButton() {
  
    }

}

