//
//  UserDetailViewController.swift
//  FacebookFriends
//
//  Created by İbrahim Erdogan on 30.07.2023.
//

import UIKit

class UserDetailViewController: UIViewController {

    var user: Person
    var userDetailViewModel = UserDetailViewModel()
    private lazy var userImage: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var personelInfoView: PersonelInformationView = {
        let view = PersonelInformationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    private lazy var contactInfoView: PersonelContactInfoView = {
        let view = PersonelContactInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    init(user: Person){
        self.user = user
        super.init(nibName: nil, bundle: nil)
        userDetailViewModel.delegate = self
        userDetailViewModel.formatPersonForUI(self.user)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViewComponents()
        configureViewComponents()
    }
    private func addViewComponents(){
        view.addSubview(userImage)
        view.addSubview(usernameLabel)
        view.addSubview(personelInfoView)
        view.addSubview(contactInfoView)
    }
    private func configureViewComponents(){
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userImage.heightAnchor.constraint(equalToConstant: 120),
            userImage.widthAnchor.constraint(equalToConstant: 120),
            
            usernameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 10),
            usernameLabel.centerXAnchor.constraint(equalTo: userImage.centerXAnchor),
            
            personelInfoView.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 15),
            personelInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            personelInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            contactInfoView.topAnchor.constraint(equalTo: personelInfoView.bottomAnchor, constant: 15),
            contactInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            contactInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            
        ])
    }
    
}

extension UserDetailViewController: UserDetailViewModelDelegate {
    func updateUI(username: String, imageUrl: String) {
        usernameLabel.text = username
        userImage.setUrlImage(imageUrl, imageSize: CGSize(width: 120, height: 120))
    }
    
    func updateContactInfo(_ contactInfo: contactInformation) {
        contactInfoView.configureView(contactInfo)
    }
    
    
    func updatePersonelInfo(_ personelInfo: personelInformation) {
        personelInfoView.configureView(personelInfo)
    }
    
    
}
