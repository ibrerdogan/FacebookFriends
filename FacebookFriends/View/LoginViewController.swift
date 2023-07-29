//
//  ViewController.swift
//  FacebookFriends
//
//  Created by İbrahim Erdogan on 29.07.2023.
//

import UIKit

class LoginViewController: UIViewController {

    private lazy var loginFormContainerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 13
        return stackView
    }()
    private lazy var usernameTextField: UITextField = {
        let username = UITextField()
        username.createUsernameField(" username",isSecureField: false)
        username.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return username
    }()
    private lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.createUsernameField(" password", isSecureField: true)
        password.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return password
    }()
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.createCustomButton("Login")
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViewComponents()
        configureViewComponents()
        
    }
    private func addViewComponents(){
        view.addSubview(loginFormContainerStackView)
    }
    private func configureViewComponents(){
        NSLayoutConstraint.activate([
            loginFormContainerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginFormContainerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginFormContainerStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
        [usernameTextField,passwordTextField,loginButton].forEach { view in
            loginFormContainerStackView.addArrangedSubview(view)
        }
    }

}

