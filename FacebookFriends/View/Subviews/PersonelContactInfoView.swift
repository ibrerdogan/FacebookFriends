//
//  PersonelContactInfoView.swift
//  FacebookFriends
//
//  Created by İbrahim Erdogan on 30.07.2023.
//

import UIKit

class PersonelContactInfoView: UIView {

    private lazy var contactIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "phone.fill.connection")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        return imageView
    }()
    private lazy var contactInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Contact Information"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    private lazy var userCountryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    private lazy var userAdressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    private lazy var userPhoneNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    private lazy var userMailLabel: UILabel = {
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
        addSubview(contactIcon)
        addSubview(contactInfoLabel)
        addSubview(userCountryLabel)
        addSubview(userAdressLabel)
        addSubview(userPhoneNumberLabel)
        addSubview(userMailLabel)
        
    }
    private func configureViewComponents(){
        NSLayoutConstraint.activate([
            contactIcon.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            contactIcon.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
            
            contactInfoLabel.centerYAnchor.constraint(equalTo: contactIcon.centerYAnchor),
            contactInfoLabel.leadingAnchor.constraint(equalTo: contactIcon.trailingAnchor, constant: 8),
            
            userCountryLabel.topAnchor.constraint(equalTo: contactInfoLabel.bottomAnchor, constant: 8),
            userCountryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            userCountryLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            userAdressLabel.topAnchor.constraint(equalTo: userCountryLabel.bottomAnchor, constant: 5),
            userAdressLabel.leadingAnchor.constraint(equalTo: userCountryLabel.leadingAnchor),
            userAdressLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            userPhoneNumberLabel.topAnchor.constraint(equalTo: userAdressLabel.bottomAnchor, constant: 5),
            userPhoneNumberLabel.leadingAnchor.constraint(equalTo: userCountryLabel.leadingAnchor),
            userPhoneNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            userMailLabel.topAnchor.constraint(equalTo: userPhoneNumberLabel.bottomAnchor,constant: 5),
            userMailLabel.leadingAnchor.constraint(equalTo: userCountryLabel.leadingAnchor),
            userMailLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            bottomAnchor.constraint(equalTo: userMailLabel.bottomAnchor, constant: 5),
        ])
    }
    func configureView(_ contactInfo: contactInformation){
        userCountryLabel.text = contactInfo.userCountry
        userAdressLabel.text = contactInfo.userAdress
        userPhoneNumberLabel.text = contactInfo.userPhoneNumber
        userMailLabel.text = contactInfo.userMail
    }
}
