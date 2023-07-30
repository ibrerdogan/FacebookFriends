//
//  MainViewController.swift
//  FacebookFriends
//
//  Created by İbrahim Erdogan on 29.07.2023.
//

import Foundation
import UIKit
class MainViewController: UIViewController {
    private var mainViewModel = MainViewModel()
    private lazy var progressIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.backgroundColor = .gray
        indicator.tintColor = .blue
        return indicator
    }()
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UserCustomCellView.self, forCellReuseIdentifier: UserCustomCellView.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.bounces = false
        tableView.estimatedRowHeight = 100
        tableView.isHidden = true
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        progressIndicator.startAnimating()
        mainViewModel.fetchUsers()
        addViewComponents()
        configureViewComponents()
        configureDelegates()
        configureNavigationBar()
    }
    private func addViewComponents(){
        view.addSubview(mainTableView)
        view.addSubview(progressIndicator)
    }
    private func configureViewComponents(){
        NSLayoutConstraint.activate([
            progressIndicator.topAnchor.constraint(equalTo: view.topAnchor),
            progressIndicator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            progressIndicator.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            progressIndicator.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 5),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -5),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    private func configureDelegates(){
        mainViewModel.delegate = self
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    private func configureNavigationBar(){
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.title = "Your Friends"
    }
}

extension MainViewController: MainViewModelProtocol{
    func updateUiWithUsers(_ users: [Person]) {
        DispatchQueue.main.async {[weak self] in
            self?.progressIndicator.removeFromSuperview()
            self?.mainTableView.isHidden = false
            self?.mainTableView.reloadData()
        }
    }
    
    func fetchError(_ errorMessage: String) {
        progressIndicator.removeFromSuperview()
        showAlert(errorMessage)
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return mainViewModel.userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: UserCustomCellView.identifier, for: indexPath) as! UserCustomCellView
        cell.configureCell(mainViewModel.userList[indexPath.row])
        cell.setupShadow()
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(UserDetailViewController(user: mainViewModel.userList[indexPath.row]), animated: true)
    }
    
}
extension MainViewController{
    func showAlert(_ alertMessage: String) {
        let alertController = UIAlertController(title: "Error", message: alertMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
