//
//  UserDetails.swift
//  iOSTask
//
//  Created by Fuad Hasan on 21/5/21.
//

import Foundation

//
//.init(propertyName: "Full Name", propertyValue: "\(user?.name.title ?? "") \(user?.name.first ?? "") \(user?.name.last ?? "")"),
//.init(propertyName: "Address", propertyValue: "\(user?.location?.street?.number ?? 0) - \((user?.location?.street?.number ?? 0))"),
//.init(propertyName: "City", propertyValue: ""),
//.init(propertyName: "State", propertyValue: ""),
//.init(propertyName: "Country", propertyValue: ""),
//.init(propertyName: "Email", propertyValue: ""),
//.init(propertyName: "Cell", propertyValue: ""),
//.init(propertyName: "Phone", propertyValue: "")

enum  PropertyName:String {
    
    case fullName = "Full Name"
    case address = "Address"
    case city = "City"
    case state = "State"
    case country = "Country"
    case email = "Email"
    case cell = "Cell"
    case phone = "Phone"
    
    
    
}

struct UserDetails {
    
    let propertyName:PropertyName
    let propertyValue:String
    
}
