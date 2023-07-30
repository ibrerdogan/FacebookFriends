//
//  PersonelInformationView.swift
//  FacebookFriends
//
//  Created by İbrahim Erdogan on 30.07.2023.
//

import UIKit

class PersonelInformationView: UIView {

    private lazy var personalIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.crop.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        return imageView
    }()
    private lazy var personelInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Personel Information"
        return label
    }()
    private lazy var userFullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    private lazy var userAgeAndGenderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    private lazy var userBirthDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViewComponents()
        configureViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViewComponents(){
        addSubview(personelInfoLabel)
        addSubview(personalIcon)
        addSubview(userFullNameLabel)
        addSubview(userAgeAndGenderLabel)
        addSubview(userBirthDateLabel)
        
    }
    private func configureViewComponents(){
        NSLayoutConstraint.activate([
            
            personalIcon.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            personalIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            personelInfoLabel.centerYAnchor.constraint(equalTo: personalIcon.centerYAnchor),
            personelInfoLabel.leadingAnchor.constraint(equalTo: personalIcon.trailingAnchor, constant: 8),
            
            userFullNameLabel.topAnchor.constraint(equalTo: personelInfoLabel.bottomAnchor, constant: 8),
            userFullNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            userFullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            userAgeAndGenderLabel.topAnchor.constraint(equalTo: userFullNameLabel.bottomAnchor, constant: 5),
            userAgeAndGenderLabel.leadingAnchor.constraint(equalTo: userFullNameLabel.leadingAnchor),
            userAgeAndGenderLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            userBirthDateLabel.topAnchor.constraint(equalTo: userAgeAndGenderLabel.bottomAnchor, constant: 5),
            userBirthDateLabel.leadingAnchor.constraint(equalTo: userFullNameLabel.leadingAnchor),
            userBirthDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            bottomAnchor.constraint(equalTo: userBirthDateLabel.bottomAnchor, constant: 5),
        ])
    }
    func configureView(_ personelInfo: personelInformation){
        userFullNameLabel.text = personelInfo.fullName
        userAgeAndGenderLabel.text = personelInfo.userAgeAndGender
        userBirthDateLabel.text = personelInfo.userBirthDate
    }
    
}
