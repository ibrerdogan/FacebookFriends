//
//  UserRealmModel.swift
//  FacebookFriends
//
//  Created by İbrahim Erdogan on 30.07.2023.
//

import Foundation
import RealmSwift


class RealmModel: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var users: List<UserModelRealm>
    convenience init(users: [Person]) {
        self.init()
        self.id = ObjectId.generate()
        for i in users{
            self.users.append(i.toRealmObject())
        }
    }
}

class UserModelRealm: Object {
    @Persisted var gender: String = ""
    @Persisted var name: RealmName?
    @Persisted var location: RealmLocation?
    @Persisted var email: String = ""
    @Persisted var login: RealmLogin?
    @Persisted var dob: RealmDob?
    @Persisted var registered: RealmDob?
    @Persisted var phone: String = ""
    @Persisted var cell: String = ""
    @Persisted var id: RealmID?
    @Persisted var picture: RealmPicture?
    @Persisted var nat: String = ""

}

class RealmDob: Object {
    @Persisted var date: String = ""
    @Persisted var age: Int = 0
}

class RealmID: Object {
    @Persisted var name: String = ""
    @Persisted var value: String?
}

class RealmLocation: Object {
    @Persisted var street: RealmStreet?
    @Persisted var city: String = ""
    @Persisted var state: String = ""
    @Persisted var country: String = ""
    @Persisted var postcode: RealmPostcode?
    @Persisted var coordinates: RealmCoordinates?
    @Persisted var timezone: RealmTimezone?
}

class RealmStreet: Object {
    @Persisted var number: Int = 0
    @Persisted var name: String = ""
}

class RealmTimezone: Object {
    @Persisted var offset: String = ""
    @Persisted var descriptionText: String = ""
}

class RealmCoordinates: Object {
    @Persisted var latitude: String = ""
    @Persisted var longitude: String = ""
}

class RealmPostcode: Object {
    @Persisted var code: String = ""
    @Persisted var isInteger: Bool = false
}

class RealmLogin: Object {
    @Persisted var uuid: String = ""
    @Persisted var username: String = ""
    @Persisted var password: String = ""
    @Persisted var salt: String = ""
    @Persisted var md5: String = ""
    @Persisted var sha1: String = ""
    @Persisted var sha256: String = ""
}

class RealmName: Object {
    @Persisted var title: String = ""
    @Persisted var first: String = ""
    @Persisted var last: String = ""
}

class RealmPicture: Object {
    @Persisted var large: String = ""
    @Persisted var medium: String = ""
    @Persisted var thumbnail: String = ""
}

extension Person {
    func toRealmObject() -> UserModelRealm {
        let realmPerson = UserModelRealm()
        realmPerson.gender = gender.rawValue
        realmPerson.name = name.toRealmObject()
        realmPerson.location = location.toRealmObject()
        realmPerson.email = email
        realmPerson.login = login.toRealmObject()
        realmPerson.dob = dob.toRealmObject()
        realmPerson.registered = registered.toRealmObject()
        realmPerson.phone = phone
        realmPerson.cell = cell
        realmPerson.id = id.toRealmObject()
        realmPerson.picture = picture.toRealmObject()
        realmPerson.nat = nat
        return realmPerson
    }
}

extension UserModelRealm {
    func toNoneRealmObject() -> Person {
        let gender : Gender = gender == "male" ? .male : .female
        return Person(gender: gender,
                     name: name!.toNonRealmObject(),
                      location: location!.toNonRealmObject(),
                      email: email,
                      login: login!.toNoneRealmObject(),
                      dob: dob!.toNoneRealmObject(),
                      registered: dob!.toNoneRealmObject(),
                      phone: phone,
                      cell: cell,
                      id: id!.toNoneRealmObject(),
                      picture: picture!.toNoneRealmObject(),
                      nat: nat)
    }
}

extension Name {
    func toRealmObject() -> RealmName {
        let realmName = RealmName()
        realmName.title = title
        realmName.first = first
        realmName.last = last
        return realmName
    }
}
extension RealmName {
    func toNonRealmObject() -> Name{
        let name = Name(title: title,
                        first: first,
                        last: last)
        return name
    }
}

