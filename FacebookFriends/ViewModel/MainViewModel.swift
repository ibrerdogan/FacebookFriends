//
//  MainViewModel.swift
//  FacebookFriends
//
//  Created by İbrahim Erdogan on 29.07.2023.
//


import Foundation
import Realm
import RealmSwift
class MainViewModel {
    private var apiService = UserApiService()
    var userList = [Person]()
    weak var delegate: MainViewModelProtocol?
    func fetchUsers(){
        apiService.fetch(type: Results.self, url: URL(string: Keys.urlString)) { response in
            switch response {
            case .success(let success):
               self.saveUsersToRealm(success.results)
               self.userList = success.results
               self.delegate?.updateUiWithUsers(success.results)
            case .failure(let failure):
                self.getUsersFromRealm()
                self.delegate?.fetchError(failure.localizedDescription)
            }
        }
    }
    private func saveUsersToRealm(_ users: [Person]){
        do{
            let realm = try Realm()
            let realmModel = RealmModel(users: users)
            try! realm.write {
                realm.add(realmModel)
            }
        }
        catch{
            delegate?.fetchError("Realm Failed")
        }
    }
    
    private func getUsersFromRealm() {
        do{
            let realm = try Realm()
            if let result = realm.objects(RealmModel.self).first{
                for i in result.users{
                    userList.append(i.toNoneRealmObject())
                }
                delegate?.updateUiWithUsers(userList)
            }
        }catch{
            delegate?.fetchError("Realm Failed")
        }
    }
}

protocol MainViewModelProtocol: NSObject {
    func updateUiWithUsers(_ users: [Person])
    func fetchError(_ errorMessage: String)
}
