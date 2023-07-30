//
//  PersonelContactInfoView.swift
//  FacebookFriends
//
//  Created by İbrahim Erdogan on 30.07.2023.
//

import UIKit

class PersonelContactInfoView: UIView {

    private lazy var contactInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Contact Information"
        return label
    }()
    private lazy var userCountryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Contact Information"
        return label
    }()
    private lazy var userAdressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Contact Information"
        return label
    }()
    private lazy var userPhoneNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Contact Information"
        return label
    }()
    private lazy var userMailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Contact Information"
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
        addSubview(contactInfoLabel)
        addSubview(userCountryLabel)
        addSubview(userAdressLabel)
        addSubview(userPhoneNumberLabel)
        addSubview(userMailLabel)
        
    }
    private func configureViewComponents(){
        NSLayoutConstraint.activate([
            contactInfoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            contactInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            userCountryLabel.topAnchor.constraint(equalTo: contactInfoLabel.bottomAnchor, constant: 8),
            userCountryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            userAdressLabel.topAnchor.constraint(equalTo: userCountryLabel.bottomAnchor, constant: 5),
            userAdressLabel.leadingAnchor.constraint(equalTo: userCountryLabel.leadingAnchor),
            userPhoneNumberLabel.topAnchor.constraint(equalTo: userAdressLabel.bottomAnchor, constant: 5),
            userPhoneNumberLabel.leadingAnchor.constraint(equalTo: userCountryLabel.leadingAnchor),
            userMailLabel.topAnchor.constraint(equalTo: userPhoneNumberLabel.bottomAnchor,constant: 5),
            userMailLabel.leadingAnchor.constraint(equalTo: userCountryLabel.leadingAnchor),
            bottomAnchor.constraint(equalTo: userMailLabel.bottomAnchor, constant: 5),
        ])
    }
}