extension ID {
    func toRealmObject() -> RealmID {
        let realmId = RealmID()
        realmId.name = name
        realmId.value = value
        return realmId
    }
}
extension RealmID {
    func toNoneRealmObject() -> ID {
      return ID(name: name, value: value)
    }
}

extension Location {
    func toRealmObject() -> RealmLocation {
        let realmLocation = RealmLocation()
        realmLocation.street = street.toRealmObject()
        realmLocation.city = city
        realmLocation.state = state
        realmLocation.country = country
        realmLocation.postcode = postcode.toRealmObject()
        realmLocation.coordinates = coordinates.toRealmObject()
        realmLocation.timezone = timezone.toRealmObject()
        return realmLocation
    }
}

extension RealmLocation{
    func toNonRealmObject() -> Location{
        return Location(street: street!.toNoneRealmObject(),
                        city: city,
                        state: state,
                        country: country,
                        postcode: Postcode.integer(0),
                        coordinates: coordinates!.toNoneRealmObject(),
                        timezone: timezone!.toNoneRealmObject())
    }
}

extension Street {
    func toRealmObject() -> RealmStreet {
        let realmStreet = RealmStreet()
        realmStreet.number = number
        realmStreet.name = name
        return realmStreet
    }
}

extension RealmStreet{
    func toNoneRealmObject() -> Street {
        return Street(number: number, name: name)
    }
}

extension Timezone {
    func toRealmObject() -> RealmTimezone {
        let realmTimezone = RealmTimezone()
        realmTimezone.offset = offset
        realmTimezone.descriptionText = description
        return realmTimezone
    }
}

extension RealmTimezone {
    func toNoneRealmObject() -> Timezone {
        return Timezone(offset: offset, description: description)
    }
}

extension Coordinates {
    func toRealmObject() -> RealmCoordinates {
        let realmCoordinates = RealmCoordinates()
        realmCoordinates.latitude = latitude
        realmCoordinates.longitude = longitude
        return realmCoordinates
    }
}
extension RealmCoordinates {
    func toNoneRealmObject() -> Coordinates {
       return Coordinates(latitude: latitude, longitude: longitude)
    }
}

extension Postcode {
    func toRealmObject() -> RealmPostcode {
        let realmPostcode = RealmPostcode()
        switch self {
        case .integer(let intValue):
            realmPostcode.code = "\(intValue)"
            realmPostcode.isInteger = true
        case .string(let stringValue):
            realmPostcode.code = stringValue
            realmPostcode.isInteger = false
        }
        return realmPostcode
    }
}


extension Login {
    func toRealmObject() -> RealmLogin {
        let realmLogin = RealmLogin()
        realmLogin.uuid = uuid
        realmLogin.username = username
        realmLogin.password = password
        realmLogin.salt = salt
        realmLogin.md5 = md5
        realmLogin.sha1 = sha1
        realmLogin.sha256 = sha256
        return realmLogin
    }
}

extension RealmLogin{
    func toNoneRealmObject() -> Login {
        return Login(uuid: uuid, username: username, password: password, salt: salt, md5: md5, sha1: sha1, sha256: sha256)
    }
}

extension Dob {
    func toRealmObject() -> RealmDob {
        let realmDob = RealmDob()
        realmDob.date = date
        realmDob.age = age
        return realmDob
    }
}

extension RealmDob {
    func toNoneRealmObject() -> Dob {
        return Dob(date: date, age: age)
    }
}

extension Picture {
    func toRealmObject() -> RealmPicture {
        let realmPicture = RealmPicture()
        realmPicture.large = large
        realmPicture.medium = medium
        realmPicture.thumbnail = thumbnail
        return realmPicture
    }
}
extension RealmPicture {
    func toNoneRealmObject() -> Picture {
        return Picture(large: large, medium: medium, thumbnail: thumbnail)
    }
}

