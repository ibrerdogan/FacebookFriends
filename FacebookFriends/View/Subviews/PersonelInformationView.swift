//
//  PersonelInformationView.swift
//  FacebookFriends
//
//  Created by İbrahim Erdogan on 30.07.2023.
//

import UIKit

class PersonelInformationView: UIView {

    private lazy var personelInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Personel Information"
        return label
    }()
    private lazy var userFullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var userAgeAndGenderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var userBirthDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(userFullNameLabel)
        addSubview(userAgeAndGenderLabel)
        addSubview(userBirthDateLabel)
        
    }
    private func configureViewComponents(){
        NSLayoutConstraint.activate([
            personelInfoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            personelInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            userFullNameLabel.topAnchor.constraint(equalTo: personelInfoLabel.bottomAnchor, constant: 8),
            userFullNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            userAgeAndGenderLabel.topAnchor.constraint(equalTo: userFullNameLabel.bottomAnchor, constant: 5),
            userAgeAndGenderLabel.leadingAnchor.constraint(equalTo: userFullNameLabel.leadingAnchor),
            userBirthDateLabel.topAnchor.constraint(equalTo: userAgeAndGenderLabel.bottomAnchor, constant: 5),
            userBirthDateLabel.leadingAnchor.constraint(equalTo: userFullNameLabel.leadingAnchor),
            bottomAnchor.constraint(equalTo: userBirthDateLabel.bottomAnchor, constant: 5),
        ])
    }
    func configureView(_ personelInfo: personelInformation){
        userFullNameLabel.text = personelInfo.fullName
        userAgeAndGenderLabel.text = personelInfo.userAgeAndGender
        userBirthDateLabel.text = personelInfo.userBirthDate
    }
    
}
