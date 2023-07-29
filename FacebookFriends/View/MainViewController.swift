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
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        mainViewModel.fetchUsers()
        addViewComponents()
        configureViewComponents()
        configureDelegates()
        configureNavigationBar()
    }
    private func addViewComponents(){
        view.addSubview(mainTableView)
    }
    private func configureViewComponents(){
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
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
            self?.mainTableView.reloadData()
        }
    }
    
    func fetchError(_ errorMessage: String) {
        print(errorMessage)
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return mainViewModel.userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = mainViewModel.userList[indexPath.row].name.first
        return cell
    }
    
    
}
