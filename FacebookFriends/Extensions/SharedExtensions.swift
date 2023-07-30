//
//  SharedExtensions.swift
//  FacebookFriends
//
//  Created by İbrahim Erdogan on 29.07.2023.
//

import Foundation
import UIKit
import Kingfisher
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

extension UIView{
    func setupShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 4
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.masksToBounds = false
    }
}

extension UIImageView{
    func setUrlImage(_ imageUrl: String,imageSize: CGSize){
        let url = URL(string: imageUrl)
        let processor = DownsamplingImageProcessor(size: CGSize(width: imageSize.width, height: imageSize.height))
        |> RoundCornerImageProcessor(cornerRadius: imageSize.height / 2)
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
}
