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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViewComponents()
        configureViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViewComponents(){
        addSubview(profilePictureImage)
        addSubview(usernameLabel)
        addSubview(userFullNameLabel)
        addSubview(userCountryLabel)
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
            userCountryLabel.trailingAnchor.constraint(equalTo: usernameLabel.trailingAnchor)
            
        ])
    }
    func setImage(_ imageUrl: String){
        let url = URL(string: imageUrl)
        let processor = DownsamplingImageProcessor(size: CGSize(width: 90, height: 90))
                     |> RoundCornerImageProcessor(cornerRadius: 45)
        profilePictureImage.kf.indicatorType = .activity
        profilePictureImage.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
    func setUserName(_ username: String,_ fullname: Name,_ location: Location){
        usernameLabel.text = username
        userFullNameLabel.text = fullname.title + " " + fullname.first + " " + fullname.last
        userCountryLabel.text = location.city+"/"+location.country
    }
}
