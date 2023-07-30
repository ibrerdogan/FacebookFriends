//
//  UserCustomCellView.swift
//  FacebookFriends
//
//  Created by İbrahim Erdogan on 30.07.2023.
//

import Foundation
import UIKit
import Kingfisher

class UserCustomCellView: UITableViewCell {
    static let identifier = "UserCustomCellView"
    private var userCustomCellViewModel = UserCustomCellViewModel()
    private lazy var profilePictureImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    private lazy var userFullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    private lazy var userCountryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    private lazy var rightIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .black
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViewComponents()
        configureViewComponents()
        userCustomCellViewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViewComponents(){
        addSubview(profilePictureImage)
        addSubview(usernameLabel)
        addSubview(userFullNameLabel)
        addSubview(userCountryLabel)
        addSubview(rightIcon)
    }
    private func configureViewComponents(){
        NSLayoutConstraint.activate([
            profilePictureImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            profilePictureImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            profilePictureImage.heightAnchor.constraint(equalToConstant: 90),
            profilePictureImage.widthAnchor.constraint(equalToConstant: 90),
            usernameLabel.topAnchor.constraint(equalTo: profilePictureImage.topAnchor, constant: 15),
            usernameLabel.leadingAnchor.constraint(equalTo: profilePictureImage.trailingAnchor, constant: 10),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            userFullNameLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5),
            userFullNameLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            userFullNameLabel.trailingAnchor.constraint(equalTo: usernameLabel.trailingAnchor),
            
            userCountryLabel.topAnchor.constraint(equalTo: userFullNameLabel.bottomAnchor,constant: 5),
            userCountryLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            userCountryLabel.trailingAnchor.constraint(equalTo: usernameLabel.trailingAnchor),
            
            rightIcon.centerYAnchor.constraint(equalTo: profilePictureImage.centerYAnchor),
            rightIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            rightIcon.heightAnchor.constraint(equalToConstant: 25),
            rightIcon.widthAnchor.constraint(equalToConstant: 25)
            
        ])
    }
    func configureCell(_ user: Person){
        userCustomCellViewModel.formatPersonForUI(user)
    }
}
extension UserCustomCellView: UserCustomCellViewModelDelegate{
    func updateUI(_ username: String, _ fullName: String, _ locationString: String, _ imageUrl: String) {
        usernameLabel.text = username
        userFullNameLabel.text = fullName
        userCountryLabel.text = locationString
        profilePictureImage.setUrlImage(imageUrl, imageSize: CGSize(width: 90, height: 90))
    }
    
    
}
