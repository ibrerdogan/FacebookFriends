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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        mainViewModel.delegate = self
        mainViewModel.fetchUsers()
    }
}

extension MainViewController: MainViewModelProtocol{
    func updateUiWithUsers(_ users: [Person]) {
        print(users)
    }
    
    func fetchError(_ errorMessage: String) {
        print(errorMessage)
    }
    
}
