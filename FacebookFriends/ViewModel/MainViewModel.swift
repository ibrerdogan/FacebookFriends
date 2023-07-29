//
//  MainViewModel.swift
//  FacebookFriends
//
//  Created by İbrahim Erdogan on 29.07.2023.
//


import Foundation
class MainViewModel {
    private var apiService = UserApiService()
    weak var delegate: MainViewModelProtocol?
    func fetchUsers(){
        apiService.fetch(type: Results.self, url: URL(string: Keys.urlString)) { response in
            switch response {
            case .success(let success):
                self.delegate?.updateUiWithUsers(success.results)
            case .failure(let failure):
                self.delegate?.fetchError(failure.localizedDescription)
            }
        }
    }
}

protocol MainViewModelProtocol: NSObject {
    func updateUiWithUsers(_ users: [Person])
    func fetchError(_ errorMessage: String)
}
