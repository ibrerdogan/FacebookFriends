//
//  UserDetailViewModel.swift
//  FacebookFriends
//
//  Created by İbrahim Erdogan on 30.07.2023.
//

import Foundation
import MapKit
class UserDetailViewModel {
    weak var delegate: UserDetailViewModelDelegate?
    func formatPersonForUI(_ user: Person){
        let username = "@" + user.login.username
        let fullName = user.name.title + " " + user.name.first + " " + user.name.last
        let userAgeAndGender = user.gender.rawValue + " / \(user.dob.age)"
        let userBirthDate = user.dob.date
        let imageUrl = user.picture.large
        let userCountry = user.location.country
        let userPhoneNumber = user.phone
        let userMail = user.email
        let userAdress = user.location.state + " " + user.location.city + " " + user.location.street.name + " \(user.location.street.number)"
        delegate?.updatePersonelInfo(personelInformation(fullName: fullName,
                                                         userAgeAndGender: userAgeAndGender,
                                                         userBirthDate: userBirthDate.formatDate(userBirthDate)))
        delegate?.updateContactInfo(contactInformation(userCountry: userCountry,
                                                       userAdress: userAdress,
                                                       userPhoneNumber: userPhoneNumber,
                                                       userMail: userMail))
        delegate?.updateUI(username: username,
                           imageUrl: imageUrl,
                           userLocation: createUserLocation(latitute: user.location.coordinates.latitude,
                                                            longitute: user.location.coordinates.longitude))
        
       
    }
    
    func createUserLocation(latitute: String, longitute: String) -> CLLocationCoordinate2D{
        let latitute = Double(latitute) ?? 0
        let longitute = Double(longitute) ?? 0
        return CLLocationCoordinate2D(latitude: latitute,
                                            longitude: longitute)
       
    }
}

protocol UserDetailViewModelDelegate: AnyObject{
    func updateUI(username: String, imageUrl: String, userLocation: CLLocationCoordinate2D)
    func updatePersonelInfo(_ personelInfo: personelInformation)
    func updateContactInfo(_ contactInfo : contactInformation)
}

struct personelInformation{
    let fullName: String
    let userAgeAndGender: String
    let userBirthDate: String
    init(fullName: String, userAgeAndGender: String, userBirthDate: String) {
        self.fullName = fullName
        self.userAgeAndGender = userAgeAndGender
        self.userBirthDate = userBirthDate
    }
}

struct contactInformation{
    let userCountry: String
    let userAdress: String
    let userPhoneNumber: String
    let userMail: String
    init(userCountry: String, userAdress: String, userPhoneNumber: String, userMail: String) {
        self.userCountry = userCountry
        self.userAdress = userAdress
        self.userPhoneNumber = userPhoneNumber
        self.userMail = userMail
    }
}
