//
//  LoginViewModel.swift
//  FacebookFriends
//
//  Created by İbrahim Erdogan on 29.07.2023.
//

import Foundation


class LoginViewModel{
    private let validUsernames: [String] = ["9nd54","v542w","17pcy0","gbf48","zdah4"]
    private(set) var isLogin: Bool! {
        didSet{
            if isLogin{
                self.loginSuccess!(isLogin)
            }else{
                self.loginFailed!("Your username or password wrong please try again")
            }
        }
    }
    var loginSuccess: ((Bool)->())?
    var loginFailed: ((String)->())?
    func loginUser(_ username: String,_ password: String){
        if !username.isEmpty && !password.isEmpty{
            checkusername(username)
        }else{
            loginFailed!("Username and password fields should fill")
        }
    }
    private func checkusername(_ username: String){
        //isLogin = validUsernames.contains(where: {$0 == username})
        isLogin = true
    }
   
}
