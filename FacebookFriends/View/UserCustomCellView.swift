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
    }
    private func configureViewComponents(){
        NSLayoutConstraint.activate([
            profilePictureImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            profilePictureImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            profilePictureImage.heightAnchor.constraint(equalToConstant: 90),
            profilePictureImage.widthAnchor.constraint(equalToConstant: 90)
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
}
