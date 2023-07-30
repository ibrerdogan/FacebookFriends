//
//  UserCustomCellViewModel.swift
//  FacebookFriends
//
//  Created by İbrahim Erdogan on 30.07.2023.
//

import Foundation

protocol UserCustomCellViewModelDelegate: AnyObject{
    func updateUI(_ username: String,_ fullName: String,_ locationString: String,_ imageUrl: String)
}

class UserCustomCellViewModel{
    weak var delegate: UserCustomCellViewModelDelegate?
   
    func formatPersonForUI(_ user: Person){
        let username = user.login.username
        let fullName = user.name.title + " " + user.name.first + " " + user.name.last
        let location = user.location.city+"/"+user.location.country
        let imageUrl = user.picture.medium
        delegate?.updateUI(username, fullName, location,imageUrl)
    }
    
}
