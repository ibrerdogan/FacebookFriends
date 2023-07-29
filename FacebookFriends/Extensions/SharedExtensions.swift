//
//  SharedExtensions.swift
//  FacebookFriends
//
//  Created by İbrahim Erdogan on 29.07.2023.
//

import Foundation
import UIKit

extension UITextField{
    func createUsernameField(_ placeholder: String?,isSecureField: Bool){
        backgroundColor = .white
        isSecureTextEntry = isSecureField
        font = UIFont.systemFont(ofSize: 18)
        textAlignment = .left
        translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = placeholder
        borderStyle = .none
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
    }
}

extension UIButton{
    func createCustomButton(_ btnText: String){
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(btnText, for: .normal)
        backgroundColor = .blue
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.systemFont(ofSize: 20)
        layer.cornerRadius = 10
    }
}
